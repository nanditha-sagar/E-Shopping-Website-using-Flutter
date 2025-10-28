import 'package:flutter/material.dart';
import '../pages/profile_page.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  final List<Map<String, dynamic>> services = const [
    {
      "icon": Icons.local_shipping,
      "title": "Fast Delivery",
      "description":
          "Your essentials delivered to your doorstep in record time — fresh, fast, and hassle-free."
    },
    {
      "icon": Icons.currency_rupee,
      "title": "Best Prices",
      "description":
          "Shop smart and save big every day with exclusive deals, offers, and unbeatable value."
    },
    {
      "icon": Icons.support_agent,
      "title": "24x7 Customer Support",
      "description":
          "Need help? Our friendly team is here for you anytime, anywhere — chat or call support."
    },
    {
      "icon": Icons.shopping_basket,
      "title": "Wide Product Range",
      "description":
          "From groceries to fashion — explore a wide variety of trusted brands and products."
    },
    {
      "icon": Icons.autorenew,
      "title": "Easy Returns & Refunds",
      "description":
          "Changed your mind? Return items easily with our quick and transparent refund process."
    },
    {
      "icon": Icons.security,
      "title": "Safe & Secure Payments",
      "description":
          "Your payments are 100% protected with encrypted, trusted gateways and multiple options."
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[50],

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // 🌿 Gradient Header (replaces AppBar)
              Stack(
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green.shade400, Colors.green.shade700],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: IconButton(
                      icon: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Colors.green),
                      ),
                      tooltip: "Profile",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ProfilePage()),
                        );
                      },
                    ),
                  ),
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.handshake, color: Colors.white, size: 60),
                        SizedBox(height: 12),
                        Text(
                          "Our Services",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Making your shopping experience smooth, reliable, and joyful.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // 💚 Responsive Service Cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: services.map((service) {
                    return SizedBox(
                      width: (screenWidth / 2) - 28,
                      child: _buildServiceCard(service),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 30),

              // 📞 CTA Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green.shade100),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Need Assistance?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Our team is always here to help you with your orders, payments, and delivery concerns.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black87, height: 1.4),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Connecting with support team... ☎️"),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 36,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        icon: const Icon(Icons.headset_mic, color: Colors.white),
                        label: const Text(
                          "Contact Support",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Service Card Builder
  Widget _buildServiceCard(Map<String, dynamic> service) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                service["icon"] as IconData,
                color: Colors.green,
                size: 30,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              service["title"] as String,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              service["description"] as String,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
