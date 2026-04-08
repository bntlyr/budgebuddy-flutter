import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../navigation/app_router.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_card.dart';
import 'onboarding_scaffold.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  String selected = 'Free';

  @override
  Widget build(BuildContext context) {
    final isFree = selected == 'Free';

    return OnboardingScaffold(
      showBack: true,
      title: 'Choose your plan',
      subtitle: 'Upgrade any time.',
      child: Column(
        children: [
          _PlanTile(
            title: 'Free',
            description: 'Basic features to get you started.',
            price: '\$/mo',
            selected: selected == 'Free',
            onTap: () => setState(() => selected = 'Free'),
          ),
          const SizedBox(height: AppSpacing.md),
          _PlanTile(
            title: 'Plus',
            description: 'Everything you need to grow your business.',
            price: '\$9.99/mo',
            selected: selected == 'Plus',
            onTap: () => setState(() => selected = 'Plus'),
          ),
          const SizedBox(height: AppSpacing.md),
          _PlanTile(
            title: 'Pro',
            description: 'All features, priority support, and more.',
            price: '\$19.99/mo',
            selected: selected == 'Pro',
            onTap: () => setState(() => selected = 'Pro'),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: isFree ? 'Continue Free' : 'Upgrade Now',
            onPressed: () {
              if (isFree) {
                Navigator.pushNamed(
                  context,
                  AppRouter.result,
                  arguments: {'success': true},
                );
                return;
              }

              Navigator.pushNamed(
                context,
                AppRouter.payment,
                arguments: {'isFree': false},
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PlanTile extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final bool selected;
  final VoidCallback onTap;

  const _PlanTile({
    required this.title,
    required this.price,
    required this.description,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppCard(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(price),
                ],
              ),
            ),
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? AppColors.primary : AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
