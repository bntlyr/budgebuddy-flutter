import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../navigation/app_router.dart';
import '../../../../shared/widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final bool success;

  const ResultScreen({super.key, required this.success});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                success ? Icons.check_circle : Icons.error,
                color: success ? AppColors.success : AppColors.error,
                size: 86,
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                success ? 'Congratulations!' : 'Payment failed',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                success
                    ? 'Your account is ready. Let us start nudging.'
                    : 'Please retry your payment method.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                label: success ? 'Enter Budge Buddy' : 'Retry Payment',
                onPressed: () {
                  if (success) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouter.home,
                      (route) => false,
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
