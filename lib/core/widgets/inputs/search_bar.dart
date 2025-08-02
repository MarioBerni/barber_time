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
    this.hintText = 'Buscar barberías por nombre o ubicación',
    this.showNeighborhoodSuggestions = true,
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
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculamos el radio de borde final
    final effectiveBorderRadius =
        widget.borderRadius ?? context.textFieldBorderRadius;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          onSubmitted: widget.onSubmitted,
          onChanged: _handleOnChanged,
          onTap: widget.onTap,
          enabled: widget.enabled,
          style: (widget.compact ? context.bodySmall : context.bodyMedium)
              .copyWith(color: context.textColor),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: (widget.compact ? context.bodySmall : context.bodyMedium)
                .copyWith(
                  color: context.secondaryTextColor.withAlpha(
                    (0.8 * 255).round(),
                  ),
                ),
            helperStyle: context.caption.copyWith(
              color: context.secondaryTextColor,
            ),
            prefixIcon: widget.showSearchIcon
                ? Padding(
                    padding: EdgeInsets.only(
                      left: widget.compact
                          ? context.spacingXS
                          : context.spacingSM,
                      right: context.spacingXXS,
                    ),
                    child: Icon(
                      Icons.search_rounded,
                      color: _isFocused
                          ? context.primaryColor
                          : context.grayMedium,
                      size: widget.compact ? 20 : 24,
                    ),
                  )
                : null,
            suffixIcon: _buildSuffixIcon(context),
            contentPadding: EdgeInsets.symmetric(
              horizontal: widget.compact
                  ? context.spacingXS
                  : context.spacingSM,
              vertical: widget.compact ? 0 : context.spacingXXS,
            ),
            filled: true,
            fillColor: widget.backgroundColor ?? context.charcoalMedium,
            // Usar OutlineInputBorder para todos los estados
            // con el radio efectivo
            border: OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: widget.hasBorder
                  ? BorderSide(color: context.grayDark)
                  : BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: widget.hasBorder
                  ? BorderSide(color: context.primaryColor, width: 1.5)
                  : BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: widget.hasBorder
                  ? BorderSide(color: context.grayDark)
                  : BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: BorderSide(color: context.errorColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: widget.hasBorder
                  ? BorderSide(
                      color: context.grayMedium.withAlpha((0.5 * 255).round()),
                    )
                  : BorderSide.none,
            ),
          ),
        ),

        // Muestra sugerencias de barrios si está habilitado
        if (widget.showNeighborhoodSuggestions &&
            widget.enabled &&
            widget.controller != null)
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

  /// Construye las sugerencias de barrios y barberías basadas en el texto actual
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

        // Obtener sugerencias de barberías
        final salonesMap = widget.salones
            .map((salon) => {'name': salon.name, 'address': salon.address})
            .toList();
        final barberiasSuggestions = BarberiaSugerencias.obtenerSugerencias(
          text,
          salonesMap,
        );

        // Combinar todas las sugerencias
        final allSuggestions = <MapEntry<String, String>>[];

        // Agregar barrios con tipo
        for (final barrio in barriosSuggestions) {
          allSuggestions.add(MapEntry(barrio, 'barrio'));
        }

        // Agregar barberías con tipo
        for (final barberia in barberiasSuggestions) {
          allSuggestions.add(MapEntry(barberia, 'barberia'));
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

    if (type == 'barrio') {
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
    } else {
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
    if (!widget.showClearButton ||
        widget.controller == null ||
        !widget.enabled) {
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
            Icons.close,
            color: context.secondaryTextColor,
            size: widget.compact ? 16 : 20,
          ),
          onPressed: () {
            widget.controller!.clear();
            if (widget.onChanged != null) {
              widget.onChanged!('');
            }
          },
          splashRadius: widget.compact ? 16 : 20,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        );
      },
    );
  }
}
