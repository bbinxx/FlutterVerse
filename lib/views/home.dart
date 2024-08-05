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
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutterverse'),
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

              // TextFormField with button

              _buildWidgetContainer(
                widgetName: 'TextFormField',
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Enter your name',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String name = _nameController.text;
                        print('Name: $name');
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // TextField
              _buildWidgetContainer(
                widgetName: 'TextField',
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
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
