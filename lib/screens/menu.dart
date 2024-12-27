import 'package:flutter/material.dart';
import 'package:toko_camera_mobile/widgets/left_drawer.dart';
import 'package:toko_camera_mobile/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  final String npm = '2306173555'; // NPM
  final String name = 'Muhammad Jordan Ar-Razi Aziz'; // Name
  final String className = 'KKI'; // Class
  final List<ItemHomepage> items = [
    ItemHomepage("View Product", Icons.mood, Colors.blue.shade600),
    ItemHomepage("Add Product", Icons.add, Colors.indigo),
    ItemHomepage("Logout", Icons.logout, Colors.redAccent.shade700),
  ];
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic structure of the page with the AppBar and body.
    return Scaffold(
      // AppBar is the top part of the page that displays the title.
      appBar: AppBar(
        // The title of the application "Mental Health Tracker" with white text and bold font.
        title: const Text(
          'Toko Camera',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // The background color of the AppBar is obtained from the application theme color scheme.
        iconTheme: const IconThemeData(color: Colors.red),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'your one stop shop for Camera needs',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
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

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}
