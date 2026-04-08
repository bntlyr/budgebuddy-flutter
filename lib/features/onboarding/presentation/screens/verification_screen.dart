import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../navigation/app_router.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import 'onboarding_scaffold.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'Verification',
      subtitle: 'Enter the 6-digit code sent to your email.',
      child: Column(
        children: [
          const AppTextField(label: '6-digit code', keyboardType: TextInputType.number),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: 'Submit',
            onPressed: () => Navigator.pushNamed(context, AppRouter.accountSetupStep1),
          ),
        ],
      ),
    );
  }
}
