import 'package:flutter/material.dart';
import 'package:FlutterVerse/services/notification_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure notifications are initialized before running the app
  await NotificationService.initializeNotifications();

  runApp(const NotificationServiceApp());
}

class NotificationServiceApp extends StatelessWidget {
  const NotificationServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notification Service'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Press the button to send a notification'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await NotificationService.requestNotificationPermission();
                },
                child: Text('Request Notification Permission'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await NotificationService.createNotification();
          },
          child: Icon(
            Icons.notification_add,
          ),
        ),
      ),
    );
  }
}
