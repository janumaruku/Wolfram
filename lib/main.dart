import 'package:flutter/material.dart';

import 'menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isMenuOpen = true; // Track menu visibility

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(onMenuPressed: toggleMenu),
          Expanded(
            child: Row(
              children: [
                // Sidebar with animation
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: isMenuOpen ? 250 : 0,
                  alignment: Alignment.topCenter,
                  child: isMenuOpen ? const CustomSideMenu() : const SizedBox.shrink(),
                ),
                // Main content
                const Expanded(
                  child: CustomMainPage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Main Content
class CustomMainPage extends StatelessWidget {
  const CustomMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text("Main Page Content", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
