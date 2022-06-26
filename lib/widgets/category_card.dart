import 'package:category_repo/category_repo.dart';
import 'package:flutter/material.dart';

import '../constants/app.dart' as const_app;
import '../constants/measures.dart' as const_measures;
import '../constants/routes.dart' as const_routes;
import '../l10n/l10n.dart';
import 'widgets.dart';

const _separator = SizedBox(height: 4.0);

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final ci = ConnectionInherited.of(context);
    final image = category.image;

    return InkWell(
      borderRadius: BorderRadius.circular(const_measures.borderRadius),
      onTap: () => _toProducts(context, ci),
      child: Padding(
        padding: const EdgeInsets.all(
          const_measures.smallPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  const_measures.borderRadius,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      const_measures.borderRadius,
                    ),
                    border: Border.all(),
                  ),
                  child: image.isNotEmpty
                      ? Image.network(
                          image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, trace) {
                            return const Icon(Icons.photo);
                          },
                        )
                      : const Icon(Icons.photo),
                ),
              ),
            ),
            _separator,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.title,
                  style: theme.textTheme.headline5,
                ),
                Text(
                  l10n.pieces(category.amountOfProducts),
                  style: theme.textTheme.subtitle2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _toProducts(BuildContext context, ConnectionInherited ci) {
    Navigator.of(context).pushNamed(
      const_routes.products,
      arguments: {
        const_app.category: category,
        const_app.hasConnection: ci.hasConnection,
      },
    );
  }
}
