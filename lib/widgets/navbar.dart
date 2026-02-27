import 'package:flutter/material.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(color: theme.dividerColor.withOpacity(0.2)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: screenWidth > 800
            ? _webNavItems(context)
            : _mobileNavItems(context),
      ),
    );
  }

  /// Web Layout
  List<Widget> _webNavItems(BuildContext context) {
    final theme = Theme.of(context);
    return [
      Row(
        children: [
          _navItem(context, 'Home', 'home'),
          _navItem(context, 'About', 'about'),
          _navItem(context, 'Skills', 'skills'),
          _navItem(context, 'Projects', 'projects'),
          _navItem(context, 'Contact', 'contact'),
        ],
      ),
      const SizedBox(width: 20),
      _themeToggleIcon(context),
    ];
  }

  /// Mobile Layout
  List<Widget> _mobileNavItems(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => _showMobileMenu(context),
      ),
      const SizedBox(width: 10),
      _themeToggleIcon(context),
    ];
  }

  /// Theme toggle icon
  Widget _themeToggleIcon(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onThemeToggle,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(0.12),
          shape: BoxShape.circle,
        ),
        child: Icon(
          isDarkMode ? Icons.dark_mode : Icons.light_mode,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }

  /// Mobile menu modal
  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _navItem(context, 'Home', 'home'),
            _navItem(context, 'About', 'about'),
            _navItem(context, 'Skills', 'skills'),
            _navItem(context, 'Projects', 'projects'),
            _navItem(context, 'Contact', 'contact'),
          ],
        );
      },
    );
  }

  /// Nav item button
  Widget _navItem(BuildContext context, String title, String section) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: () {
        onItemSelected(section);
        Navigator.of(context).pop(); // Close mobile menu if open
      },
      child: Text(
        title,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
