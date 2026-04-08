import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            const CircleAvatar(radius: 42, child: Icon(Icons.person, size: 38)),
            TextButton(onPressed: () {}, child: const Text('Change photo')),
            const SizedBox(height: AppSpacing.md),
            const AppTextField(label: 'Username', enabled: false),
            const SizedBox(height: AppSpacing.md),
            const AppTextField(label: 'First name'),
            const SizedBox(height: AppSpacing.md),
            const AppTextField(label: 'Last name'),
            const SizedBox(height: AppSpacing.md),
            const AppTextField(label: 'Country'),
            const SizedBox(height: AppSpacing.md),
            const AppTextField(label: 'Age', keyboardType: TextInputType.number),
            const SizedBox(height: AppSpacing.xl),
            AppButton(label: 'Save', onPressed: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}
