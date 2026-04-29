import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class ServicioNotificacion {
  static String? tokenNotificacion;

  static Future<void> inicializar() async {
    try {
      await Firebase.initializeApp();

      final FirebaseMessaging mensajeria = FirebaseMessaging.instance;

      final NotificationSettings permisos = await mensajeria.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      debugPrint('Permiso de notificaciones: ${permisos.authorizationStatus}');

      tokenNotificacion = await mensajeria.getToken();

      debugPrint('Token de notificación del dispositivo: $tokenNotificacion');

      FirebaseMessaging.onMessage.listen((RemoteMessage mensaje) {
        debugPrint('Notificación recibida en primer plano');
        debugPrint('Título: ${mensaje.notification?.title}');
        debugPrint('Mensaje: ${mensaje.notification?.body}');
        debugPrint('Datos: ${mensaje.data}');
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage mensaje) {
        debugPrint('El usuario abrió la app desde una notificación');
        debugPrint('Datos: ${mensaje.data}');
      });

      final RemoteMessage? mensajeInicial = await FirebaseMessaging.instance
          .getInitialMessage();

      if (mensajeInicial != null) {
        debugPrint('La app se abrió desde una notificación cerrada');
        debugPrint('Datos: ${mensajeInicial.data}');
      }
    } catch (error) {
      debugPrint('No se pudo inicializar Firebase Messaging: $error');
    }
  }

  static String? obtenerToken() {
    return tokenNotificacion;
  }
}
