import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/mock_data.dart';
import '../../../../shared/widgets/app_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppSpacing.md),
        itemCount: MockData.notifications.length,
        itemBuilder: (context, index) {
          final item = MockData.notifications[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: AppCard(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                leading: Icon(
                  Icons.notifications_active_outlined,
                  size: 20,
                ),
                title: Text(
                  item.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: Text(
                  item.subtitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
