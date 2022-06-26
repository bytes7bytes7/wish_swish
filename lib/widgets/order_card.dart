import 'package:flutter/material.dart';
import 'package:order_repo/order_repo.dart';

import '../common.dart';
import '../constants/app.dart' as const_app;
import '../constants/measures.dart' as const_measures;
import '../l10n/l10n.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: const_measures.smallPadding,
      ),
      decoration: BoxDecoration(
        color: theme.disabledColor,
        borderRadius: BorderRadius.circular(
          const_measures.bigBorderRadius,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          const_measures.midVerPadding,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  l10n.order(order.number),
                  style: theme.textTheme.headline5,
                ),
                Container(
                  padding: const EdgeInsets.all(
                    const_measures.smallPadding,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      const_measures.smallBorderRadius,
                    ),
                    border: Border.all(
                      color: theme.hintColor,
                    ),
                  ),
                  child: Text(
                    '${beautifyCost(order.totalCost)} ${const_app.rubleSign}',
                    style: theme.textTheme.headline3,
                  ),
                ),
              ],
            ),
            ...List.generate(
              order.products.length,
              (index) {
                final ord = order.products[index];
                final title = ord.title;
                final cost = ord.cost;

                return _OrderItem(
                  title: title,
                  cost: cost,
                  theme: theme,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItem extends StatelessWidget {
  const _OrderItem({
    // ignore: unused_element
    super.key,
    required this.title,
    required this.cost,
    required this.theme,
  });

  final String title;
  final double cost;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: const_measures.midVerPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyText1,
          ),
          Text(
            '${beautifyCost(cost)} ${const_app.rubleSign}',
            style: theme.textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
