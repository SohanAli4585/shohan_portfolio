import 'package:flutter/material.dart';
import 'project_detail_page.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Map<String, dynamic>> projects = [
    {
      "title": "weather app",
      "subtitle":
          "Real-time weather, hourly updates & 7-day forecast — all in one app",
      "techStack": [
        "Flutter",
        "API",
        "CI/CD",
        "Google Maps",
        "Location T Racking",
      ],
      "images": [
        "assets/weather/weatherapp.jpg",
        "assets/weather/weatherserch.jpg",
        "assets/weather/weatherseting.jpg",
      ],
    },
    {
      "title": "News App",
      "subtitle":
          "Stay informed with the latest news, trending stories, and daily headlines.",
      "techStack": ["Flutter", "Rest API"],
      "images": ["assets/news/newsb.jpg", "assets/news/newsg.jpg"],
    },
    {
      "title": "Wlaking App",
      "subtitle": "Walk. Track. Earn Rewards!",
      "techStack": ["Flutter", "Deep Linking", "Firebase", "Payment Gateway"],
      "images": [
        "assets/wlak/wlakp.jpg",
        "assets/wlak/wlakn.jpg",
        "assets/wlak/wlakg.jpg",
        "assets/wlak/wlakm.jpg",
      ],
    },

    {
      "title": "News App",
      "subtitle":
          "Rider-focused delivery app enabling flexible shifts, real-time tracking, and efficient delivery management.",
      "techStack": [
        "Flutter",
        "Graphql",
        "CI/CD",
        "Google Maps",
        "Location Tracking",
      ],
      "images": [
        "assets/news/newsa.jpg",
        "assets/news/newsb.jpg",
        "assets/news/newsc.jpg",
        "assets/news/newsg.jpg",
        "assets/news/newss.jpg",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = 3;
    if (screenWidth < 1200) crossAxisCount = 2;
    if (screenWidth < 800) crossAxisCount = 1;

    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Projects",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (context, index) {
              final project = projects[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProjectDetailPage(project: project),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // শুধু প্রথম ছবি দেখাও
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(18),
                        ),
                        child: Image.asset(
                          project["images"][0],
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project["title"],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              project["subtitle"],
                              style: TextStyle(
                                fontSize: 14.5,
                                color: Colors.grey.shade800,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: List.generate(
                                project["techStack"].length,
                                (i) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    project["techStack"][i],
                                    style: const TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
  }
}
