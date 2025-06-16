/// Clase que define todas las rutas de la aplicación
///
/// Centraliza la definición de las rutas para evitar strings dispersos
/// y facilitar el mantenimiento
class AppRoutes {
  // Rutas principales
  static const String splash = '/';
  static const String home = '/home';
  
  // Rutas de autenticación
  static const String login = '/login';
  static const String register = '/register';
  
  // Rutas de perfil
  static const String profile = '/profile';
  
  // Rutas de barbería/servicios
  static const String barberList = '/barbers';
  static const String barberDetail = '/barber/:id';
  static const String serviceBooking = '/booking/:id';
  
  // Rutas de usuario
  static const String appointments = '/appointments';
  static const String settings = '/settings';
  
  // Función para generar una ruta con parámetros
  static String generatePath(String path, Map<String, String> params) {
    String result = path;
    params.forEach((key, value) {
      result = result.replaceAll(':$key', value);
    });
    return result;
  }
}
