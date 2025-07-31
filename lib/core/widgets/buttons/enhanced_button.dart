import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_design_constants.dart';
import '../../theme/app_theme.dart';
import '../../theme/app_theme_extensions.dart';
import '../spacers/app_spacers.dart';

/// Botón mejorado con animaciones y estados visuales
class EnhancedButton extends StatefulWidget {
  /// Texto del botón
  final String text;

  /// Función llamada al presionar
  final VoidCallback? onPressed;

  /// Si el botón está cargando
  final bool isLoading;

  /// Si el botón está habilitado
  final bool isEnabled;

  /// Icono opcional
  final IconData? icon;

  /// Color del botón
  final Color? color;

  /// Color del texto
  final Color? textColor;

  /// Altura del botón
  final double height;

  /// Ancho del botón (opcional)
  final double? width;

  /// Radio de borde
  final double borderRadius;

  /// Duración de las animaciones
  final Duration animationDuration;

  /// Constructor
  const EnhancedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.color,
    this.textColor,
    this.height = 56.0,
    this.width,
    this.borderRadius = AppDesignConstants.borderRadiusMD,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  @override
  State<EnhancedButton> createState() => _EnhancedButtonState();
}

class _EnhancedButtonState extends State<EnhancedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.isEnabled && !widget.isLoading) {
      setState(() {
        _isPressed = true;
      });
      _animationController.forward();
      HapticFeedback.lightImpact();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.isEnabled && !widget.isLoading) {
      setState(() {
        _isPressed = false;
      });
      _animationController.reverse();
    }
  }

  void _onTapCancel() {
    if (widget.isEnabled && !widget.isLoading) {
      setState(() {
        _isPressed = false;
      });
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = !widget.isEnabled || widget.isLoading;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: GestureDetector(
              onTapDown: _onTapDown,
              onTapUp: _onTapUp,
              onTapCancel: _onTapCancel,
              onTap: isDisabled ? null : widget.onPressed,
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: _getGradientColors(),
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  boxShadow: _getBoxShadow(),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    onTap: isDisabled ? null : widget.onPressed,
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
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                widget.textColor ?? AppTheme.kOffWhite,
              ),
            ),
          ),
          AppSpacers.hSm,
          Text(
            'Cargando...',
            style: context.textTheme.labelLarge!.copyWith(
              color: widget.textColor ?? AppTheme.kOffWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.icon != null) ...[
          Icon(
            widget.icon,
            color: widget.textColor ?? AppTheme.kOffWhite,
            size: 20,
          ),
          AppSpacers.hXs,
        ],
        Text(
          widget.text,
          style: context.textTheme.labelLarge!.copyWith(
            color: widget.textColor ?? AppTheme.kOffWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  List<Color> _getGradientColors() {
    if (!widget.isEnabled || widget.isLoading) {
      return [
        AppTheme.kSurfaceColor.withAlpha(102),
        AppTheme.kSurfaceColor.withAlpha(102),
      ];
    }

    if (widget.color != null) {
      return [widget.color!, widget.color!.withAlpha(204)];
    }

    return [AppTheme.kPrimaryColor, AppTheme.kPrimaryDarkColor];
  }

  List<BoxShadow> _getBoxShadow() {
    if (!widget.isEnabled || widget.isLoading) {
      return [];
    }

    return [
      BoxShadow(
        color: (widget.color ?? AppTheme.kPrimaryColor).withAlpha(77),
        blurRadius: _isPressed ? 8 : 16,
        offset: Offset(0, _isPressed ? 2 : 4),
      ),
    ];
  }
}
