import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sohan_portfolio/pages/about_section.dart';
import 'package:sohan_portfolio/pages/contact_section.dart';
import 'package:sohan_portfolio/pages/home_section.dart';
import 'package:sohan_portfolio/pages/projects_section.dart';
import 'package:sohan_portfolio/pages/skills_section.dart';
import 'widgets/navbar.dart';

void main() {
  runApp(const ShohanPortfolio());
}

class ShohanPortfolio extends StatefulWidget {
  const ShohanPortfolio({super.key});

  @override
  State<ShohanPortfolio> createState() => _ShohanPortfolioState();
}

class _ShohanPortfolioState extends State<ShohanPortfolio> {
  ThemeMode themeMode = ThemeMode.system; // default system theme

  void toggleTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Md Shohan Ahamed | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      themeMode: themeMode,
      home: PortfolioPage(
        themeMode: themeMode,
        onThemeChanged: (mode) {
          setState(() {
            themeMode = mode;
          });
        },
      ),
    );
  }
}

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
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(
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
                  scrollToSection(homeKey);
                  break;
                case 'about':
                  scrollToSection(aboutKey);
                  break;
                case 'skills':
                  scrollToSection(skillsKey);
                  break;
                case 'projects':
                  scrollToSection(projectsKey);
                  break;
                case 'contact':
                  scrollToSection(contactKey);
                  break;
              }
            },
          ),
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

// ------------------- NavBar -------------------

class NavBar extends StatelessWidget {
  final Function(String) onItemSelected;
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const NavBar({
    super.key,
    required this.onItemSelected,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
      color: theme.scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () => onItemSelected('home'),
                child: Text(
                  'Home',
                  style: TextStyle(color: theme.textTheme.bodyMedium!.color),
                ),
              ),
              TextButton(
                onPressed: () => onItemSelected('about'),
                child: Text(
                  'About',
                  style: TextStyle(color: theme.textTheme.bodyMedium!.color),
                ),
              ),
              TextButton(
                onPressed: () => onItemSelected('skills'),
                child: Text(
                  'Skills',
                  style: TextStyle(color: theme.textTheme.bodyMedium!.color),
                ),
              ),
              TextButton(
                onPressed: () => onItemSelected('projects'),
                child: Text(
                  'Projects',
                  style: TextStyle(color: theme.textTheme.bodyMedium!.color),
                ),
              ),
              TextButton(
                onPressed: () => onItemSelected('contact'),
                child: Text(
                  'Contact',
                  style: TextStyle(color: theme.textTheme.bodyMedium!.color),
                ),
              ),
            ],
          ),

          // Dark/Light Mode Toggle Button
          InkWell(
            onTap: onThemeToggle,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: theme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
