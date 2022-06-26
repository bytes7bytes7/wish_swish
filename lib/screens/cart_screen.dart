import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_repo/product_repo.dart';

import '../blocs/blocs.dart';
import '../common.dart';
import '../constants/app.dart' as const_app;
import '../constants/measures.dart' as const_measures;
import '../custom/always_bouncing_scroll_physics.dart';
import '../l10n/l10n.dart';
import '../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final cartBloc = context.read<CartBloc>();
    var listState = _ListState.init;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            double? cost;

            if (state is CartInitState) {
              _onRefresh(cartBloc);
            } else if (state is CartDataState) {
              cost = state.cost;
            }

            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: const_measures.verPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.total,
                    style: theme.textTheme.headline3,
                  ),
                  if (cost != null)
                    Text(
                      '${beautifyCost(cost)} ${const_app.rubleSign}',
                      style: theme.textTheme.headline3,
                    )
                  else
                    const LoadingCircle(),
                ],
              ),
            );
          },
        ),
        Expanded(
          child: BlocBuilder<CartBloc, CartState>(
            buildWhen: (prev, curr) {
              if (curr is CartDataState) {
                if (listState == _ListState.init) {
                  if (curr.products.isNotEmpty) {
                    listState = _ListState.data;
                  } else {
                    listState = _ListState.empty;
                  }

                  return true;
                } else if (listState == _ListState.data &&
                    curr.products.isEmpty) {
                  listState = _ListState.empty;

                  return true;
                }
              }

              return false;
            },
            builder: (context, state) {
              if (state is CartDataState) {
                if (listState == _ListState.init) {
                  if (state.products.isNotEmpty) {
                    listState = _ListState.data;
                  } else {
                    listState = _ListState.empty;
                  }
                } else if (listState == _ListState.data &&
                    state.products.isEmpty) {
                  listState = _ListState.empty;
                }
              }

              final products =
                  (state is CartDataState) ? state.products : <Product>[];
              final isLoading = state is CartLoadingState;

              return Column(
                children: [
                  Flexible(
                    child: _ProductList(
                      l10n: l10n,
                      theme: theme,
                      products: products,
                      isLoading: isLoading,
                      cartBloc: cartBloc,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: const_measures.verPadding,
                    ),
                    child: BigButton(
                      onPressed: products.isNotEmpty
                          ? () {
                              cartBloc.add(const CartOrderEvent());
                            }
                          : null,
                      child: Text(
                        l10n.pay,
                        style: theme.textTheme.button,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _onRefresh(CartBloc cartBloc) async {
    cartBloc.add(const CartLoadEvent());
  }
}

enum _ListState {
  init,
  data,
  empty,
}

class _ProductList extends StatefulWidget {
  const _ProductList({
    // ignore: unused_element
    super.key,
    required this.l10n,
    required this.theme,
    required this.products,
    required this.isLoading,
    required this.cartBloc,
  });

  final AppLocalizations l10n;
  final ThemeData theme;
  final List<Product> products;
  final bool isLoading;
  final CartBloc cartBloc;

  @override
  State<_ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<_ProductList> {
  late final ValueNotifier<int> _notifier;

  @override
  void initState() {
    super.initState();

    _notifier = ValueNotifier(widget.products.length);
  }

  @override
  void dispose() {
    _notifier.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = List<Product>.from(widget.products);

    if (widget.isLoading) {
      return const Center(
        child: LoadingCircle(),
      );
    }

    if (products.isEmpty) {
      return Center(
        child: Text(
          widget.l10n.empty,
          style: widget.theme.textTheme.bodyText1,
        ),
      );
    }

    return ValueListenableBuilder<int>(
      valueListenable: _notifier,
      builder: (context, value, child) {
        return ListView.builder(
          physics: const AlwaysBouncingScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return ProductCard(
              product: product,
              cartBloc: widget.cartBloc,
              isInCart: true,
              onPressed: () => _remove(products, product),
            );
          },
        );
      },
    );
  }

  void _remove(List<Product> products, Product product) {
    widget.cartBloc.add(CartRemoveEvent(product: product));
    products.removeWhere((e) => e.id == product.id);
    _notifier.value = products.length;
  }
}
