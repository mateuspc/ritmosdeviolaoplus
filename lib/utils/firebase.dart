// import 'dart:io';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// FirebaseMessaging fcm;
//
// void initFcm() {
//   if (fcm == null) {
//     fcm = FirebaseMessaging.instance;
//   }
//
//   fcm.getToken().then((token) {
//     print("\n******\nFirebase Token $token\n******\n");
//   });
//
//
//   fcm.subscribeToTopic("all");
//
//
//   fcm.configure(
//     onMessage: (Map<String, dynamic> message) async {
//      // showNotification('titulo', 'mensagem');
//     // if (message['data']['divulgarNovoAppP2'] != '') {
//     //   abrirLink(message['data']['divulgarNovoAppP2']);
//     // }
//     // if (message['data']['divulgarEsseLinkAfiliadoP3'] != '') {
//     //   abrirLink(message['data']['divulgarEsseLinkAfiliadoP3']);
//     // }
//
//        }
//     ,
//     onResume: (Map<String, dynamic> message) async {
//       print('\n\n\n*** on resume $message');
//     },
//     onLaunch: (Map<String, dynamic> message) async {
//       print('\n\n\n*** on launch $message');
//     },
//   );
//
//   if (Platform.isIOS) {
//     fcm.requestNotificationPermissions(
//         IosNotificationSettings(sound: true, badge: true, alert: true));
//     fcm.onIosSettingsRegistered
//         .listen((IosNotificationSettings settings) {
//       print("iOS Push Settings: [$settings]");
//     });
//   }
//
//
//
// }