import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/app_theme_extensions.dart';

/// Botón de envío premium con estados dinámicos
class SubmitButton extends StatelessWidget {
  /// Si el botón está habilitado
  final bool isEnabled;

  /// Si está en estado de carga
  final bool isLoading;

  /// Callback cuando se presiona
  final VoidCallback? onPressed;

  /// Texto cuando está habilitado
  final String enabledText;

  /// Texto cuando está deshabilitado
  final String disabledText;

  /// Texto durante la carga
  final String loadingText;

  /// Constructor
  const SubmitButton({
    super.key,
    required this.isEnabled,
    this.isLoading = false,
    this.onPressed,
    this.enabledText = 'Crear Cuenta',
    this.disabledText = 'Completa los campos',
    this.loadingText = 'Creando cuenta...',
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      height: 62,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: isEnabled
            ? LinearGradient(
                colors: [AppTheme.kPrimaryColor, AppTheme.kPrimaryDarkColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isEnabled ? null : AppTheme.kCharcoalLight,
        border: Border.all(
          color: isEnabled
              ? AppTheme.kPrimaryLightColor.withAlpha((0.4 * 255).round())
              : AppTheme.kPrimaryColor.withAlpha((0.3 * 255).round()),
          width: 1.5,
        ),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: AppTheme.kPrimaryColor.withAlpha((0.4 * 255).round()),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withAlpha((0.1 * 255).round()),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: (isEnabled && !isLoading) ? onPressed : null,
          child: DecoratedBox(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: isLoading
                  ? _buildLoadingState(context)
                  : _buildNormalState(context),
            ),
          ),
        ),
      ),
    );
  }

  /// Construye el estado de carga
  Widget _buildLoadingState(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.kOffWhite),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          loadingText,
          style: context.button.copyWith(
            color: AppTheme.kOffWhite,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  /// Construye el estado normal
  Widget _buildNormalState(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Icon(
            isEnabled ? Icons.person_add_rounded : Icons.edit_rounded,
            size: 22,
            color: isEnabled
                ? Colors.white
                : AppTheme.kOffWhite.withAlpha((0.8 * 255).round()),
            key: ValueKey(isEnabled),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          isEnabled ? enabledText : disabledText,
          style: context.button.copyWith(
            color: isEnabled
                ? Colors.white
                : AppTheme.kOffWhite.withAlpha((0.8 * 255).round()),
            fontWeight: FontWeight.w700,
            fontSize: 16,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
