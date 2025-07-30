/// Provee una lista centralizada y métodos de utilidad para los barrios de
/// Montevideo.
class MontevideoBarrios {
  // Constructor privado para evitar instanciación.
  MontevideoBarrios._();

  /// Lista completa de barrios de Montevideo en orden alfabético.
  ///
  /// Esta lista centralizada permite mantener consistencia en las búsquedas
  /// por ubicación y facilitar la implementación de filtros, autocompletado y
  /// sugerencias.
  ///
  /// Nota: Los barrios están ordenados alfabéticamente para facilitar la
  /// búsqueda.
  static const List<String> lista = [
    'Aguada',
    'Aires Puros',
    'Atahualpa',
    'Bañados de Carrasco',
    'Barrio Sur',
    'Belvedere',
    'Brazo Oriental',
    'Buceo',
    'Capurro–Bella Vista',
    'Carrasco',
    'Carrasco Norte',
    'Casabó–Pajas Blancas',
    'Casavalle',
    'Castro–Pérez Castellanos',
    'Centro',
    'Cerrito de la Victoria',
    'Ciudad Vieja',
    'Colón Centro y Noroeste',
    'Colón Sudeste–Abayubá',
    'Conciliación–Sayago Norte',
    'Cordón',
    'Flor de Maroñas',
    'Ituzaingó',
    'Jacinto Vera',
    'Jardines del Hipódromo',
    'La Blanqueada',
    'La Comercial',
    'La Figurita',
    'La Paloma–Tomkinson',
    'La Teja',
    'Larrañaga',
    'Las Acacias',
    'Las Canteras',
    'Lezica–Melilla',
    'Malvín',
    'Malvín Norte',
    'Manga',
    'Manga Rural',
    'Manga–Toledo Chico',
    'Maroñas–Parque Guaraní',
    'Mercado Modelo–Bolívar',
    'Nuevo París',
    'Palermo',
    'Parque Batlle–Villa Dolores',
    'Parque Rodó',
    'Paso de la Arena–Santiago Vázquez',
    'Paso de las Duranas',
    'Peñarol–Lavalleja',
    'Piedras Blancas',
    'Pocitos',
    'Prado–Nueva Savona',
    'Punta Carretas',
    'Punta de Rieles–Bella Italia',
    'Punta Gorda',
    'Reducto',
    'Sayago',
    'Tres Cruces',
    'Tres Ombúes–Pueblo Victoria',
    'Unión',
    'Verdisol',
    'Villa del Cerro',
    'Villa Española',
    'Villa García',
    'Villa Muñoz–Retiro',
  ];

  /// Método para obtener barrios que coinciden con un texto de búsqueda.
  ///
  /// Útil para implementar autocompletado o filtros.
  /// El parámetro [busqueda] debe ser un string con el texto a buscar.
  static List<String> filtrar(String busqueda) {
    if (busqueda.isEmpty) {
      return [];
    }

    final terminoBusqueda = busqueda.toLowerCase().trim();

    return lista
        .where((barrio) => barrio.toLowerCase().contains(terminoBusqueda))
        .toList();
  }

  /// Verifica si un barrio es válido (está en la lista).
  ///
  /// Útil para validaciones de formulario.
  static bool esValido(String barrio) {
    return lista.contains(barrio);
  }

  /// Obtiene sugerencias de barrios basadas en texto de búsqueda.
  ///
  /// Similar a filtrar() pero limita la cantidad de resultados para mostrar en
  /// interfaces de autocompletado.
  static List<String> obtenerSugerencias(String busqueda, {int limite = 5}) {
    final resultados = filtrar(busqueda);

    if (resultados.length <= limite) {
      return resultados;
    }

    return resultados.sublist(0, limite);
  }
}
