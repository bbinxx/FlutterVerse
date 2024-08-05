import 'package:flutter/material.dart';

class Item2Screen extends StatelessWidget {
  const Item2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item 2 Screen'),
      ),
      body: const Center(
        child: Text('This is Item 2 screen'),
      ),
    );
  }
}
