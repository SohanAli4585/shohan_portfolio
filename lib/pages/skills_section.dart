import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  // Icon URLs
  final Map<String, String> skillIcons = const {
    // Mobile & Frontend
    "Flutter": "https://cdn.simpleicons.org/flutter/02569B",
    "ReactJS": "https://cdn.simpleicons.org/react/61DAFB",
    "NextJS": "https://cdn.simpleicons.org/nextdotjs/000000",
    "Tailwind CSS": "https://cdn.simpleicons.org/tailwindcss/06B6D4",

    // Backend & APIs
    "Firebase": "https://cdn.simpleicons.org/firebase/FFCA28",
    "REST API": "https://cdn-icons-png.flaticon.com/512/1080/1080075.png",
    "GraphQL": "https://cdn.simpleicons.org/graphql/E10098",
    "N8N": "https://cdn.simpleicons.org/n8n/FF0000",

    // Tools
    "Git": "https://cdn.simpleicons.org/git/F05032",
    "Codemagic": "https://cdn.simpleicons.org/codemagic/000000",
    "LiveKit": "https://cdn.simpleicons.org/livekit/007AFF",
    "Arduino/ESP": "https://cdn.simpleicons.org/arduino/00979D",
  };

  // Categories
  final Map<String, List<String>> categories = const {
    "📱 Mobile & Frontend": ["Flutter", "ReactJS", "NextJS", "Tailwind CSS"],
    "⚙️ Backend & APIs": ["Firebase", "REST API", "GraphQL", "N8N"],
    "🧠 Tools": ["Git", "Codemagic", "LiveKit", "Arduino/ESP"],
  };

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = 4;

    if (screenWidth < 1200) crossAxisCount = 3;
    if (screenWidth < 800) crossAxisCount = 2;
    if (screenWidth < 500) crossAxisCount = 1;

    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Skills",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 40),
          ...categories.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.key,
                    style: const TextStyle(
                      fontSize: 26,
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              skillIcons[skill]!.endsWith(".png")
                                  ? Image.network(
                                      skillIcons[skill]!,
                                      height: 50,
                                      width: 50,
                                    )
                                  : SvgPicture.network(
                                      skillIcons[skill]!,
                                      height: 50,
                                      width: 50,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.black,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                              const SizedBox(height: 15),
                              Text(
                                skill,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
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
        ],
      ),
    );
  }
}
