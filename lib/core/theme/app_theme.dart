import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData light() => _buildTheme(
        const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.accent,
          surface: AppColors.surface,
          error: AppColors.error,
          outline: AppColors.border,
          outlineVariant: AppColors.border,
          onPrimary: Colors.white,
          onSecondary: AppColors.textPrimary,
          onSurface: AppColors.textPrimary,
          onSurfaceVariant: AppColors.textSecondary,
        ),
        brightness: Brightness.light,
      );

  static ThemeData dark() => _buildTheme(
        const ColorScheme.dark(
          primary: Color(0xFF9CC8A9),
          secondary: Color(0xFFF2C14E),
          surface: Color(0xFF182119),
          error: Color(0xFFFF8A80),
          outline: Color(0xFF314031),
          outlineVariant: Color(0xFF314031),
          onPrimary: Color(0xFF0F1A12),
          onSecondary: Color(0xFF182019),
          onSurface: Color(0xFFE7EFE7),
          onSurfaceVariant: Color(0xFFABB9AB),
        ),
        brightness: Brightness.dark,
      );

  static ThemeData _buildTheme(ColorScheme colorScheme, {required Brightness brightness}) {
    final base = brightness == Brightness.dark
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData.light(useMaterial3: true);

    return base.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: brightness == Brightness.dark
          ? const Color(0xFF101610)
          : AppColors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.zero,
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.primary.withValues(alpha: 0.12),
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(color: colorScheme.onSurfaceVariant, fontWeight: FontWeight.w600),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected) ? colorScheme.primary : null,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colorScheme.primary.withValues(alpha: 0.4)
              : colorScheme.outlineVariant,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
      ),
      textTheme: base.textTheme.copyWith(
        headlineMedium: TextStyle(
          fontWeight: FontWeight.w800,
          color: colorScheme.onSurface,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurface,
        ),
        bodyLarge: TextStyle(color: colorScheme.onSurface),
        bodyMedium: TextStyle(color: colorScheme.onSurfaceVariant),
      ),
    );
  }
}
