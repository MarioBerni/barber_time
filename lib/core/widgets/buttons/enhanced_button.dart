import 'package:flutter/material.dart';

import '../spacers/app_spacers.dart';
import '../states/states.dart';

/// Botón mejorado con animaciones y efectos visuales
class EnhancedButton extends StatefulWidget {
  /// Constructor
  const EnhancedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.color,
    this.textColor,
    this.width,
    this.height = 56,
    this.borderRadius = 12,
  });

  /// Texto del botón
  final String text;

  /// Callback cuando se presiona
  final VoidCallback onPressed;

  /// Si está cargando
  final bool isLoading;

  /// Si está habilitado
  final bool isEnabled;

  /// Icono opcional
  final IconData? icon;

  /// Color del botón
  final Color? color;

  /// Color del texto
  final Color? textColor;

  /// Ancho del botón
  final double? width;

  /// Alto del botón
  final double height;

  /// Radio del borde
  final double borderRadius;

  @override
  State<EnhancedButton> createState() => _EnhancedButtonState();
}

class _EnhancedButtonState extends State<EnhancedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = !widget.isEnabled || widget.isLoading;

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: _getGradientColors(),
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
              boxShadow: _getBoxShadow(),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: isDisabled ? null : widget.onPressed,
                  splashColor: Colors.white.withAlpha(26),
                  highlightColor: Colors.white.withAlpha(13),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(child: _buildContent()),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent() {
    if (widget.isLoading) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoadingIndicatorWidget(
            size: LoadingIndicatorSize.small,
            color: widget.textColor ?? Colors.white,
          ),
          AppSpacers.hSm,
          Text(
            'Cargando...',
            style: TextStyle(
              color: widget.textColor ?? Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.icon != null) ...[
          Icon(widget.icon, color: widget.textColor ?? Colors.white, size: 20),
          AppSpacers.hXs,
        ],
        Text(
          widget.text,
          style: TextStyle(
            color: widget.textColor ?? Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  List<Color> _getGradientColors() {
    if (!widget.isEnabled || widget.isLoading) {
      return [Colors.grey.withAlpha(102), Colors.grey.withAlpha(102)];
    }

    if (widget.color != null) {
      return [widget.color!, widget.color!.withAlpha(204)];
    }

    // Gradiente simple y visible - Colores hardcodeados para diagnóstico
    return [
      const Color(0xFF3BBFAD), // Turquesa principal
      const Color(0xFF2A8F83), // Turquesa oscuro
    ];
  }

  List<BoxShadow> _getBoxShadow() {
    if (!widget.isEnabled || widget.isLoading) {
      return [];
    }

    return [
      BoxShadow(
        color: const Color(0xFF3BBFAD).withAlpha(150), // Sombra más visible
        blurRadius: 12, // Removed _isPressed as it's not used
        offset: Offset(0, 6), // Removed _isPressed as it's not used
      ),
    ];
  }
}
