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
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Contact Me",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            "shohan.ahamed.9900@gmail.com",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _circleButton(
                FontAwesomeIcons.linkedin,
                Colors.blue.shade700,
                () => _launchURL(linkedin),
              ),
              _circleButton(
                FontAwesomeIcons.github,
                Colors.black87,
                () => _launchURL(github),
              ),
              _circleButton(
                FontAwesomeIcons.facebook,
                Colors.blue.shade800,
                () => _launchURL(facebook),
              ),
              _circleButton(
                Icons.email,
                Colors.red.shade700,
                () => _launchURL(email),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _circleButton(IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
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
