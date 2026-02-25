import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const ShohanPortfolio());
}

class ShohanPortfolio extends StatefulWidget {
  const ShohanPortfolio({super.key});

  @override
  State<ShohanPortfolio> createState() => _ShohanPortfolioState();
}

class _ShohanPortfolioState extends State<ShohanPortfolio> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Md Shohan Ahamed | Flutter Developer',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,

      /// ✅ Light Theme
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.grey.shade100,
      ),

      /// ✅ Dark Theme
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        cardColor: const Color(0xFF1E293B),
      ),

      /// ✅ Start with Splash
      home: SplashScreen(
        themeMode: themeMode,
        onThemeChanged: (mode) {
          setState(() => themeMode = mode);
        },
      ),
    );
  }
}
