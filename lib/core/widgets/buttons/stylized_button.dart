import 'package:flutter/material.dart';
import '../../theme/app_theme_extensions.dart';

/// Tipo de botón estilizado
enum StylizedButtonType {
  /// Botón principal con color de fondo, sombras y elevación
  primary,
  
  /// Botón secundario con borde y sin fondo
  secondary,
  
  /// Botón terciario sólo con texto y subrayado opcional
  tertiary,
}

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

class _StylizedButtonState extends State<StylizedButton> with SingleTickerProviderStateMixin {
  // Controlador para la animación de presión
  late AnimationController _pressController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  
  // Estado de presión
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    
    // Inicializar animaciones
    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.96,
    ).animate(CurvedAnimation(
      parent: _pressController,
      curve: Curves.easeInOut,
    ));
    
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _pressController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }
  
  // Manejar el evento de presionar el botón
  void _handleTapDown() {
    if (!widget.showPressEffect || widget.onPressed == null) return;
    
    setState(() {
      _isPressed = true;
    });
    
    _pressController.forward();
  }
  
  // Manejar el evento de soltar el botón
  void _handleTapUp() {
    if (!widget.showPressEffect || widget.onPressed == null) return;
    
    setState(() {
      _isPressed = false;
    });
    
    _pressController.reverse();
  }
  
  // Manejar el evento de cancelar la presión del botón
  void _handleTapCancel() {
    if (!widget.showPressEffect || widget.onPressed == null) return;
    
    setState(() {
      _isPressed = false;
    });
    
    _pressController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    // Configuración base según el tipo de botón
    final ButtonStyle baseStyle = _getButtonStyle(context);
    
    // Widget principal
    Widget buttonContent = AnimatedBuilder(
      animation: _pressController,
      builder: (context, child) {
        final scale = widget.showPressEffect ? _scaleAnimation.value : 1.0;
        
        return Transform.scale(
          scale: scale,
          child: _buildButtonContent(context),
        );
      }
    );
    
    // Aplicar efecto de resplandor si está activado
    if (widget.showGlowEffect && widget.type == StylizedButtonType.primary) {
      buttonContent = Stack(
        children: [
          // Efecto de resplandor
          AnimatedBuilder(
            animation: _pressController,
            builder: (context, child) {
              return AnimatedOpacity(
                opacity: _isPressed ? _opacityAnimation.value * 0.5 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: context.buttonBorderRadius,
                    boxShadow: [
                      BoxShadow(
                        color: context.accentColor.withOpacity(0.6),
                        blurRadius: 20.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                ),
              );
            }
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
      style: _getTextStyle(context),
      textAlign: TextAlign.center,
    );
    
    // Crear el icono si está definido
    Widget? iconWidget;
    if (widget.icon != null) {
      iconWidget = Icon(
        widget.icon,
        size: 20.0,
        color: _getContentColor(context),
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
      padding: widget.customPadding ?? _getDefaultPadding(),
      child: Row(
        mainAxisSize: widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
  
  // Obtener el estilo del botón según su tipo
  ButtonStyle _getButtonStyle(BuildContext context) {
    switch (widget.type) {
      case StylizedButtonType.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: context.primaryColor,
          foregroundColor: Colors.white,
          elevation: _isPressed ? 1 : 3,
          shadowColor: context.shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: context.buttonBorderRadius,
          ),
          padding: EdgeInsets.zero,
        );
        
      case StylizedButtonType.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: context.primaryColor,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: context.buttonBorderRadius,
            side: BorderSide(
              color: context.primaryColor,
              width: 1.5,
            ),
          ),
          padding: EdgeInsets.zero,
        );
        
      case StylizedButtonType.tertiary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: context.primaryColor,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          padding: EdgeInsets.zero,
        );
    }
  }
  
  // Obtener el color del contenido según el tipo de botón
  Color _getContentColor(BuildContext context) {
    switch (widget.type) {
      case StylizedButtonType.primary:
        return Colors.white;
        
      case StylizedButtonType.secondary:
      case StylizedButtonType.tertiary:
        return context.primaryColor;
    }
  }
  
  // Obtener el estilo de texto según el tipo de botón
  TextStyle _getTextStyle(BuildContext context) {
    final baseStyle = context.button;
    
    switch (widget.type) {
      case StylizedButtonType.primary:
        return baseStyle.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        );
        
      case StylizedButtonType.secondary:
        return baseStyle.copyWith(
          color: context.primaryColor,
          fontWeight: FontWeight.w600,
        );
        
      case StylizedButtonType.tertiary:
        return baseStyle.copyWith(
          color: context.primaryColor,
          fontWeight: FontWeight.w500,
          decoration: widget.showPressEffect && _isPressed 
              ? TextDecoration.underline 
              : TextDecoration.none,
        );
    }
  }
  
  // Obtener el padding por defecto según el tipo de botón
  EdgeInsets _getDefaultPadding() {
    switch (widget.type) {
      case StylizedButtonType.primary:
      case StylizedButtonType.secondary:
        return const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        );
        
      case StylizedButtonType.tertiary:
        return const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        );
    }
  }
}
