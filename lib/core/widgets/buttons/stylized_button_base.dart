import 'package:flutter/material.dart';

import '../../theme/app_theme_extensions.dart';
import 'stylized_button_animations.dart' show StylizedButtonAnimationController, StylizedButtonAnimationControllerState;
import 'stylized_button_style.dart';
import 'stylized_button_types.dart';

/// Componente de botón estilizado con efectos visuales mejorados
///
/// Permite crear botones con diferentes estilos (primario, secundario, terciario)
/// y efectos visuales como sombras, resplandor, animaciones de presión, etc.
class StylizedButton extends StatefulWidget {
  /// El texto a mostrar dentro del botón
  final String text;
  
  /// El tipo de botón que define su apariencia base
  final StylizedButtonType type;
  
  /// El icono opcional para mostrar junto al texto
  final IconData? icon;
  
  /// La posición del icono (izquierda o derecha)
  final bool iconOnRight;
  
  /// La acción a ejecutar cuando se presiona el botón
  final VoidCallback? onPressed;
  
  /// Si se debe mostrar un efecto de presión animado
  final bool showPressEffect;
  
  /// Si se debe mostrar un efecto de brillo al presionar
  final bool showGlowEffect;
  
  /// Si el botón debe expandirse para ocupar el ancho completo
  final bool fullWidth;
  
  /// Tamaño personalizado del botón
  final Size? customSize;
  
  /// Padding personalizado del botón
  final EdgeInsets? customPadding;
  
  /// Constructor principal para el botón estilizado
  const StylizedButton({
    super.key,
    required this.text,
    this.type = StylizedButtonType.primary,
    this.icon,
    this.iconOnRight = false,
    this.onPressed,
    this.showPressEffect = true,
    this.showGlowEffect = false,
    this.fullWidth = false,
    this.customSize,
    this.customPadding,
  });
  
  /// Constructor conveniente para botón primario
  factory StylizedButton.primary({
    required String text,
    IconData? icon,
    bool iconOnRight = false,
    VoidCallback? onPressed,
    bool showPressEffect = true,
    bool showGlowEffect = true,
    bool fullWidth = false,
    Size? customSize,
    EdgeInsets? customPadding,
  }) {
    return StylizedButton(
      text: text,
      type: StylizedButtonType.primary,
      icon: icon,
      iconOnRight: iconOnRight,
      onPressed: onPressed,
      showPressEffect: showPressEffect,
      showGlowEffect: showGlowEffect,
      fullWidth: fullWidth,
      customSize: customSize,
      customPadding: customPadding,
    );
  }
  
  /// Constructor conveniente para botón secundario
  factory StylizedButton.secondary({
    required String text,
    IconData? icon,
    bool iconOnRight = false,
    VoidCallback? onPressed,
    bool showPressEffect = true,
    bool fullWidth = false,
    Size? customSize,
    EdgeInsets? customPadding,
  }) {
    return StylizedButton(
      text: text,
      type: StylizedButtonType.secondary,
      icon: icon,
      iconOnRight: iconOnRight,
      onPressed: onPressed,
      showPressEffect: showPressEffect,
      showGlowEffect: false,
      fullWidth: fullWidth,
      customSize: customSize,
      customPadding: customPadding,
    );
  }
  
  /// Constructor conveniente para botón terciario
  factory StylizedButton.tertiary({
    required String text,
    IconData? icon,
    bool iconOnRight = false,
    VoidCallback? onPressed,
    bool showPressEffect = false,
    bool fullWidth = false,
    EdgeInsets? customPadding,
  }) {
    return StylizedButton(
      text: text,
      type: StylizedButtonType.tertiary,
      icon: icon,
      iconOnRight: iconOnRight,
      onPressed: onPressed,
      showPressEffect: showPressEffect,
      showGlowEffect: false,
      fullWidth: fullWidth,
      customPadding: customPadding,
    );
  }

  @override
  State<StylizedButton> createState() => _StylizedButtonState();
}

