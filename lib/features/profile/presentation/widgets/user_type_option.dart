import 'package:flutter/material.dart';

import '../../../../core/theme/app_design_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/spacers/app_spacers.dart';

/// Widget para mostrar una opción de tipo de usuario
/// en la pantalla de selección
class UserTypeOption extends StatefulWidget {
  /// Título de la opción
  final String title;

  /// Descripción de la opción
  final String description;

  /// Icono para la opción
  final IconData icon;

  /// Callback cuando se selecciona esta opción
  final VoidCallback onTap;

  /// Constructor
  const UserTypeOption({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  State<UserTypeOption> createState() => _UserTypeOptionState();
}

class _UserTypeOptionState extends State<UserTypeOption>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
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

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    _animationController.forward().then((_) {
                      _animationController.reverse();
                      widget.onTap();
                    });
                  },
                  borderRadius: AppDesignConstants.premiumBorderRadius,
                  splashColor: AppTheme.kPrimaryColor.withAlpha(77),
                  highlightColor: AppTheme.kPrimaryColor.withAlpha(26),
                  child: Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: context.charcoalMedium,
                      borderRadius: AppDesignConstants.premiumBorderRadius,
                      border: Border.all(
                        color: AppTheme.kPrimaryColor.withAlpha(51),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.kBlackPure.withAlpha(102),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                          spreadRadius: 2,
                        ),
                        BoxShadow(
                          color: AppTheme.kPrimaryColor.withAlpha(26),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Icono con contenedor de superficie
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: context.charcoalLight,
                            borderRadius: BorderRadius.circular(
                              AppDesignConstants.borderRadiusMD,
                            ),
                            border: Border.all(
                              color: AppTheme.kPrimaryColor.withAlpha(77),
                            ),
                          ),
                          child: Icon(
                            widget.icon,
                            color: AppTheme.kPrimaryColor,
                            size: 32,
                          ),
                        ),

                        AppSpacers.hLg,

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Título con color blanco para máximo contraste
                              Text(
                                widget.title,
                                style: context.titleLarge.copyWith(
                                  color: AppTheme.kTextColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22,
                                  letterSpacing: 0.5,
                                  height: 1.2,
                                ),
                              ),
                              AppSpacers.sm,
                              // Descripción con color gris claro
                              Text(
                                widget.description,
                                style: context.bodyLarge.copyWith(
                                  color: context.grayLight,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 1.4,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Flecha con contenedor de superficie
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: context.charcoalLight,
                            borderRadius: BorderRadius.circular(
                              AppDesignConstants.borderRadiusMD,
                            ),
                            border: Border.all(
                              color: AppTheme.kPrimaryColor.withAlpha(77),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: AppTheme.kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
