import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:homeworkout/db%20model/db_model.dart';
import 'package:homeworkout/db%20model/diet_model.dart';
import 'package:homeworkout/db%20model/message_model.dart';
import 'package:homeworkout/db%20model/report_model.dart';
import 'package:homeworkout/db%20model/tips_model.dart';
import 'package:homeworkout/screen/notification_controller.dart';
import 'package:homeworkout/screen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelGroupKey: "basic_channel_group",
        channelKey: "basic_channel",
        channelName: "Basic Notifications",
        channelDescription: "Basic notifications channel")
  ], channelGroups: [
    NotificationChannelGroup(
      channelGroupKey: "basic_channel_group",
      channelGroupName: "Basic Group",
    )
  ]);
  bool isAllowedToSendNotification =
      await AwesomeNotifications().isNotificationAllowed();

  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!isAllowedToSendNotification) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }

  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(TypelevelAdapter().typeId)) {
    Hive.registerAdapter(TypelevelAdapter());
  }

  if (!Hive.isAdapterRegistered(SubCategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(SubCategoryTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(DietTypeAdapter().typeId)) {
    Hive.registerAdapter(DietTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(DietModalAdapter().typeId)) {
    Hive.registerAdapter(DietModalAdapter());
  }

  if (!Hive.isAdapterRegistered(TipsModalAdapter().typeId)) {
    Hive.registerAdapter(TipsModalAdapter());
  }
  if (!Hive.isAdapterRegistered(MessageModalAdapter().typeId)) {
    Hive.registerAdapter(MessageModalAdapter());
  }
  if (!Hive.isAdapterRegistered(ReportmodalAdapter().typeId)) {
    Hive.registerAdapter(ReportmodalAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: const Splashscrn(),
    );
  }
}
