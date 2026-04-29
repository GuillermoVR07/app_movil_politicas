import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class ServicioNotificacion {
  static Future<void> inicializar() async {
    try {
      await Firebase.initializeApp();

      final FirebaseMessaging mensajeria = FirebaseMessaging.instance;

      await mensajeria.requestPermission();

      final token = await mensajeria.getToken();

      debugPrint('Token de notificación del dispositivo: $token');

      FirebaseMessaging.onMessage.listen((RemoteMessage mensaje) {
        debugPrint('Notificación recibida: ${mensaje.notification?.title}');
        debugPrint('Mensaje: ${mensaje.notification?.body}');
      });
    } catch (error) {
      debugPrint('No se pudo inicializar Firebase Messaging: $error');
    }
  }
}