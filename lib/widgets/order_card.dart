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

    return Padding(
      padding: const EdgeInsets.all(
        const_measures.midVerPadding,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.disabledColor,
          borderRadius: BorderRadius.circular(
            const_measures.bigBorderRadius,
          ),
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

                return Row(
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
