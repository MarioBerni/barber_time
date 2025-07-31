import 'package:flutter/material.dart';

import '../../../../../core/widgets/buttons/enhanced_button.dart';

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
    return EnhancedButton(
      text: isEnabled ? enabledText : disabledText,
      onPressed: (isEnabled && !isLoading) ? onPressed : null,
      isLoading: isLoading,
      isEnabled: isEnabled,
      icon: isEnabled ? Icons.person_add_rounded : Icons.edit_rounded,
      width: double.infinity,
      height: 62,
      borderRadius: 20,
    );
  }
}
