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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(color: theme.dividerColor.withOpacity(0.2)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
          InkWell(
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
          ),
        ],
      ),
    );
  }

  Widget _navItem(BuildContext context, String title, String section) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: () => onItemSelected(section),
      child: Text(
        title,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
