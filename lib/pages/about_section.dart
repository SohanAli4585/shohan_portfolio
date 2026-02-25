import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: theme.scaffoldBackgroundColor, // ✅ Theme-aware background
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 50),
      child: screenWidth > 900
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left: Image
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/sohandev.png',
                      height: 400,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.person,
                          size: 200,
                          color: theme.colorScheme.onBackground.withOpacity(
                            0.3,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 50),

                // Right: Text
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // About Me Title
                      Text(
                        "About Me",
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Name / Role
                      Text(
                        "Md Shohan Ahamed\nFlutter App / Frontend Developer\nDhaka, Bangladesh",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Description
                      Text(
                        "I'm a Mobile App & Frontend Developer with 3+ years of experience, specializing in Flutter and React/Next.js. I love building fast, responsive, and visually appealing digital experiences that work flawlessly across devices. Passionate about writing clean, maintainable code and staying updated with the latest technologies, I focus on creating user-centric products that blend performance, design, and scalability.",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Skills & Expertise
                      Text(
                        "Skills & Expertise:",
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "✅ Expert in Flutter and React/Next.js",
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            "✅ Skilled in API integration — REST & GraphQL",
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            "✅ Experienced with Firebase and Google Cloud",
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            "✅ Strong knowledge of state management (GetX, Provider, BLoC)",
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            "✅ Familiar with MVC / Clean architecture patterns",
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            "✅ Hands-on experience in CI/CD (GitHub Actions, Codemagic)",
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            "✅ Proficient in app publishing and maintenance",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Work Experience
                      Text(
                        "Work Experience:",
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "🏢 Seven Zero Technologies, UK (Remote)",
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            "Flutter & Frontend Developer & Backend Developer (Jan 2022 – Present)",
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "🏢 Brine Software Solutions Pvt. Ltd, Dhaka",
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            "Hybrid App Developer (Flutter | Ionic) (Sep 2019 – Oct 2021)",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Education
                      Text(
                        "Education:",
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "🎓 AVS College of Technology, Salem",
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            "B.E — Electrical and Electronics Engineering (EEE) 2014 – 2018",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/sohandev.png',
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.person,
                      size: 100,
                      color: theme.colorScheme.onBackground.withOpacity(0.3),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "About Me",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  "",
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  "I'm a Mobile App & Frontend Developer with 3+ years of experience, specializing in Flutter and React/Next.js. I love building fast, responsive, and visually appealing digital experiences that work flawlessly across devices. Passionate about writing clean, maintainable code and staying updated with the latest technologies.",
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
    );
  }
}
