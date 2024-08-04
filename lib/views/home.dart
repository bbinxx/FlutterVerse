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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedValue;
  final List<String> items = ['Item 1', 'Item 2', 'Item 3'];

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
              // Text Widget
              _buildWidgetContainer(
                widgetName: 'Text Widget',
                child: const Text('Hello, Flutter!'),
              ),
              const SizedBox(height: 20),
              // Image Widget
              _buildWidgetContainer(
                widgetName: 'Image Widget',
                child: Image.network(
                  'https://picsum.photos/500/500', // Replace with your image URL
                  width: double.infinity, // Adjust image width if needed
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              //End of wdiget

              // Container Widget
              _buildWidgetContainer(
                widgetName: 'Container Widget',
                child: Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.blue,
                  child: const Center(child: Text('Container')),
                ),
              ),
              const SizedBox(height: 20),
              //End of wdiget

              // ElevatedButton
              _buildWidgetContainer(
                widgetName: 'ElevatedButton',
                child: ElevatedButton(
                  onPressed: () {
                    // Button press logic
                    print('ElevatedButton!');
                  },
                  child: const Text('Click Me'),
                ),
              ),
              const SizedBox(height: 20),
              //End of wdiget

              // TextButton
              _buildWidgetContainer(
                widgetName: 'Text Button',
                child: TextButton(
                  onPressed: () {
                    print('TextButton!');
                  },
                  child: const Text('Click Me'),
                ),
              ),
              const SizedBox(height: 20),
              //End of wdiget

              // OutlineButton
              _buildWidgetContainer(
                widgetName: 'Outline Button',
                child: OutlinedButton(
                  onPressed: () {
                    print('OutlinedButton!');
                  },
                  child: const Text('Click Me'),
                ),
              ),
              const SizedBox(height: 20),
              //End of wdiget

              // IconButton
              _buildWidgetContainer(
                widgetName: 'Icon Button',
                child: IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    print('IconButton!');
                  },
                ),
              ),
              const SizedBox(height: 20),
              //End of wdiget

              // FloatingActionButton
              _buildWidgetContainer(
                widgetName: 'FloatingActionButton',
                child: FloatingActionButton(
                  onPressed: () {
                    print('FloatingActionButton!');
                  },
                  child: const Icon(Icons.add),
                ),
              ),
              const SizedBox(height: 20),
              //End of wdiget

              // DropdownButton
              _buildWidgetContainer(
                widgetName: 'DropdownButton',
                child: DropdownButton<String>(
                  value: selectedValue,
                  items: items.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              //End of wdiget
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
              Text(
                widgetName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Center(child: child),
        ],
      ),
    );
  }
}
