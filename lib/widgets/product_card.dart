import 'package:flutter/material.dart';
import 'package:product_repo/product_repo.dart';

import '../blocs/blocs.dart';
import '../common.dart';
import '../constants/app.dart' as const_app;
import '../constants/measures.dart' as const_measures;
import 'notifier_button.dart';

const _height = 60.0;

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.isInCart,
    required this.cartBloc,
    this.onPressed,
  });

  final Product product;
  final bool isInCart;
  final CartBloc cartBloc;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final image = product.image;

    return Padding(
      padding: const EdgeInsets.all(
        const_measures.smallPadding,
      ),
      child: SizedBox(
        height: _height,
        child: IntrinsicHeight(
          child: Row(
            children: [
              SizedBox(
                height: _height,
                width: const_measures.productImageWidth,
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
              const SizedBox(
                width: const_measures.smallPadding,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        product.title,
                        style: theme.textTheme.bodyText1,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 9.25,
                          right: 5.25,
                        ),
                        child: Icon(
                          Icons.star,
                          size: 18,
                        ),
                      ),
                      Text(
                        '${product.rating}',
                        style: theme.textTheme.bodyText2,
                      ),
                    ],
                  ),
                  Text(
                    '${beautifyCost(product.cost)} ${const_app.rubleSign}',
                    style: theme.textTheme.headline3,
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: const_measures.smallButtonSize,
                width: const_measures.smallButtonSize,
                child: NotifierButton(
                  key: ValueKey(product.hashCode),
                  initValue: isInCart,
                  onTrueChild: const Icon(Icons.delete_outline),
                  onFalseChild: const Icon(Icons.shopping_cart_outlined),
                  onTrueCallback: () {
                    _remove();
                    onPressed?.call();
                  },
                  onFalseCallback: () {
                    _add();
                    onPressed?.call();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _add() {
    cartBloc.add(
      CartPickEvent(product: product),
    );
  }

  void _remove() {
    cartBloc.add(
      CartRemoveEvent(product: product),
    );
  }
}
