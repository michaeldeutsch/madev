import 'package:flutter/material.dart';


void main(List<String> args) {
  runApp( const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DashboardResponsive(),
  ));
}

class DashboardResponsive extends StatelessWidget {
  const DashboardResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      appBar: isDesktop
          ? AppBar(title: const Text("Dashboard"))
          : null,

      drawer: isDesktop ? null : const Drawer(
        child: Sidebar(),
      ),

      body: Row(
        children: [
          if (isDesktop)
            const SizedBox(width: 220, child: Sidebar()),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: const DashboardContent(),
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////
/// SIDEBAR
///////////////////////////////////////////////

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        DrawerHeader(
          child: Text("Admin Panel", style: TextStyle(fontSize: 20)),
        ),
        ListTile(leading: Icon(Icons.dashboard), title: Text("Dashboard")),
        ListTile(leading: Icon(Icons.person), title: Text("Users")),
        ListTile(leading: Icon(Icons.analytics), title: Text("Analytics")),
        ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
      ],
    );
  }
}

///////////////////////////////////////////////
/// DASHBOARD CONTENT
///////////////////////////////////////////////

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final crossAxisCount = width >= 1200 ? 4 : width >= 800 ? 3 : 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Übersicht", style: TextStyle(fontSize: 24)),
        const SizedBox(height: 16),

        /// GRID CARDS
        Expanded(
          child: GridView.count(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              numberCard("Besucher heute", "1.240", Icons.show_chart),
              numberCard("Neue Nutzer", "175", Icons.group_add),
              numberCard("Verkäufe", "430", Icons.shopping_cart),
              numberCard("Conversion", "5.4%", Icons.trending_up),
            ],
          ),
        ),
      ],
    );
  }

  Widget numberCard(String title, String value, IconData icon) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: Colors.blue),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 16)),
            Text(value, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
