import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_do_aluno/app/shared/themes/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  late FlutterLocalNotificationsPlugin fltNotification;

  void pushFCMtoken() async {
    String? token = await messaging.getToken();
    debugPrint(token);
  }

  void _launchUrl({required String url}) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    pushFCMtoken();
    initMessaging();
  }

  void initMessaging() {
    var androiInit =
        const AndroidInitializationSettings('@mipmap/ic_launcher'); //for logo
    var iosInit = const IOSInitializationSettings();
    var initSetting = InitializationSettings(android: androiInit, iOS: iosInit);
    fltNotification = FlutterLocalNotificationsPlugin();
    fltNotification.initialize(initSetting,
        onSelectNotification: (String? payload) async {
      debugPrint('notification payload: $payload');

      if (payload != null) {
        if (payload == "disciplinas" ||
            payload == "avisos" ||
            payload == "materiais" ||
            payload == "professores") {
          Modular.to.pushNamed('/$payload');
        } else if (payload.contains("https://adx.doctum.edu.br")) {
          _launchUrl(url: payload);
        } else if (payload.contains("https://")) {
          _launchUrl(url: payload);
        }
      }
    });
    var androidDetails = const AndroidNotificationDetails(
        '1', 'channelName', 'channel Description');
    var iosDetails = const IOSNotificationDetails();
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        fltNotification.show(notification.hashCode, notification.title,
            notification.body, generalNotificationDetails,
            payload: message.data['route']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Guia do Aluno',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
        ),
        initialRoute: "/",
      ).modular();
    });
  }
}
