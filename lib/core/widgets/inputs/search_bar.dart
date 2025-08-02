import 'package:flutter/material.dart';

import '../../../core/constants/barberia_sugerencias.dart';
import '../../../core/constants/montevideo_barrios.dart';
import '../../../core/theme/app_theme_extensions.dart';
import '../../../features/home/domain/entities/salon.dart';

/// Componente reutilizable para barra de búsqueda
///
/// Permite personalizar el diseño, colores y comportamiento
/// siguiendo el sistema de temas centralizado de la aplicación
class SearchBar extends StatefulWidget {
  /// Controlador para el campo de texto
  final TextEditingController? controller;

  /// Función que se ejecuta al enviar la búsqueda
  final ValueChanged<String>? onSubmitted;

  /// Función que se ejecuta al cambiar el texto
  final ValueChanged<String>? onChanged;

  /// Texto de placeholder
  final String hintText;

  /// Si debe mostrar sugerencias de barrios
  final bool showNeighborhoodSuggestions;

  /// Función a ejecutar cuando se selecciona un barrio
  final ValueChanged<String>? onNeighborhoodSelected;

  /// Lista de salones para generar chips de barberías
  final List<Salon> salones;

  /// Función a ejecutar cuando se selecciona una barbería
  final ValueChanged<String>? onBarberiaSelected;

  /// Si debe mostrar el botón de limpiar
  final bool showClearButton;

  /// Si la barra de búsqueda debe estar habilitada
  final bool enabled;

  /// Color de fondo (opcional, usa surfaceColor por defecto)
  final Color? backgroundColor;

  /// Si debe tener borde
  final bool hasBorder;

  /// Si debe mostrar el icono de búsqueda
  final bool showSearchIcon;

  /// Si debe mostrarse una versión compacta
  final bool compact;

  /// Radio de borde personalizado (opcional)
  final BorderRadius? borderRadius;

  /// Callback cuando se presiona el campo (útil para abrir modal)
  final VoidCallback? onTap;

