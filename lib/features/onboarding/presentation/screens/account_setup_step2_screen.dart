import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../navigation/app_router.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import 'onboarding_scaffold.dart';

class AccountSetupStep2Screen extends StatelessWidget {
  const AccountSetupStep2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      showBack: true,
      title: 'Account setup (2/2)',
      subtitle: 'Tell us a bit about you.',
      child: Column(
        children: [
          const AppTextField(label: 'First name'),
          const SizedBox(height: AppSpacing.md),
          const AppTextField(label: 'Last name'),
          const SizedBox(height: AppSpacing.md),
          const AppTextField(label: 'Country'),
          const SizedBox(height: AppSpacing.md),
          const AppTextField(label: 'Age', keyboardType: TextInputType.number),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: 'Continue',
            onPressed: () => Navigator.pushNamed(context, AppRouter.pricing),
          ),
        ],
      ),
    );
  }
}
