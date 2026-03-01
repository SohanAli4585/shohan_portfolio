import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import 'about_section.dart';
import 'contact_section.dart';
import 'home_section.dart';
import 'projects_section.dart';
import 'skills_section.dart';

class PortfolioPage extends StatefulWidget {
  final ThemeMode themeMode;
  final Function(ThemeMode) onThemeChanged;

  const PortfolioPage({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();

  String _currentSection = 'home'; // ⭐ active section tracking

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  // ✅ smooth scroll
  void scrollToSection(GlobalKey key, String sectionName) {
    final context = key.currentContext;
    if (context != null) {
      setState(() => _currentSection = sectionName);

      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ✅ PRO NAVBAR
          NavBar(
            currentSection: _currentSection,
            isDarkMode: widget.themeMode == ThemeMode.dark,
            onThemeToggle: () {
              widget.onThemeChanged(
                widget.themeMode == ThemeMode.dark
                    ? ThemeMode.light
                    : ThemeMode.dark,
              );
            },
            onItemSelected: (section) {
              switch (section) {
                case 'home':
                  scrollToSection(homeKey, 'home');
                  break;
                case 'about':
                  scrollToSection(aboutKey, 'about');
                  break;
                case 'skills':
                  scrollToSection(skillsKey, 'skills');
                  break;
                case 'projects':
                  scrollToSection(projectsKey, 'projects');
                  break;
                case 'contact':
                  scrollToSection(contactKey, 'contact');
                  break;
              }
            },
          ),

          // ✅ SCROLL BODY
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HomeSection(key: homeKey),
                  AboutSection(key: aboutKey),
                  SkillsSection(key: skillsKey),
                  ProjectsSection(key: projectsKey),
                  ContactSection(key: contactKey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
