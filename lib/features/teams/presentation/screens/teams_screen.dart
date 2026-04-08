import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/mock_data.dart';
import '../../../../navigation/app_router.dart';
import '../../../../shared/widgets/app_card.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.md),
            child: Row(
              children: [
                Text('Teams', style: Theme.of(context).textTheme.titleLarge),
                const Spacer(),
                IconButton(
                  tooltip: 'Add Team',
                  onPressed: () => Navigator.pushNamed(context, AppRouter.addTeam),
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                AppCard(
                  borderRadius: 0,
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      for (var index = 0; index < MockData.teams.length; index++) ...[
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          leading: CircleAvatar(
                            child: Text(MockData.teams[index].name[0]),
                          ),
                          title: Text(MockData.teams[index].name),
                          subtitle: Text(
                            '${MockData.teams[index].members} members · ${MockData.teams[index].sessions} sessions',
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRouter.teamChannel,
                            arguments: {'teamName': MockData.teams[index].name},
                          ),
                        ),
                        if (index != MockData.teams.length - 1) const Divider(height: 1),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
