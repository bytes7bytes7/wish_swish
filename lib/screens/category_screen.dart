import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../constants/measures.dart' as const_measures;
import '../custom/always_bouncing_scroll_physics.dart';
import '../l10n/l10n.dart';
import '../widgets/widgets.dart';

const _crossAxisCount = 2;
const _childAspectRatio = 5 / 4;

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final hasConnection = ConnectionInherited.of(context).hasConnection;
    final categoryBloc = context.read<CategoryBloc>();

    return RefreshIndicator(
      notificationPredicate: (_) => hasConnection.value,
      onRefresh: () => _onRefresh(categoryBloc),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryInitState) {
            _onRefresh(categoryBloc);
          }

          if (state is CategoryDataState) {
            final categories = state.categories;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: const_measures.verPadding,
                  ),
                  child: Text(
                    l10n.catalog,
                    style: theme.textTheme.headline3,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    physics: const AlwaysBouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _crossAxisCount,
                      childAspectRatio: _childAspectRatio,
                      crossAxisSpacing: const_measures.mainHorPadding,
                      mainAxisSpacing: const_measures.mainHorPadding,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        category: categories[index],
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const LoadingCircle();
        },
      ),
    );
  }

  Future<void> _onRefresh(CategoryBloc categoryBloc) async {
    categoryBloc.add(const CategoryLoadEvent());
  }
}
