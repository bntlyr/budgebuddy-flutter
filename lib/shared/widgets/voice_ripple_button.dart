import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

enum BudgeActionMode { voice, reminder }

class VoiceRippleButton extends StatefulWidget {
  final BudgeActionMode mode;
  final VoidCallback onPressed;

  const VoiceRippleButton({
    super.key,
    required this.mode,
    required this.onPressed,
  });

  @override
  State<VoiceRippleButton> createState() => _VoiceRippleButtonState();
}

class _VoiceRippleButtonState extends State<VoiceRippleButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isHolding = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startHold() {
    if (widget.mode != BudgeActionMode.voice) {
      return;
    }
    setState(() => _isHolding = true);
    _controller.repeat();
  }

  void _stopHold() {
    if (widget.mode != BudgeActionMode.voice) {
      return;
    }
    _controller.stop();
    setState(() => _isHolding = false);
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    final isVoice = widget.mode == BudgeActionMode.voice;
    final icon = isVoice ? Icons.mic : Icons.notifications_active_outlined;
    final title = isVoice ? 'Hold to Send Voice' : 'Tap to Send Reminder';

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: isVoice ? null : widget.onPressed,
      onLongPressStart: isVoice ? (_) => _startHold() : null,
      onLongPressEnd: isVoice ? (_) => _stopHold() : null,
      onLongPressCancel: isVoice ? () => _stopHold() : null,
      child: SizedBox(
        height: 248,
        width: 248,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final value = _controller.value;
            return Stack(
              alignment: Alignment.center,
              children: [
                if (isVoice && _isHolding)
                  for (var i = 0; i < 3; i++)
                    _RippleCircle(progress: (value + i * 0.28) % 1),
                AnimatedScale(
                  scale: _isHolding ? 0.97 : 1,
                  duration: const Duration(milliseconds: 120),
                  child: Container(
                    width: 188,
                    height: 188,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.primaryDark],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.28),
                          blurRadius: 24,
                          offset: const Offset(0, 14),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      shape: const CircleBorder(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(icon, color: Colors.white, size: 38),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _RippleCircle extends StatelessWidget {
  final double progress;

  const _RippleCircle({required this.progress});

  @override
  Widget build(BuildContext context) {
    final scale = 0.7 + (progress * 1.5);
    final opacity = math.max(0.0, 0.28 - progress * 0.28);

    return Container(
      width: 138 * scale,
      height: 138 * scale,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary.withValues(alpha: opacity),
      ),
    );
  }
}
