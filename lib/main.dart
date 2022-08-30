
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Providers/Database.dart';
import 'package:todoapp/Providers/notification_services.dart';
import 'package:todoapp/Screen/splash_screen.dart';

import 'Screen/Add_Task_Screean.dart';
import 'Screen/Home_screen.dart';
import 'Screen/calender_page.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
const AndroidNotificationChannel channel = const AndroidNotificationChannel(
  //for notificaiton initialization
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: "this",
  importance: Importance.high,
  playSound: true,
);


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await NotificationHelper().initializeNotification();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // navigation bar color
    statusBarColor: Colors.white70, // status bar color
    statusBarBrightness: Brightness.dark
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Database_prov()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'varela',
        ),
        title: "2DO",
        home: Splash_screen(),
        routes: {
          AddTask_Screen.scid:(context)=>AddTask_Screen(),
          CalenderPage.scid:(context)=>CalenderPage(),

        },
      ),
    )
  );
}
