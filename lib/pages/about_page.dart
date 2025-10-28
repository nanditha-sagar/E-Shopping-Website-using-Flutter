import 'package:flutter/material.dart';
import '../pages/profile_page.dart'; // ✅ Import your Profile Page

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("About E-Shopsy"),
          backgroundColor: Colors.green,
          elevation: 0,
          actions: [
            IconButton(
              icon: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.green),
              ),
              tooltip: 'Profile',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🛍️ Logo
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green,
                backgroundImage: AssetImage("assets/images/logo.jpg"),
              ),
              const SizedBox(height: 20),

              // 🏷️ Title
              const Text(
                "About E-Shopsy",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // 🧾 Brand Story
              const Text(
                "E-Shopsy is your trusted online grocery and daily needs platform, "
                "bringing market-fresh products directly to your doorstep. "
                "We combine convenience, affordability, and sustainability — "
                "helping you shop smarter and live better.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
              ),
              const SizedBox(height: 24),

              // 🌱 Mission
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "🌱 Our Mission",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "We aim to simplify everyday shopping through technology, "
                "ensuring that every product you order is delivered fast, fresh, "
                "and at the best possible price.",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
              ),
              const SizedBox(height: 24),

              // 🚀 Why Choose Us
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "🚀 Why Choose Us",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 12),
              const FeatureTile(
                icon: Icons.local_shipping,
                title: "Superfast Delivery",
                subtitle: "Groceries at your door in hours.",
              ),
              const FeatureTile(
                icon: Icons.currency_rupee,
                title: "Best Prices",
                subtitle: "Save more with exclusive deals.",
              ),
              const FeatureTile(
                icon: Icons.eco,
                title: "Eco-Friendly",
                subtitle: "We support sustainable packaging.",
              ),
              const FeatureTile(
                icon: Icons.verified,
                title: "Top Quality",
                subtitle: "Fresh, reliable products every time.",
              ),
              const SizedBox(height: 30),

              // 👨‍💼 Leadership Team
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "👥 Leadership Team",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 16),

              const TeamMemberCard(
                name: "A N Nanditha",
                role: "Chief Executive Officer (CEO)",
                imagePath: "assets/images/ceo.jpg",
              ),
              const TeamMemberCard(
                name: "A Manideep Reddy",
                role: "Chief Technology Officer (CTO)",
                imagePath: "assets/images/cto.png",
              ),
              const TeamMemberCard(
                name: "A NandaKishor Reddy",
                role: "Chief Operating Officer (COO)",
                imagePath: "assets/images/coo.jpg",
              ),

              const SizedBox(height: 30),

              // 🌐 Learn More Button
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Website coming soon!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: const Icon(Icons.open_in_new),
                label: const Text(
                  "Learn More",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Feature Tile ---
class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green.withOpacity(0.1),
        child: Icon(icon, color: Colors.green),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
    );
  }
}

// --- Team Member Card (Rectangular Image) ---
class TeamMemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String imagePath;

  const TeamMemberCard({
    super.key,
    required this.name,
    required this.role,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // 🖼 Rectangular Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.person, size: 50, color: Colors.green),
              ),
            ),
            const SizedBox(width: 16),

            // 👤 Name & Role
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    role,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
