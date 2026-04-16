import 'package:flutter/material.dart';

void main() {
  runApp(const NurexusApp());
}

class NurexusApp extends StatelessWidget {
  const NurexusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nurexus',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A237E)),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  
  final List<Widget> _pages = [
    const CommunityFeed(),
    const ChatListScreen(),
    const MarketplaceScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1A237E),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.storefront_outlined), label: 'Market'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

// --- COMMUNITY FEED: Where local places communicate ---
class CommunityFeed extends StatelessWidget {
  const CommunityFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NUREXUS COMMUNITY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "What's happening in your area?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          _buildPost("Village Supplier", "Just received a new batch of high-quality cement. Available for local pickup!"),
          _buildPost("Local Builder", "Looking for 3 laborers for a project starting Monday in the village hub."),
          _buildPost("Nurexus Admin", "New exchange rates for PayPal to Paga are now live in the Wallet section."),
        ],
      ),
    );
  }

  Widget _buildPost(String user, String content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundColor: Colors.indigo, child: Icon(Icons.person, color: Colors.white, size: 20)),
                const SizedBox(width: 10),
                Text(user, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            Text(content, style: const TextStyle(color: Colors.black87)),
            const SizedBox(height: 10),
            Row(
              children: [
                TextButton.icon(onPressed: () {}, icon: const Icon(Icons.chat_outlined, size: 18), label: const Text("Reply")),
                TextButton.icon(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined, size: 18), label: const Text("Buy")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// --- MARKETPLACE: Where people buy and sell ---
class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Local Marketplace')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.8
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          final items = ["Building Blocks", "Wood Timber", "Steel Rods", "Roofing Sheets"];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.inventory_2, size: 40, color: Colors.indigo),
                const SizedBox(height: 10),
                Text(items[index], style: const TextStyle(fontWeight: FontWeight.bold)),
                const Text("\$ price varies", style: TextStyle(color: Colors.green, fontSize: 12)),
                ElevatedButton(onPressed: () {}, child: const Text("Buy Now")),
              ],
            ),
          );
        },
      ),
    );
  }
}

// --- CHAT LIST ---
class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text('Local User ${index + 1}'),
          subtitle: const Text('I am interested in your listing...'),
          onTap: () {},
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Your Business Profile")));
  }
}
