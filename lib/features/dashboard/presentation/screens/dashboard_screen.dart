import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/mock_data.dart';
import '../../../../navigation/app_router.dart';
import '../../../../shared/widgets/app_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        Text('Activity Heatmap', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 4),
        Text(
          'Shows nudges sent over the last 12 weeks.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: AppSpacing.md),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _LegendDot(color: colorScheme.primary),
                  const SizedBox(width: 8),
                  const Text('Activity over time'),
                  const Spacer(),
                  Text('Day / Month / Year', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              const _Heatmap(),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: const [
            Expanded(child: _MetricCard(icon: Icons.local_fire_department_outlined, title: 'Streak', value: '11 days')),
            SizedBox(width: AppSpacing.md),
            Expanded(child: _MetricCard(icon: Icons.groups_outlined, title: 'Teams', value: '3 active')),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Text('Upcoming Sessions', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 4),
        Text(
          'Next nudges scheduled for your teams.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: AppSpacing.sm),
        AppCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              for (var index = 0; index < MockData.upcomingSessions.length; index++) ...[
                InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRouter.teamChannel,
                    arguments: {'teamName': MockData.teams[index % MockData.teams.length].name},
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.schedule_outlined),
                    ),
                    title: Text(MockData.upcomingSessions[index].title),
                    subtitle: Text(MockData.upcomingSessions[index].displayBadge),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
                if (index != MockData.upcomingSessions.length - 1) const Divider(height: 1),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _MetricCard({required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20),
          const SizedBox(height: 10),
          Text(title),
          const SizedBox(height: 6),
          Text(value, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}

class _Heatmap extends StatelessWidget {
  const _Heatmap();

  @override
  Widget build(BuildContext context) {
    final random = Random(7);
    final data = List<int>.generate(112, (_) => random.nextInt(5));

    return AppCard(
      padding: const EdgeInsets.all(12),
      child: Wrap(
        spacing: 4,
        runSpacing: 4,
        children: data
            .map(
              (int level) => Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Color.lerp(AppColors.muted, AppColors.primary, level / 4),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;

  const _LegendDot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
