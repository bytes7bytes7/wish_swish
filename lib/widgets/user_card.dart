import 'package:auth_repo/auth_repo.dart';
import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatar = user.avatar;

    return Row(
      children: [
        Container(
          height: const_measures.avatarSize,
          width: const_measures.avatarSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(),
          ),
          child: avatar.isNotEmpty
              ? Image.network(
                  avatar,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, trace) {
                    return const Icon(Icons.photo);
                  },
                )
              : const Icon(Icons.photo),
        ),
        Flexible(
          child: Text(
            '${user.name}\n${user.surname}',
            style: theme.textTheme.headline3,
          ),
        ),
      ],
    );
  }
}
