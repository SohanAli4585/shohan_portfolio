import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:html' as html;

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  // Icon URLs / assets
  final Map<String, String> skillIcons = const {
    // Mobile & Frontend
    "Flutter": "https://cdn.simpleicons.org/flutter",
    "Dart": "https://cdn.simpleicons.org/dart",
    "ReactJS": "https://cdn.simpleicons.org/react",
    "NextJS": "https://cdn.simpleicons.org/nextdotjs",
    "Tailwind CSS": "https://cdn.simpleicons.org/tailwindcss",

    // Backend & APIs
    "Firebase": "https://cdn.simpleicons.org/firebase/FFCA28",
    "REST API": "assets/images/restapi.png",
    "Node.js": "https://cdn.simpleicons.org/nodedotjs/339933",
    "MongoDB": "https://cdn.simpleicons.org/mongodb/47A248",

    // Tools
    "VS Code": "assets/images/vscode.png",
    "GitHub": "https://cdn.simpleicons.org/github",
    "Android Studio": "https://cdn.simpleicons.org/androidstudio",
    "Git": "https://cdn.simpleicons.org/git",
  };

  // Categories
  final Map<String, List<String>> categories = const {
    "📱 Mobile & Frontend": [
      "Flutter",
      "Dart",
      "ReactJS",
      "NextJS",
      "Tailwind CSS",
    ],
    "⚙️ Backend & APIs": ["Firebase", "REST API", "Node.js", "MongoDB"],
    "🧠 Tools": ["VS Code", "GitHub", "Android Studio", "Git"],
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 4;
    if (screenWidth < 1200) crossAxisCount = 3;
    if (screenWidth < 800) crossAxisCount = 2;
    if (screenWidth < 500) crossAxisCount = 1;

    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔥 Title
          Text(
            "My Skills",
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 40),

          /// 🔥 Categories
          ...categories.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.key,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: entry.value.length,
                    itemBuilder: (context, index) {
                      final skill = entry.value[index];

                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: theme.shadowColor.withOpacity(0.15),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /// 🔥 Icon
                              skillIcons[skill]!.endsWith(".png")
                                  ? Image.asset(
                                      skillIcons[skill]!,
                                      height: 50,
                                      width: 50,
                                    )
                                  : SvgPicture.network(
                                      skillIcons[skill]!,
                                      height: 50,
                                      width: 50,
                                      placeholderBuilder: (context) =>
                                          const SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          ),
                                      colorFilter: ColorFilter.mode(
                                        theme.colorScheme.primary,
                                        BlendMode.srcIn,
                                      ),
                                    ),

                              const SizedBox(height: 15),

                              /// 🔥 Skill name
                              Text(
                                skill,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }).toList(),

          const SizedBox(height: 30),

          /// 🔥 CV Button
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                html.window.open('my_cv.pdf', '_blank');
              },
              icon: const Icon(Icons.download),
              label: const Text("Download CV"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
