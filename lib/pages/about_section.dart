import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
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
                        return const Icon(
                          Icons.person,
                          size: 200,
                          color: Colors.grey,
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
                      Text(
                        "About Me",
                        style: GoogleFonts.poppins(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Md Shohan Ahamed\nFlutter App / Frontend Developer\nDhaka, Bangladesh",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "I'm a Mobile App & Frontend Developer with 3+ years of experience, specializing in Flutter and React/Next.js. I love building fast, responsive, and visually appealing digital experiences that work flawlessly across devices. Passionate about writing clean, maintainable code and staying updated with the latest technologies, I focus on creating user-centric products that blend performance, design, and scalability.",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.grey[700],
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Skills
                      Text(
                        "Skills & Expertise:",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("✅ Expert in Flutter and React/Next.js"),
                          Text("✅ Skilled in API integration — REST & GraphQL"),
                          Text("✅ Experienced with Firebase and Google Cloud"),
                          Text(
                            "✅ Strong knowledge of state management (GetX, Provider, BLoC)",
                          ),
                          Text(
                            "✅ Familiar with MVC / Clean architecture patterns",
                          ),
                          Text(
                            "✅ Hands-on experience in CI/CD (GitHub Actions, Codemagic)",
                          ),
                          Text(
                            "✅ Proficient in app publishing and maintenance",
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Work Experience
                      Text(
                        "Work Experience:",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("🏢 Seven Zero Technologies, UK (Remote)"),
                          Text(
                            "Flutter & Frontend Developer & Bekend Developer (Jan 2022 – Present)",
                          ),
                          SizedBox(height: 8),
                          Text("🏢 Brine Software Solutions Pvt. Ltd, Dhaka"),
                          Text(
                            "Hybrid App Developer (Flutter | Ionic) (Sep 2019 – Oct 2021)",
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Education
                      Text(
                        "Education:",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("🎓 AVS College of Technology, Salem"),
                          Text(
                            "B.E — Electrical and Electronics Engineering (EEE) 2014 – 2018",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          // Mobile layout
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/sohandev.png',
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person, size: 100),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "About Me",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  "I'm a Mobile App & Frontend Developer with 3+ years of experience, specializing in Flutter and React/Next.js. I love building fast, responsive, and visually appealing digital experiences that work flawlessly across devices. Passionate about writing clean, maintainable code and staying updated with the latest technologies.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
    );
  }
}
