import 'package:flutter/material.dart';

class ProjectDetailPage extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final images = project["images"] as List<dynamic>;
    final techStack = project["techStack"] as List<dynamic>;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          project["title"],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 30,
        ), // padding বাড়ানো
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ Grid of images: 4 per row
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // এক row-এ ৪টি image
                crossAxisSpacing: 20, // space বাড়ানো
                mainAxisSpacing: 20, // space বাড়ানো
                childAspectRatio: 9 / 18, // cards লম্বা
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24), // বড় corner
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26.withOpacity(0.15),
                        blurRadius: 8,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(images[index], fit: BoxFit.cover),
                  ),
                );
              },
            ),
            const SizedBox(height: 50), // niche space বাড়ানো
            // 🧾 Project Title
            Text(
              project["title"],
              style: const TextStyle(
                fontSize: 30, // title বড় করা
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16), // title-spacing
            // 📝 Project Description
            Text(
              project["subtitle"],
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black87,
                height: 1.7,
              ),
            ),
            const SizedBox(height: 35), // description-space
            // ⚙️ Tech Stack
            const Text(
              "Tech Stack",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 14, // chip-spacing
              runSpacing: 14, // chip-spacing
              children: techStack.map((tech) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(18), // chip-rounding
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: const Offset(1, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    tech,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 50), // bottom space
          ],
        ),
      ),
    );
  }
}
