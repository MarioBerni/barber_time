/// Clase que define todas las rutas de la aplicación.
///
/// Centraliza la definición de las rutas para evitar strings dispersos
/// y facilitar el mantenimiento.
class AppRoutes {
  /// Ruta de la pantalla de carga inicial.
  static const String splash = '/';

  /// Ruta de la página principal de la aplicación.
  static const String home = '/home';

  /// Ruta de la página de inicio de sesión.
  static const String login = '/login';

  /// Ruta de la página de registro de nuevos usuarios.
  static const String register = '/register';

  /// Ruta de la página de perfil del usuario.
  static const String profile = '/profile';

  /// Ruta para la lista de barberías.
  static const String barberList = '/barbers';

  /// Ruta para el detalle de una barbería específica.
  static const String barberDetail = '/barber/:id';

  /// Ruta para la reserva de un servicio.
  static const String serviceBooking = '/booking/:id';

  /// Ruta para ver las citas del usuario.
  static const String appointments = '/appointments';

  /// Ruta para la configuración de la aplicación.
  static const String settings = '/settings';

  /// Función para generar una ruta con parámetros.
  static String generatePath(String path, Map<String, String> params) {
    var result = path;
    params.forEach((key, value) {
      result = result.replaceAll(':$key', value);
    });
    return result;
  }
}
