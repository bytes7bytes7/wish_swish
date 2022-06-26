import 'package:category_repo/category_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_repo/product_repo.dart';

import '../blocs/blocs.dart';
import '../constants/measures.dart' as const_measures;
import '../custom/always_bouncing_scroll_physics.dart';
import '../widgets/widgets.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({
    super.key,
    required this.category,
    required this.hasConnection,
  });

  final Category category;
  final ValueNotifier<bool> hasConnection;

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();

    return Scaffold(
      appBar: NetworkAppBar(
        title: category.title,
        hasConnection: hasConnection,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: const_measures.mainHorPadding,
          ),
          child: BlocProvider(
            create: (context) => ProductBloc(
              const FakeProductRepo(),
              cartBloc,
            ),
            child: Builder(
              builder: (context) {
                final productBloc = context.read<ProductBloc>();

                return RefreshIndicator(
                  notificationPredicate: (_) => hasConnection.value,
                  onRefresh: () => _onRefresh(productBloc),
                  child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductInitState) {
                        _onRefresh(productBloc);
                      }

                      if (state is ProductDataState) {
                        final wrappers = state.products;

                        return ListView.builder(
                          physics: const AlwaysBouncingScrollPhysics(),
                          itemCount: wrappers.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: const_measures.verPadding,
                              ),
                              child: ProductCard(
                                product: wrappers[index].product,
                                isInCart: wrappers[index].isInCart,
                                cartBloc: cartBloc,
                              ),
                            );
                          },
                        );
                      }

                      return const LoadingCircle();
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh(ProductBloc productBloc) async {
    productBloc.add(
      ProductLoadEvent(
        categoryID: category.id,
      ),
    );
  }
}
