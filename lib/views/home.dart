import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutterverse',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 102, 255),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterVerse'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _buildWidgetContainer(
                widgetName: 'Text Widget',
                child: const Text('Hello, Flutter!'),
              ),
              const SizedBox(height: 20),
              _buildWidgetContainer(
                widgetName: 'ElevatedButton',
                child: ElevatedButton(
                  onPressed: () {
                    // Button press logic
                    print('Button pressed!');
                  },
                  child: const Text('Click Me'),
                ),
              ),
              const SizedBox(height: 20),
              _buildWidgetContainer(
                widgetName: 'Image Widget',
                child: Image.network(
                  'https://picsum.photos/500/500', // Replace with your image URL
                  width: double.infinity, // Adjust image width if needed
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              _buildWidgetContainer(
                widgetName: 'Container Widget',
                child: Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.blue,
                  child: const Center(child: Text('Container')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetContainer({
    required String widgetName,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(widgetName),
            ],
          ),
          const SizedBox(height: 8),
          Center(
            child: child,
          ),
        ],
      ),
    );
  }
}
