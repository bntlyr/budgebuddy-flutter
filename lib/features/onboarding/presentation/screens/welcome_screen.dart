import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../navigation/app_router.dart';
import '../../../../shared/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final logoAsset = isDarkMode
        ? 'assets/dark-mode-logo.png'
        : 'assets/white-mode-logo.png';

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              SizedBox(
                height: 220,
                width: double.infinity,
                child: Image.asset(logoAsset, fit: BoxFit.contain),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                AppStrings.appName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                AppStrings.tagline,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              AppButton(
                label: 'Get Started',
                onPressed: () => Navigator.pushNamed(context, AppRouter.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
