import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  static Future<void> initializeNotifications() async {
    try {
      await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            channelKey: "alerts",
            channelName: "Alerts Notification",
            channelDescription: "Alerts notifications channel",
          ),
        ],
        channelGroups: [
          NotificationChannelGroup(
            channelGroupKey: "alerts_group",
            channelGroupName: "Alerts Group",
          ),
        ],
      );
      print("Notifications initialized successfully.");

      bool isAllowedToSendNotification =
          await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowedToSendNotification) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
        print("Notification permission requested.");
      } else {
        print("Notification permission already granted.");
      }

      AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod,
      );
      print("Notification listeners set successfully.");
    } catch (e) {
      print("Error initializing notifications: $e");
    }
  }

  static Future<void> createNotification() async {
    try {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: "alerts",
          title: "Hello world!",
          body: "Yay! I have local notifications working now!",
        ),
      );
      print("Notification created successfully.");
    } catch (e) {
      print("Error creating notification: $e");
    }
  }

  static Future<void> requestNotificationPermission() async {
    try {
      bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
        print("Notification permission requested.");
      } else {
        print("Notification permission already granted.");
      }
    } catch (e) {
      print("Error requesting notification permission: $e");
    }
  }
}

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {}

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {}

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {}

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {}
}
