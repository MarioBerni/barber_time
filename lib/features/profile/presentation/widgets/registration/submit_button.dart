import 'package:flutter/material.dart';

import '../../../../../core/theme/app_design_constants.dart';
import '../../../../../core/theme/app_theme_extensions.dart';
import '../../../../../core/widgets/states/states.dart';

/// Botón de envío personalizado para formularios
class SubmitButton extends StatelessWidget {
  /// Texto del botón
  final String text;

  /// Si está cargando
  final bool isLoading;

  /// Si está habilitado
  final bool isEnabled;

  /// Callback cuando se presiona
  final VoidCallback? onPressed;

  /// Constructor
  const SubmitButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.isEnabled = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: (isEnabled && !isLoading) ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.primaryColor,
          foregroundColor: Colors.white,
          disabledBackgroundColor: context.grayDark,
          disabledForegroundColor: context.grayPale,
          shape: RoundedRectangleBorder(
            borderRadius: AppDesignConstants.standardBorderRadius,
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const LoadingIndicatorWidget(
                size: LoadingIndicatorSize.small,
                color: Colors.white,
              )
            : Text(
                text,
                style: context.textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
