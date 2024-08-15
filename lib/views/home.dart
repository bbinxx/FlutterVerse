import 'package:FlutterVerse/main.dart';
import 'package:flutter/material.dart';
import 'package:FlutterVerse/views/page1.dart';
import 'package:FlutterVerse/views/page2.dart';
import 'package:FlutterVerse/views/page3.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: FToastBuilder(),
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
  late FToast fToast;
  String? selectedValue;
  final List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutterverse'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(ThemeNotifier.instance.value == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () {
              ThemeNotifier.instance.toggleTheme();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_rounded),
              title: const Text('Item 1'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Item1Screen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_rounded),
              title: const Text('Item 2'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Item2Screen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_rounded),
              title: const Text('Item 3'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Item3Screen()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildTextWidget(),
              const SizedBox(height: 20),
              _buildImageWidget(),
              const SizedBox(height: 20),
              _buildContainerWidget(),
              const SizedBox(height: 20),
              _buildElevatedButtonWidget(),
              const SizedBox(height: 20),
              _buildTextButtonWidget(),
              const SizedBox(height: 20),
              _buildOutlinedButtonWidget(),
              const SizedBox(height: 20),
              _buildIconButtonWidget(),
              const SizedBox(height: 20),
              _buildFloatingActionButtonWidget(),
              const SizedBox(height: 20),
              _buildDropdownButtonWidget(),
              const SizedBox(height: 20),
              _buildTextFormFieldWidget(),
              const SizedBox(height: 20),
              _buildTextFieldWidget(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build the Text Widget
  Widget _buildTextWidget() {
    return _buildWidgetContainer(
      widgetName: 'Text Widget',
      child: const Text('Hello, Flutter!'),
    );
  }

  // Method to build the Image Widget
  Widget _buildImageWidget() {
    return _buildWidgetContainer(
      widgetName: 'Image Widget',
      child: Image.network(
        'https://picsum.photos/400/400', // Replace with your image URL
        width: double.infinity, // Adjust image width if needed
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Center(child: Text('Failed to load image'));
        },
      ),
    );
  }

  // Method to build the Container Widget
  Widget _buildContainerWidget() {
    return _buildWidgetContainer(
      widgetName: 'Container Widget',
      child: Container(
        width: double.infinity,
        height: 150,
        color: Colors.blue,
        child: const Center(child: Text('Container')),
      ),
    );
  }

  // Method to build the ElevatedButton Widget
  Widget _buildElevatedButtonWidget() {
    return _buildWidgetContainer(
      widgetName: 'ElevatedButton',
      child: ElevatedButton(
        onPressed: () {
          print('ElevatedButton!');
          _showToast("ElevatedButton");
        },
        child: const Text('Click Me'),
      ),
    );
  }

  // Method to build the TextButton Widget
  Widget _buildTextButtonWidget() {
    return _buildWidgetContainer(
      widgetName: 'Text Button',
      child: TextButton(
        onPressed: () {
          print('TextButton!');
          _showToast("TextButton");
        },
        child: const Text('Click Me'),
      ),
    );
  }

  // Method to build the OutlinedButton Widget
  Widget _buildOutlinedButtonWidget() {
    return _buildWidgetContainer(
      widgetName: 'Outline Button',
      child: OutlinedButton(
        onPressed: () {
          print('OutlinedButton!');
          _showToast("OutlinedButton");
        },
        child: const Text('Click Me'),
      ),
    );
  }

  // Method to build the IconButton Widget
  Widget _buildIconButtonWidget() {
    return _buildWidgetContainer(
      widgetName: 'Icon Button',
      child: IconButton(
        icon: const Icon(Icons.favorite),
        onPressed: () {
          print('IconButton!');
          _showToast("IconButton");
        },
      ),
    );
  }

  // Method to build the FloatingActionButton Widget
  Widget _buildFloatingActionButtonWidget() {
    return _buildWidgetContainer(
      widgetName: 'FloatingActionButton',
      child: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton!');
          _showToast("FloatingActionButton");
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // Method to build the DropdownButton Widget
  Widget _buildDropdownButtonWidget() {
    return _buildWidgetContainer(
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
    );
  }

  // Method to build the TextFormField Widget
  Widget _buildTextFormFieldWidget() {
    return _buildWidgetContainer(
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
              _showToast(name);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  // Method to build the TextField Widget
  Widget _buildTextFieldWidget() {
    return _buildWidgetContainer(
      widgetName: 'TextField',
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  void _showToast(String message) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
        ],
      ),
    );

    // Custom Toast Position
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 1),
      // positionedToastBuilder: (context, child) {
      //   return Positioned(
      //     child: child,
      //     top: 16.0,
      //     left: 16.0,
      //   ),
    );
    // Fluttertoast.showToast(
    //     msg: message,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
  }

  // Method to build a widget container with a title and child widget
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