  /// Constructor para la barra de búsqueda
  const SearchBar({
    super.key,
    this.controller,
    this.onSubmitted,
    this.onChanged,
    this.hintText = 'Buscar...',
    this.showNeighborhoodSuggestions = false,
    this.onNeighborhoodSelected,
    this.salones = const [],
    this.onBarberiaSelected,
    this.showClearButton = true,
    this.enabled = true,
    this.backgroundColor,
    this.hasBorder = true,
    this.showSearchIcon = true,
    this.compact = false,
    this.borderRadius,
    this.onTap,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Campo de texto principal
        TextField(
          controller: widget.controller,
          onSubmitted: widget.onSubmitted,
          onChanged: _handleOnChanged,
          onTap: widget.onTap,
          enabled: widget.enabled,
          style: widget.compact ? context.bodySmall : context.bodyMedium,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: context.bodySmall.copyWith(
              color: context.tertiaryTextColor,
            ),
            prefixIcon: widget.showSearchIcon
                ? Icon(
                    Icons.search,
                    color: context.secondaryTextColor,
                    size: widget.compact ? 18 : 20,
                  )
                : null,
            suffixIcon: _buildSuffixIcon(context),
            filled: true,
            fillColor: widget.backgroundColor ?? context.surfaceColor,
            border: widget.hasBorder
                ? OutlineInputBorder(
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(12),
                    borderSide: BorderSide(color: context.dividerColor),
                  )
                : null,
            enabledBorder: widget.hasBorder
                ? OutlineInputBorder(
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(12),
                    borderSide: BorderSide(color: context.dividerColor),
                  )
                : null,
            focusedBorder: widget.hasBorder
                ? OutlineInputBorder(
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: context.primaryColor,
                      width: 2,
                    ),
                  )
                : null,
            contentPadding: widget.compact
                ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
                : const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),

        // Sugerencias de barrios y barberías
        if (widget.showNeighborhoodSuggestions)
          _buildNeighborhoodSuggestions(context),
      ],
    );
  }

  /// Maneja los cambios de texto en el campo de búsqueda
  void _handleOnChanged(String value) {
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  /// Construye las sugerencias de barrios y barberías basadas en el texto
  Widget _buildNeighborhoodSuggestions(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: widget.controller!,
      builder: (context, textValue, child) {
        final text = textValue.text.trim();

        // Solo mostrar sugerencias si hay texto
        if (text.isEmpty) {
          return const SizedBox.shrink();
        }

        // Obtener sugerencias de barrios
        final barriosSuggestions = MontevideoBarrios.obtenerSugerencias(text);

        // Obtener sugerencias de barberías con tipo
        final salonesMap = widget.salones
            .map((salon) => {'name': salon.name, 'address': salon.address})
            .toList();
        final barberiasSuggestions =
            BarberiaSugerencias.obtenerSugerenciasConTipo(text, salonesMap);

        // Combinar todas las sugerencias
        final allSuggestions = <MapEntry<String, String>>[];

        // Agregar barrios con tipo
        for (final barrio in barriosSuggestions) {
          allSuggestions.add(MapEntry(barrio, 'barrio'));
        }

        // Agregar barberías con tipo
        for (final sugerencia in barberiasSuggestions) {
          final tipo = sugerencia.tipo == TipoCoincidencia.nombre
              ? 'barberia'
              : 'direccion';
          allSuggestions.add(MapEntry(sugerencia.texto, tipo));
        }

        if (allSuggestions.isEmpty) {
          return const SizedBox.shrink();
        }

        // Mostrar chips unificados
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: allSuggestions
                .map(
                  (suggestion) => _buildUnifiedSuggestionChip(
                    context,
                    suggestion.key,
                    suggestion.value,
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  /// Construye un chip unificado para sugerencias de barrios y barberías
  Widget _buildUnifiedSuggestionChip(
    BuildContext context,
    String suggestion,
    String type,
  ) {
    IconData icon;
    VoidCallback? onPressed;

    switch (type) {
      case 'barrio':
        icon = Icons.location_on;
        onPressed = () {
          if (widget.onNeighborhoodSelected != null) {
            widget.onNeighborhoodSelected!(suggestion);
            widget.controller!.text = suggestion;
          } else {
            widget.controller!.text = suggestion;
            if (widget.onSubmitted != null) {
              widget.onSubmitted!(suggestion);
            }
          }
        };
        break;
      case 'barberia':
        icon = Icons.content_cut;
        onPressed = () {
          if (widget.onBarberiaSelected != null) {
            widget.onBarberiaSelected!(suggestion);
            widget.controller!.text = suggestion;
          } else {
            widget.controller!.text = suggestion;
            if (widget.onSubmitted != null) {
              widget.onSubmitted!(suggestion);
            }
          }
        };
        break;
      case 'direccion':
        icon = Icons.store;
        onPressed = () {
          if (widget.onBarberiaSelected != null) {
            widget.onBarberiaSelected!(suggestion);
            widget.controller!.text = suggestion;
          } else {
            widget.controller!.text = suggestion;
            if (widget.onSubmitted != null) {
              widget.onSubmitted!(suggestion);
            }
          }
        };
        break;
      default:
        icon = Icons.search;
        onPressed = () {
          widget.controller!.text = suggestion;
          if (widget.onSubmitted != null) {
            widget.onSubmitted!(suggestion);
          }
        };
    }

    return ActionChip(
      backgroundColor: context.surfaceColor,
      side: BorderSide(color: context.dividerColor),
      label: Text(suggestion, style: context.bodySmall),
      avatar: Icon(icon, size: 16),
      onPressed: onPressed,
    );
  }

  /// Construye el icono de sufijo (limpiar texto)
  Widget? _buildSuffixIcon(BuildContext context) {
    if (!widget.showClearButton || widget.controller == null) {
      return null;
    }

    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: widget.controller!,
      builder: (context, value, child) {
        if (value.text.isEmpty) {
          return const SizedBox.shrink();
        }

        return IconButton(
          icon: Icon(
            Icons.clear,
            color: context.secondaryTextColor,
            size: widget.compact ? 18 : 20,
          ),
          onPressed: () {
            widget.controller!.clear();
            if (widget.onChanged != null) {
              widget.onChanged!('');
            }
          },
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
        );
      },
    );
  }
}
