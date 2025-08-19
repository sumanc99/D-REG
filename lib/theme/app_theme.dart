import 'package:flutter/material.dart';

/// App color constants and alpha helper
class AppColors {
  static const Color primary = Color(0xFF0082E9); // Updated Primary
  static const Color secondary = Color(0xFF00C853); // Fresh green accent
  static const Color lightBackground = Colors.white;

  static final Color darkBackground = Colors.grey[900]!;
  static final Color cardDark = Colors.grey[850]!;
  static final Color fieldFillLight = Colors.grey[100]!;
  static final Color fieldFillDark = Colors.grey[800]!;
  static final Color borderLight = Colors.grey[400]!;
  static final Color borderDark = Colors.grey[700]!;

  /// Flutter 3.22+: replaces deprecated withOpacity
  static Color withAlpha(Color color, double opacity) =>
      color.withValues(alpha: opacity);
}

/// App spacing constants
class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

/// Shared AppBar style
AppBarTheme _appBarTheme(Color foreground) => AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: foreground,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: foreground,
      ),
    );

/// Shared ElevatedButton style
ButtonStyle _buttonStyle() => ButtonStyle(
      minimumSize: WidgetStateProperty.all(const Size(48, 48)),
      backgroundColor: WidgetStateProperty.resolveWith((states) =>
          states.contains(WidgetState.pressed)
              ? AppColors.withAlpha(AppColors.primary, 0.8)
              : AppColors.primary),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      overlayColor: WidgetStateProperty.all(
          AppColors.withAlpha(AppColors.primary, 0.1)),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg, vertical: AppSpacing.md),
      ),
      shape: WidgetStateProperty.all(
        const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 16)),
    );

/// Theme Manager
class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.lightBackground,
      onPrimary: Colors.white,
      onSecondary: Colors.black87,
      onSurface: Colors.black87,
    ),
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: _appBarTheme(Colors.white),
    textTheme: const TextTheme(
      displayLarge:
          TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
      bodySmall: TextStyle(fontSize: 12, color: Colors.black54),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
    elevatedButtonTheme: ElevatedButtonThemeData(style: _buttonStyle()),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppSpacing.md),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.borderLight),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
      filled: true,
      fillColor: AppColors.fieldFillLight,
    ),
    cardTheme: const CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      color: Colors.white,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.black87,
      contentTextStyle: TextStyle(color: Colors.white, fontSize: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      behavior: SnackBarBehavior.floating,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.darkBackground,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: _appBarTheme(Colors.white),
    textTheme: const TextTheme(
      displayLarge:
          TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
      bodySmall: TextStyle(fontSize: 12, color: Colors.white60),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(style: _buttonStyle()),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppSpacing.md),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.borderDark),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
      filled: true,
      fillColor: AppColors.fieldFillDark,
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      color: AppColors.cardDark,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.black87,
      contentTextStyle: TextStyle(color: Colors.white, fontSize: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      behavior: SnackBarBehavior.floating,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
