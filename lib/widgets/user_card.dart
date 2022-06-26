import 'package:auth_repo/auth_repo.dart';
import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;

const _separator = SizedBox(width: 8.0);

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
        CircleAvatar(
          radius: const_measures.avatarRadius,
          backgroundColor: theme.disabledColor,
          foregroundColor: theme.iconTheme.color,
          child: ClipOval(
            child: avatar.isNotEmpty
                ? Image.network(
                    avatar,
                    height: 2 * const_measures.avatarRadius,
                    width: 2 * const_measures.avatarRadius,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, trace) {
                      return const Icon(Icons.photo);
                    },
                  )
                : const Icon(Icons.photo),
          ),
        ),
        _separator,
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
