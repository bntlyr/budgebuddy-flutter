import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../navigation/app_router.dart';
import '../../../../shared/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const String _placeholderSvg = '''
<svg viewBox="0 0 360 220" xmlns="http://www.w3.org/2000/svg">
  <rect width="360" height="220" rx="24" fill="#EAF1EA"/>
  <circle cx="88" cy="112" r="46" fill="#2D5438" opacity="0.15"/>
  <circle cx="246" cy="86" r="56" fill="#2D5438" opacity="0.15"/>
  <rect x="120" y="80" width="120" height="70" rx="14" fill="#2D5438"/>
  <circle cx="180" cy="112" r="20" fill="#F2C14E"/>
</svg>
''';

  @override
  Widget build(BuildContext context) {
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
                child: SvgPicture.string(_placeholderSvg, fit: BoxFit.contain),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(AppStrings.appName, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AppSpacing.sm),
              Text(AppStrings.tagline, style: Theme.of(context).textTheme.bodyLarge),
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
