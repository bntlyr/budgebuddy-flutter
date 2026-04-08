import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../navigation/app_router.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import 'onboarding_scaffold.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'Create account',
      subtitle: 'Use your email to get started.',
      child: Column(
        children: [
          const AppTextField(label: 'Email', keyboardType: TextInputType.emailAddress),
          const SizedBox(height: AppSpacing.md),
          AppButton(
            label: 'Sign Up',
            onPressed: () => Navigator.pushNamed(context, AppRouter.verification),
          ),
          const SizedBox(height: AppSpacing.md),
          const Row(
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('or'),
              ),
              Expanded(child: Divider()),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          const AppButton(label: 'Sign up with Google', outlined: true),
        ],
      ),
    );
  }
}
