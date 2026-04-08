import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../navigation/app_router.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import 'onboarding_scaffold.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'Welcome back',
      subtitle: 'Login to continue your nudges.',
      child: Column(
        children: [
          AppTextField(label: 'Email', keyboardType: TextInputType.emailAddress),
          const SizedBox(height: AppSpacing.md),
          AppTextField(
            label: 'Password',
            obscureText: _obscure,
            suffixIcon: IconButton(
              onPressed: () => setState(() => _obscure = !_obscure),
              icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(onPressed: () {}, child: const Text('Forgot password?')),
          ),
          const SizedBox(height: AppSpacing.md),
          AppButton(
            label: 'Login',
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
          const AppButton(label: 'Continue with Google', outlined: true),
          const SizedBox(height: AppSpacing.sm),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, AppRouter.signUp),
            child: const Text('Need an account? Sign up'),
          ),
        ],
      ),
    );
  }
}
