import 'package:flutter/material.dart';
import '../../../core/theme/app_theme_extensions.dart';
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
    this.hintText = 'Buscar',
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
    
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      onTap: onTap,
      enabled: enabled,
      style: compact ? context.bodySmall : context.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: (compact ? context.bodySmall : context.bodyMedium)
            .copyWith(color: context.secondaryTextColor),
        prefixIcon: showSearchIcon
            ? Container(
                width: compact ? 40 : 48,
                // Usamos Transform para alinear perfectamente el icono verticalmente
                child: Center(
                  child: StyledIcon(
                    icon: Icons.search,
                    iconColor: context.deepBlue,
                    backgroundColor: Colors.white.withOpacity(0.3), 
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
              ? BorderSide(color: context.dividerColor.withOpacity(0.5), width: 1.0)
              : BorderSide.none,
        ),
      ),
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
