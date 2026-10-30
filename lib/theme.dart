import 'package:flutter/material.dart';

/// Konsistensi semua warna aplikasi
class AppColors {
  static const bg = Color(0xFFF4F7F1); // putih kehijauan lembut
  static const primary = Color(0xFF15370D); // hijau
  static const accent = Color(0xFFE07A5F); // terakota
  static const ink = Color(0xFF1F2A1C);
  static const muted = Color(0xFF6B7868);

  /// Pilihan warna catatan (pastel)
  static const noteColors = <Color>[
    Color(0xFFDCEBCB), // hijau muda
    Color(0xFFFFF3B0), // kuning muda
    Color(0xFFF8D9CF), // peach
    Color(0xFFD6E6F2), // biru muda
    Color(0xFFE6DCF0), // ungu muda
  ];
}

ThemeData buildTheme() {
  OutlineInputBorder border(Color c, [double w = 1]) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: BorderSide(color: c, width: w),
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    scaffoldBackgroundColor: AppColors.bg,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      foregroundColor: AppColors.ink,
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: border(Colors.black12),
      enabledBorder: border(Colors.black12),
      focusedBorder: border(AppColors.primary, 1.6),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
