import 'package:flutter/material.dart';

import '../../navigation/app_router.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 64,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Center(
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRouter.settings),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ),
      ),
      title: const SizedBox.shrink(),
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, AppRouter.notifications),
          icon: const Icon(Icons.notifications_none_outlined),
        ),
        const SizedBox(width: 8),
      ],
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
