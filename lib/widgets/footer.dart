import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.blue.shade50,
      child: const Text(
        "© 2025 Md Shohan Ahamed | Built with Flutter 💙",
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
