import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  // Links
  final String email = "mailto:shohan.ahamed.9900@gmail.com";
  final String github = "https://github.com/SohanAli4585";
  final String linkedin =
      "https://www.linkedin.com/in/md-shohan-ahamed-1181b4342/";
  final String facebook = "https://www.facebook.com/ekla.chele.890644";

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.scaffoldBackgroundColor, // ✅ Theme-aware background
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Section title
          Text(
            "Contact Me",
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Email text
          Text(
            "shohan.ahamed.9900@gmail.com",
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 30),

          // Social Buttons
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _circleButton(
                FontAwesomeIcons.linkedin,
                theme.colorScheme.primary,
                () => _launchURL(linkedin),
                theme,
              ),
              _circleButton(
                FontAwesomeIcons.github,
                theme.colorScheme.onBackground,
                () => _launchURL(github),
                theme,
              ),
              _circleButton(
                FontAwesomeIcons.facebook,
                Colors.blue.shade800,
                () => _launchURL(facebook),
                theme,
              ),
              _circleButton(
                Icons.email,
                Colors.red.shade700,
                () => _launchURL(email),
                theme,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _circleButton(
    IconData icon,
    Color color,
    VoidCallback onTap,
    ThemeData theme,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color.withOpacity(
            theme.brightness == Brightness.dark ? 0.2 : 0.1,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: theme.brightness == Brightness.dark
                  ? Colors.black45
                  : Colors.black12,
              blurRadius: 4,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Center(child: Icon(icon, color: color, size: 28)),
      ),
    );
  }
}
