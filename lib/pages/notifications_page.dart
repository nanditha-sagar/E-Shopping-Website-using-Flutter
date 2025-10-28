import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
    with SingleTickerProviderStateMixin {
  late List<Map<String, dynamic>> notifications;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    notifications = [
      {
        "title": "Order Delivered 🎉",
        "message":
            "Your order #12345 has been successfully delivered. We hope you enjoyed your shopping!",
        "time": "2 hours ago",
        "icon": Icons.local_shipping,
      },
      {
        "title": "Flash Sale Alert ⚡",
        "message":
            "Up to 50% OFF on fruits and vegetables today! Grab the best deals before midnight.",
        "time": "5 hours ago",
        "icon": Icons.local_offer,
      },
      {
        "title": "Cart Reminder 🛒",
        "message":
            "You left 3 items in your cart. Complete your order now and enjoy free delivery!",
        "time": "Yesterday",
        "icon": Icons.shopping_cart,
      },
      {
        "title": "Loyalty Bonus 💎",
        "message":
            "You’ve earned ₹150 in loyalty rewards! Redeem them on your next purchase.",
        "time": "2 days ago",
        "icon": Icons.card_giftcard,
      },
      {
        "title": "Service Update 📦",
        "message":
            "We’ve expanded delivery coverage to new areas across Bengaluru. Thank you for your support!",
        "time": "3 days ago",
        "icon": Icons.notifications_active,
      },
    ];

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  void _markAllAsRead() async {
    await _controller.forward();

    setState(() {
      notifications.clear();
    });

    _controller.reset();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("All notifications marked as read ✅"),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      // ✅ NO APPBAR HERE — fullscreen design
      body: SafeArea(
        child: notifications.isEmpty
            ? _buildEmptyState()
            : FadeTransition(
                opacity: Tween(begin: 1.0, end: 0.0).animate(_controller),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Custom title (inline, not AppBar)
                      const Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 20),
                        child: Text(
                          "Notifications",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),

                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: notifications.length,
                          itemBuilder: (context, index) {
                            final item = notifications[index];
                            return _buildNotificationCard(item);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),

      floatingActionButton: notifications.isEmpty
          ? null
          : FloatingActionButton.extended(
              backgroundColor: Colors.green,
              onPressed: _markAllAsRead,
              icon: const Icon(Icons.check_circle_outline),
              label: const Text("Mark All Read"),
            ),
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> item) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black12,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: Colors.green.withOpacity(0.15),
          child: Icon(item["icon"] as IconData, color: Colors.green, size: 26),
        ),
        title: Text(
          item["title"] as String,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item["message"] as String,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 6),
              Text(
                item["time"] as String,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        isThreeLine: true,
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Opened: ${item["title"]}"),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.notifications_off_rounded,
                size: 100, color: Colors.grey),
            const SizedBox(height: 20),
            const Text(
              "No new notifications 🎉",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "You're all caught up! We'll let you know when there's something new.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  notifications = [
                    {
                      "title": "New Offer 💰",
                      "message":
                          "Flat 20% off on your next grocery order. Limited time offer!",
                      "time": "Just now",
                      "icon": Icons.local_offer_outlined,
                    }
                  ];
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text("Refresh"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
