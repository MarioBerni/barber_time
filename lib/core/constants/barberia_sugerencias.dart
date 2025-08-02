/// Tipo de coincidencia encontrada
enum TipoCoincidencia { nombre, direccion }

/// Estructura para una sugerencia con su tipo
class Sugerencia {
  final String texto;
  final TipoCoincidencia tipo;

  const Sugerencia(this.texto, this.tipo);
}

/// Provee métodos de utilidad para generar sugerencias de barberías
/// basadas en nombres y ubicaciones de salones existentes.
class BarberiaSugerencias {
  // Constructor privado para evitar instanciación.
  BarberiaSugerencias._();

  /// Obtiene sugerencias de barberías basadas en texto de búsqueda.
  ///
  /// Busca en nombres de salones y direcciones que coincidan con el texto.
  /// Retorna sugerencias con información del tipo de coincidencia.
  static List<Sugerencia> obtenerSugerenciasConTipo(
    String busqueda,
    List<Map<String, String>> salones, {
    int limite = 5,
  }) {
    if (busqueda.isEmpty) {
      return [];
    }

    final terminoBusqueda = busqueda.toLowerCase().trim();
    final sugerencias = <Sugerencia>[];

    // Buscar en nombres de salones
    for (final salon in salones) {
      final nombre = salon['name'] ?? '';
      if (nombre.toLowerCase().contains(terminoBusqueda)) {
        sugerencias.add(Sugerencia(nombre, TipoCoincidencia.nombre));
      }
    }

    // Buscar en direcciones de salones
    for (final salon in salones) {
      final direccion = salon['address'] ?? '';
      if (direccion.toLowerCase().contains(terminoBusqueda)) {
        sugerencias.add(Sugerencia(direccion, TipoCoincidencia.direccion));
      }
    }

    // Remover duplicados y limitar resultados
    final sugerenciasUnicas = sugerencias.toSet().toList();
    if (sugerenciasUnicas.length <= limite) {
      return sugerenciasUnicas;
    }

    return sugerenciasUnicas.sublist(0, limite);
  }

  /// Obtiene sugerencias de barberías basadas en texto de búsqueda.
  ///
  /// Busca en nombres de salones y direcciones que coincidan con el texto.
  /// Similar a MontevideoBarrios.obtenerSugerencias() pero para barberías.
  /// [DEPRECATED] Usar obtenerSugerenciasConTipo() para mejor clasificación de iconos.
  static List<String> obtenerSugerencias(
    String busqueda,
    List<Map<String, String>> salones, {
    int limite = 5,
  }) {
    final sugerenciasConTipo = obtenerSugerenciasConTipo(
      busqueda,
      salones,
      limite: limite,
    );
    return sugerenciasConTipo.map((s) => s.texto).toList();
  }

  /// Verifica si una barbería es válida (existe en la lista de salones).
  ///
  /// Útil para validaciones de formulario.
  static bool esValida(String barberia, List<Map<String, String>> salones) {
    return salones.any(
      (salon) => salon['name'] == barberia || salon['address'] == barberia,
    );
  }
}
