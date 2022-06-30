import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../constants/measures.dart' as const_measures;
import '../l10n/l10n.dart';
import '../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final orderBloc = context.read<OrderBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccessState) {
                return UserCard(
                  user: state.user,
                );
              }

              return const Center(
                child: LoadingCircle(),
              );
            },
          ),
        ),
        Flexible(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: const_measures.smallPadding,
                ),
                child: Text(
                  l10n.orderHistory,
                  style: theme.textTheme.headline4,
                ),
              ),
              BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  if (state is OrderInitState) {
                    orderBloc.add(const OrderLoadEvent());
                  }

                  if (state is OrderDataState) {
                    final orders = state.orders;

                    if (orders.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: const_measures.verPadding,
                          ),
                          child: Text(
                            l10n.empty,
                            style: theme.textTheme.bodyText1,
                          ),
                        ),
                      );
                    }

                    return Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          return OrderCard(
                            order: orders[index],
                          );
                        },
                      ),
                    );
                  }

                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: const_measures.verPadding,
                      ),
                      child: LoadingCircle(),
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
