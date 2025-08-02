import 'package:flutter/material.dart';

import '../../../core/constants/barberia_sugerencias.dart';
import '../../../core/theme/app_theme_extensions.dart';
import '../../../features/home/domain/entities/salon.dart';

/// Widget para mostrar chips de sugerencias de barberías
class BarberiaSuggestionChips extends StatelessWidget {
  /// Lista de salones disponibles
  final List<Salon> salones;

  /// Texto de búsqueda actual
  final String searchText;

  /// Callback cuando se selecciona una barbería
  final ValueChanged<String>? onBarberiaSelected;

  /// Constructor del widget
  const BarberiaSuggestionChips({
    super.key,
    required this.salones,
    required this.searchText,
    this.onBarberiaSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Solo mostrar si hay texto de búsqueda
    if (searchText.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    // Convertir salones a formato Map para BarberiaSugerencias
    final salonesMap = salones
        .map((salon) => {'name': salon.name, 'address': salon.address})
        .toList();

    // Obtener sugerencias de barberías con tipo
    final sugerencias = BarberiaSugerencias.obtenerSugerenciasConTipo(
      searchText,
      salonesMap,
    );

    if (sugerencias.isEmpty) {
      return const SizedBox.shrink();
    }

    // Mostrar chips de barberías como sugerencias
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: sugerencias
            .map((sugerencia) => _buildSuggestionChip(context, sugerencia))
            .toList(),
      ),
    );
  }

  /// Construye un chip para una sugerencia de barbería
  Widget _buildSuggestionChip(BuildContext context, Sugerencia sugerencia) {
    // Determinar icono según el tipo de coincidencia
    IconData icon;
    switch (sugerencia.tipo) {
      case TipoCoincidencia.nombre:
        icon = Icons.content_cut; // Tijera para nombres de barberías
        break;
      case TipoCoincidencia.direccion:
        icon = Icons.store; // Local para direcciones
        break;
    }

    return ActionChip(
      backgroundColor: context.surfaceColor,
      side: BorderSide(color: context.dividerColor),
      label: Text(sugerencia.texto, style: context.bodySmall),
      avatar: Icon(icon, size: 16),
      onPressed: () {
        if (onBarberiaSelected != null) {
          onBarberiaSelected!(sugerencia.texto);
        }
      },
    );
  }
}
