import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../navigation/app_router.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import 'onboarding_scaffold.dart';

class PaymentScreen extends StatefulWidget {
  final bool isFree;

  const PaymentScreen({super.key, required this.isFree});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String method = 'GCash';

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      showBack: true,
      title: 'Payment',
      subtitle: widget.isFree
          ? 'Confirm and continue on the Free plan.'
          : 'Choose a payment method for your upgrade.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            children: ['GCash', 'Maya', 'Credit/Debit Card']
                .map(
                  (item) => ChoiceChip(
                    label: Text(item),
                    selected: method == item,
                    onSelected: (_) => setState(() => method = item),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: AppSpacing.lg),
          if (method == 'GCash' || method == 'Maya') ...[
            AppTextField(label: '$method Number', keyboardType: TextInputType.phone),
            const SizedBox(height: AppSpacing.md),
            const AppTextField(label: 'Account Name'),
          ] else ...[
            const AppTextField(label: 'Card Number', keyboardType: TextInputType.number),
            const SizedBox(height: AppSpacing.md),
            const Row(
              children: [
                Expanded(child: AppTextField(label: 'Expiry (MM/YY)')),
                SizedBox(width: AppSpacing.md),
                Expanded(child: AppTextField(label: 'CVV')),
              ],
            ),
          ],
          const SizedBox(height: AppSpacing.xl),
          AppButton(
            label: widget.isFree ? 'Continue' : 'Pay Now',
            onPressed: () => Navigator.pushNamed(
              context,
              AppRouter.result,
              arguments: {'success': true},
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: 'Simulate Failure',
            outlined: true,
            onPressed: () => Navigator.pushNamed(
              context,
              AppRouter.result,
              arguments: {'success': false},
            ),
          ),
        ],
      ),
    );
  }
}
