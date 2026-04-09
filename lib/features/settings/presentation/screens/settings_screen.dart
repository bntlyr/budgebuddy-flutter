import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/utils/theme_controller.dart';
import '../../../../navigation/app_router.dart';
import '../../../../shared/widgets/app_card.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool microphone = true;
  bool audio = true;

  @override
  Widget build(BuildContext context) {
    final themeController = ThemeControllerScope.of(context);

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        AppCard(
          child: Row(
            children: [
              const CircleAvatar(radius: 26, child: Icon(Icons.person_outline)),
              const SizedBox(width: AppSpacing.md),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Budge User',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text('@budgerunner'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRouter.editProfile),
                child: const Text('Edit'),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Material(
          child: AppCard(
            child: Row(
              children: [
                const Icon(Icons.dark_mode_outlined),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dark mode',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Switch between light and dark themes.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: themeController.isDarkMode,
                  onChanged: themeController.setDarkMode,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        AppCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              SwitchListTile(
                value: notifications,
                title: const Text('Notifications'),
                onChanged: (value) => setState(() => notifications = value),
              ),
              const Divider(height: 1),
              SwitchListTile(
                value: microphone,
                title: const Text('Microphone'),
                onChanged: (value) => setState(() => microphone = value),
              ),
              const Divider(height: 1),
              SwitchListTile(
                value: audio,
                title: const Text('Audio'),
                onChanged: (value) => setState(() => audio = value),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
