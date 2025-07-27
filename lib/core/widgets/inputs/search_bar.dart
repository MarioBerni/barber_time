import 'package:flutter/material.dart';
import '../../../core/theme/app_theme_extensions.dart';
import '../../../core/constants/montevideo_barrios.dart';
import '../icons/styled_icon.dart';

/// Componente reutilizable para barra de búsqueda
/// 
/// Permite personalizar el diseño, colores y comportamiento
/// siguiendo el sistema de temas centralizado de la aplicación
class SearchBar extends StatelessWidget {
  /// Controlador para el campo de texto
  final TextEditingController? controller;
  
  /// Función que se ejecuta al enviar la búsqueda
  final Function(String)? onSubmitted;
  
  /// Función que se ejecuta al cambiar el texto
  final Function(String)? onChanged;
  
  /// Texto de placeholder
  final String hintText;
  
  /// Si debe mostrar sugerencias de barrios
  final bool showNeighborhoodSuggestions;
  
  /// Función a ejecutar cuando se selecciona un barrio
  final Function(String)? onNeighborhoodSelected;
  
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
  Widget build(BuildContext context) {
    // Calculamos el radio de borde final
    final effectiveBorderRadius = borderRadius ?? context.textFieldBorderRadius;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          onSubmitted: onSubmitted,
          onChanged: _handleOnChanged,
          onTap: onTap,
          enabled: enabled,
          style: compact ? context.bodySmall : context.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: (compact ? context.bodySmall : context.bodyMedium)
            .copyWith(color: context.secondaryTextColor.withAlpha((0.8 * 255).round())),
        // Eliminar el texto de ayuda debajo del campo de búsqueda
        helperText: null,
        helperStyle: context.caption.copyWith(color: context.secondaryTextColor),
        prefixIcon: showSearchIcon
            ? SizedBox(
                width: compact ? 40 : 48,
                // Usamos Transform para alinear perfectamente el icono verticalmente
                child: Center(
                  child: StyledIcon(
                    icon: Icons.search,
                    iconColor: context.deepBlue,
                    backgroundColor: Colors.white.withAlpha((0.3 * 255).round()), 
                    circleSize: 36,
                    iconSize: 22,
                  ),
                ),
              )
            : null,
        suffixIcon: _buildSuffixIcon(context),
        contentPadding: EdgeInsets.symmetric(
          horizontal: compact ? context.spacingXS : context.spacingSM,
          vertical: compact ? 0 : context.spacingXXS,
        ),
        filled: true,
        fillColor: backgroundColor ?? context.backgroundColor,
        // Usar OutlineInputBorder para todos los estados con el radio efectivo
        border: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: hasBorder
              ? BorderSide(color: context.dividerColor, width: 1.0)
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: hasBorder
              ? BorderSide(color: context.primaryColor, width: 1.0)
              : BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: hasBorder
              ? BorderSide(color: context.dividerColor, width: 1.0)
              : BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide(color: context.errorColor, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: hasBorder
              ? BorderSide(color: context.dividerColor.withAlpha((0.5 * 255).round()), width: 1.0)
              : BorderSide.none,
        ),
      ),
    ),
    
    // Muestra sugerencias de barrios si está habilitado
    if (showNeighborhoodSuggestions && enabled && controller != null)
      _buildNeighborhoodSuggestions(context),
    ],
    );
  }

  /// Maneja los cambios de texto en el campo de búsqueda
  void _handleOnChanged(String value) {
    if (onChanged != null) {
      onChanged!(value);
    }
  }
  
  /// Construye las sugerencias de barrios basadas en el texto actual
  Widget _buildNeighborhoodSuggestions(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller!,
      builder: (context, textValue, child) {
        final text = textValue.text.trim();
        
        // Solo mostrar sugerencias si hay texto
        if (text.isEmpty) {
          return const SizedBox.shrink();
        }
        
        // Obtener sugerencias de barrios
        final suggestions = MontevideoBarrios.obtenerSugerencias(text);
        
        if (suggestions.isEmpty) {
          return const SizedBox.shrink();
        }
        
        // Mostrar chips de barrios como sugerencias
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: suggestions.map((barrio) => _buildSuggestionChip(context, barrio)).toList(),
          ),
        );
      },
    );
  }
  
  /// Construye un chip para una sugerencia de barrio
  Widget _buildSuggestionChip(BuildContext context, String barrio) {
    return ActionChip(
      backgroundColor: context.surfaceColor,
      side: BorderSide(color: context.dividerColor),
      label: Text(barrio, style: context.bodySmall),
      avatar: const Icon(Icons.location_on, size: 16),
      onPressed: () {
        if (onNeighborhoodSelected != null) {
          onNeighborhoodSelected!(barrio);
          controller?.text = barrio;
        } else {
          // Si no hay handler específico, usamos el normal
          controller?.text = barrio;
          if (onSubmitted != null) {
            onSubmitted!(barrio);
          }
        }
      },
    );
  }
  
  /// Construye el icono de sufijo (limpiar texto)
  Widget? _buildSuffixIcon(BuildContext context) {
    if (!showClearButton || controller == null || !enabled) {
      return null;
    }

    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller!,
      builder: (context, value, child) {
        if (value.text.isEmpty) {
          return const SizedBox.shrink();
        }
        
        return IconButton(
          icon: Icon(
            Icons.close,
            color: context.secondaryTextColor,
            size: compact ? 16 : 20,
          ),
          onPressed: () {
            controller!.clear();
            if (onChanged != null) {
              onChanged!('');
            }
          },
          splashRadius: compact ? 16 : 20,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        );
      },
    );
  }
}
