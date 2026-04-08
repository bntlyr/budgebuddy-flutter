import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/mock_data.dart';
import '../../../../shared/widgets/voice_ripple_button.dart';

class TeamChannelScreen extends StatefulWidget {
  final String teamName;

  const TeamChannelScreen({super.key, required this.teamName});

  @override
  State<TeamChannelScreen> createState() => _TeamChannelScreenState();
}

class _TeamChannelScreenState extends State<TeamChannelScreen> {
  String selectedMember = 'All';
  BudgeActionMode mode = BudgeActionMode.voice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.teamName} Channel')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sessions', style: Theme.of(context).textTheme.titleLarge),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF9800),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'In-session',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              ...MockData.upcomingSessions.take(1).map(
                (session) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 40),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      dense: true,
                      leading: Icon(
                        Icons.schedule,
                        size: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      title: Text(
                        session.displayBadge,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.edit,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        iconSize: 20,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Editing ${session.title}')),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              DropdownButtonFormField<String>(
                initialValue: selectedMember,
                decoration: const InputDecoration(labelText: 'Member'),
                items: const ['All', 'Alex', 'Sam', 'Mia']
                    .map((name) => DropdownMenuItem(value: name, child: Text(name)))
                    .toList(),
                onChanged: (value) => setState(() => selectedMember = value ?? 'All'),
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
              const SizedBox(height: AppSpacing.lg),
              Center(
                child: VoiceRippleButton(
                  mode: mode,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${mode == BudgeActionMode.voice ? 'Voice' : 'Reminder'} nudge sent to $selectedMember',
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}
