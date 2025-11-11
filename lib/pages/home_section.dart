import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: const Color(0xFFECF3FF), // soft blue background
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Md Shohan Ahamed",
              style: GoogleFonts.poppins(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0D47A1),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  'Flutter Developer',
                  textStyle: GoogleFonts.poppins(
                    fontSize: 24,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  'Firebase Expert',
                  textStyle: GoogleFonts.poppins(
                    fontSize: 24,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  'Full-Stack App Creator',
                  textStyle: GoogleFonts.poppins(
                    fontSize: 24,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
