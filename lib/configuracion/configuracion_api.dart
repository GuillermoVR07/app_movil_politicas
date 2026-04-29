class ConfiguracionApi {
  /*
   * Para Flutter Web en Microsoft Edge usando backend local:
   */
  static const String urlBase = 'http://localhost:8080/api';

  /*
   * Para Android Emulator, usa esta URL:
   * static const String urlBase = 'http://10.0.2.2:8080/api';
   *
   * Para APK instalada en teléfono con backend en la nube, usa algo como:
   * static const String urlBase = 'https://TU_BACKEND_EN_LA_NUBE/api';
   *
   * No uses localhost en una APK instalada en teléfono,
   * porque localhost sería el propio teléfono.
   */
}
