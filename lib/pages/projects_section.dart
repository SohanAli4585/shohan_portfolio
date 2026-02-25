import 'package:flutter/material.dart';
import 'project_detail_page.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Map<String, dynamic>> projects = [
    // projects list এখানে থাকবে
    {
      "title": "E-Commerce App",
      "subtitle":
          "A full-featured e-commerce mobile application with secure user authentication, product browsing, cart management, favorites, and seamless checkout experience.",
      "techStack": [
        "Flutter",
        "Firebase Auth",
        "Cloud Firestore",
        "Firebase Storage",
        "REST API",
        "CI/CD",
      ],

      "images": [
        "assets/ecomas/1.png",
        "assets/ecomas/2.png",
        "assets/ecomas/3.png",
        "assets/ecomas/4.png",
        "assets/ecomas/5.png",
        "assets/ecomas/6.png",
        "assets/ecomas/7.png",
        "assets/ecomas/8.png",
        "assets/ecomas/9.png",
        "assets/ecomas/10.png",
        "assets/ecomas/11.png",
      ],
      "video": "https://www.loom.com/share/8fec13be915144b18af7436c20b50b60",
    },
    {
      "title": "Weather App",
      "subtitle":
          "Real-time weather, hourly updates & 7-day forecast — all in one app",
      "techStack": [
        "Flutter",
        "API",
        "CI/CD",
        "Google Maps",
        "Location Tracking",
      ],
      "images": [
        "assets/weather/weatherapp.jpg",
        "assets/weather/weatherserch.jpg",
        "assets/weather/weatherseting.jpg",
      ],
      "video": "https://www.loom.com/share/d5f680aab83142ca9ea13feca521ba09",
    },
    {
      "title": "News App",
      "subtitle":
          "Stay informed with the latest news, trending stories, and daily headlines.",
      "techStack": ["Flutter", "Rest API"],
      "images": ["assets/news/newsb.jpg", "assets/news/newsg.jpg"],
      "video": "https://www.loom.com/share/6a9ea261fb254b058d322462af683f98",
    },
    {
      "title": "Walking App",
      "subtitle": "Walk. Track. Earn Rewards!",
      "techStack": ["Flutter", "Deep Linking", "Firebase", "Payment Gateway"],
      "images": [
        "assets/wlak/wlakp.jpg",
        "assets/wlak/wlakn.jpg",
        "assets/wlak/wlakg.jpg",
        "assets/wlak/wlakm.jpg",
      ],
      "video": "https://www.loom.com/share/53265a8a9fac4b8abd71833016d0d080",
    },
    {
      "title": "Online Video App",
      "subtitle":
          "A YouTube-style video streaming application that allows users to browse, search, and watch videos online with a smooth and responsive viewing experience.",
      "techStack": [
        "Flutter",
        "YouTube API",
        "REST API",
        "Video Streaming",
        "CI/CD",
      ],

      "images": [
        "assets/news/newsa.jpg",
        "assets/news/newsb.jpg",
        "assets/news/newsc.jpg",
        "assets/news/newsg.jpg",
        "assets/news/newss.jpg",
      ],
      "video": "https://www.loom.com/share/1ae2fafb254045339f7b42ad763c9326",
    },
    {
      "title": "Real-Time Chat & Call App",
      "subtitle":
          "A modern real-time messaging application with secure authentication, instant chat, voice/video calling, message editing, and smooth user experience.",
      "techStack": [
        "Flutter",
        "Firebase Auth",
        "Cloud Firestore",
        "Firebase Storage",
        "ZegoCloud",
        "WebRTC",
        "REST API",
        "CI/CD",
      ],

      "images": [
        "assets/chat/one.jpg",
        "assets/chat/tow.jpg",
        "assets/chat/thare.jpg",
        "assets/chat/four.jpg",
        "assets/chat/five.jpg",
        "assets/chat/six.jpg",
        "assets/chat/siven.jpg",
        "assets/chat/eight.jpg",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = 3;
    if (screenWidth < 1200) crossAxisCount = 2;
    if (screenWidth < 800) crossAxisCount = 1;

    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Projects",
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
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
              childAspectRatio: 0.80,
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
                    color: theme.brightness == Brightness.dark
                        ? Colors.blueGrey.shade900
                        : Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: theme.brightness == Brightness.dark
                            ? Colors.black45
                            : Colors.grey.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onBackground,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              project["subtitle"],
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onBackground
                                    .withOpacity(0.8),
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
                                    color: theme.brightness == Brightness.dark
                                        ? Colors.blueGrey.shade800
                                        : Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    project["techStack"][i],
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600,
                                      color: theme.colorScheme.onBackground,
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