class _StylizedButtonState extends State<StylizedButton> {
  // Estado de presión
  bool _isPressed = false;
  
  // Referencia al key del controlador de animación
  final GlobalKey<StylizedButtonAnimationControllerState> _animationKey = GlobalKey();
  
  // Manejar el evento de presionar el botón
  void _handleTapDown() {
    if (!widget.showPressEffect || widget.onPressed == null) return;
    
    setState(() {
      _isPressed = true;
    });
    
    _animationKey.currentState?.forward();
  }
  
  // Manejar el evento de soltar el botón
  void _handleTapUp() {
    if (!widget.showPressEffect || widget.onPressed == null) return;
    
    setState(() {
      _isPressed = false;
    });
    
    _animationKey.currentState?.reverse();
  }
  
  // Manejar el evento de cancelar la presión del botón
  void _handleTapCancel() {
    if (!widget.showPressEffect || widget.onPressed == null) return;
    
    setState(() {
      _isPressed = false;
    });
    
    _animationKey.currentState?.reverse();
  }

  @override
  Widget build(BuildContext context) {
    // Configuración base según el tipo de botón
    final ButtonStyle baseStyle = StylizedButtonStyleHelper.getButtonStyle(
      context, 
      widget.type, 
      _isPressed
    );
    
    // Widget principal
    Widget buttonContent = StylizedButtonAnimationController(
      key: _animationKey,
      showPressEffect: widget.showPressEffect,
      child: _buildButtonContent(context),
    );
    
    // Aplicar efecto de resplandor si está activado
    if (widget.showGlowEffect && widget.type == StylizedButtonType.primary) {
      buttonContent = Stack(
        children: [
          // Efecto de resplandor
          AnimatedOpacity(
            opacity: _isPressed ? _animationKey.currentState?.opacityValue ?? 0.0 * 0.5 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: context.buttonBorderRadius,
                boxShadow: StylizedButtonStyleHelper.getGlowEffect(context),
              ),
            ),
          ),
          
          // Contenido del botón
          buttonContent,
        ],
      );
    }
    
    // Construir el botón completo con GestureDetector para manejar los eventos de presión
    return GestureDetector(
      onTapDown: (_) => _handleTapDown(),
      onTapUp: (_) => _handleTapUp(),
      onTapCancel: () => _handleTapCancel(),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: baseStyle,
        child: buttonContent,
      ),
    );
  }
  
  // Construir el contenido interno del botón (texto e icono)
  Widget _buildButtonContent(BuildContext context) {
    final List<Widget> children = [];
    
    // Crear el texto del botón con estilo apropiado
    final Text textWidget = Text(
      widget.text,
      style: StylizedButtonStyleHelper.getTextStyle(
        context, 
        widget.type, 
        _isPressed,
        widget.showPressEffect,
      ),
      textAlign: TextAlign.center,
    );
    
    // Crear el icono si está definido
    Widget? iconWidget;
    if (widget.icon != null) {
      iconWidget = Icon(
        widget.icon,
        size: 18.0, // Reducido de 20.0 para mantener proporción con el nuevo tamaño
        color: StylizedButtonStyleHelper.getContentColor(context, widget.type),
      );
    }
    
    // Organizar el contenido según la posición del icono
    if (iconWidget != null) {
      if (widget.iconOnRight) {
        children.add(textWidget);
        children.add(context.horizontalSpaceXS);
        children.add(iconWidget);
      } else {
        children.add(iconWidget);
        children.add(context.horizontalSpaceXS);
        children.add(textWidget);
      }
    } else {
      children.add(textWidget);
    }
    
    // Contenedor para el contenido con espaciado y alineación
    return Container(
      width: widget.fullWidth ? double.infinity : null,
      height: widget.customSize?.height,
      padding: widget.customPadding ?? 
              StylizedButtonStyleHelper.getDefaultPadding(widget.type),
      child: Row(
        mainAxisSize: widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
