import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../shared/widgets/voice_ripple_button.dart';

class QuickNudgeScreen extends StatefulWidget {
  const QuickNudgeScreen({super.key});

  @override
  State<QuickNudgeScreen> createState() => _QuickNudgeScreenState();
}

class _QuickNudgeScreenState extends State<QuickNudgeScreen> {
  String selectedTeam = 'Morning Movers';
  BudgeActionMode mode = BudgeActionMode.voice;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Quick Nudge', style: Theme.of(context).textTheme.titleLarge),
            IconButton(
              tooltip: 'Quick Nudge Help',
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Quick Nudge Help'),
                    content: const Text(
                      'Pick a team, choose Voice or Reminder, then use the Budge button. Hold for voice and tap for reminder.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.help_outline),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        DropdownButtonFormField<String>(
          initialValue: selectedTeam,
          decoration: const InputDecoration(labelText: 'Team'),
          items: const ['Morning Movers', 'Focus Circle', 'Weekend Warriors']
              .map((team) => DropdownMenuItem(value: team, child: Text(team)))
              .toList(),
          onChanged: (value) => setState(() => selectedTeam = value ?? selectedTeam),
        ),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          width: double.infinity,
          child: SegmentedButton<BudgeActionMode>(
            segments: const [
              ButtonSegment(
                value: BudgeActionMode.voice,
                icon: Icon(Icons.mic),
                label: Text('Voice (Hold)'),
              ),
              ButtonSegment(
                value: BudgeActionMode.reminder,
                icon: Icon(Icons.notifications_active_outlined),
                label: Text('Reminder (Tap)'),
              ),
            ],
            selected: {mode},
            onSelectionChanged: (value) => setState(() => mode = value.first),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        Center(
          child: VoiceRippleButton(
            mode: mode,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${mode == BudgeActionMode.voice ? 'Voice' : 'Reminder'} nudge sent to $selectedTeam',
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}
