import 'package:flutter/material.dart';

class CustomSideMenu extends StatelessWidget {
  const CustomSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Parameters',
          style: TextStyle(fontSize: 30, color: Colors.black),
        )
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final VoidCallback onMenuPressed;

  const CustomAppBar({super.key, required this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: onMenuPressed,
          ),
          const Expanded(
              child: Center(
                child: Text(
                    "Wolfram",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    )
                ),
              )
          ),
        ],
      ),
    );
  }
}
