import 'package:flutter/material.dart';

class Item3Screen extends StatelessWidget {
  const Item3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item 3 Screen'),
      ),
      body: const Center(
        child: Text('This is Item 3 screen'),
      ),
    );
  }
}
