import 'package:flutter/material.dart';

import '../../navigation/app_router.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final logoAsset = isDarkMode ? 'assets/white-mode-logo.png' : 'assets/dark-mode-logo.png';

    return AppBar(
      leadingWidth: 64,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Center(
          child: Image.asset(
            logoAsset,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
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
