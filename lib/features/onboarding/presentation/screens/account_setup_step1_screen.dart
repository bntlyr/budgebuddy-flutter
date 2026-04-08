import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../navigation/app_router.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import 'onboarding_scaffold.dart';

class AccountSetupStep1Screen extends StatefulWidget {
  const AccountSetupStep1Screen({super.key});

  @override
  State<AccountSetupStep1Screen> createState() => _AccountSetupStep1ScreenState();
}

class _AccountSetupStep1ScreenState extends State<AccountSetupStep1Screen> {
  bool obscureA = true;
  bool obscureB = true;

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      showBack: true,
      title: 'Account setup (1/2)',
      subtitle: 'Create your account credentials.',
      child: Column(
        children: [
          const AppTextField(label: 'Username'),
          const SizedBox(height: AppSpacing.md),
          AppTextField(
            label: 'Password (min 8 chars)',
            obscureText: obscureA,
            suffixIcon: IconButton(
              onPressed: () => setState(() => obscureA = !obscureA),
              icon: Icon(obscureA ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextField(
            label: 'Confirm password',
            obscureText: obscureB,
            suffixIcon: IconButton(
              onPressed: () => setState(() => obscureB = !obscureB),
              icon: Icon(obscureB ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: 'Continue',
            onPressed: () => Navigator.pushNamed(context, AppRouter.accountSetupStep2),
          ),
        ],
      ),
    );
  }
}
