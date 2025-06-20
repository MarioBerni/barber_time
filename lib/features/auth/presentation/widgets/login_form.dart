import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/buttons/stylized_button.dart';
import '../../../../core/widgets/containers/glam_container.dart';
import '../bloc/auth_cubit.dart';
import 'auth_text_field.dart';

/// Componente que muestra el formulario de inicio de sesión
/// 
/// Incluye campos de email, contraseña y botón de inicio de sesión
class LoginForm extends StatefulWidget {
  /// Función a ejecutar al intentar iniciar sesión
  final Function(BuildContext) onLoginPressed;
  
  /// Si el formulario está en estado de carga
  final bool isLoading;

  const LoginForm({
    super.key,
    required this.onLoginPressed,
    this.isLoading = false,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _processLogin(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      context.read<AuthCubit>().login(
        _emailController.text.trim(),
        _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Usamos GlamContainer directamente para poder personalizar el borderRadius
    return GlamContainer(
      padding: const EdgeInsets.all(28),
      baseColor: Colors.white,
      borderStyle: GlamBorderStyle.solid,
      borderColor: Colors.white.withAlpha((0.8 * 255).round()),
      showInnerGlow: false,
      elevation: GlamElevation.medium,
      opacity: 0.95,
      borderRadius: BorderRadius.circular(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo de email
            AuthTextField(
              controller: _emailController,
              labelText: 'Correo electrónico',
              hintText: 'ejemplo@correo.com',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              customBorderRadius: 10,
              accentColor: context.accentColor,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa tu correo';
                }
                if (!value.contains('@') || !value.contains('.')) {
                  return 'Ingresa un correo válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Campo de contraseña
            AuthTextField(
              controller: _passwordController,
              labelText: 'Contraseña',
              hintText: '••••••••',
              prefixIcon: Icons.lock_outline,
              obscureText: _obscurePassword,
              customBorderRadius: 10,
              accentColor: context.accentColor,
              suffixIcon: IconButton(
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  child: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    key: ValueKey<bool>(_obscurePassword),
                    color: context.secondaryTextColor.withAlpha((0.7 * 255).round()),
                  ),
                ),
                onPressed: _togglePasswordVisibility,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa tu contraseña';
                }
                if (value.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Link de olvidé mi contraseña
            Align(
              alignment: Alignment.centerRight,
              child: StylizedButton.tertiary(
                text: '¿Olvidaste tu contraseña?',
                onPressed: () {
                  // TODO: Implementar recuperación de contraseña
                },
              ),
            ),
            SizedBox(height: context.spacingXL),

            // Botón de inicio de sesión
            StylizedButton.primary(
              text: 'INICIAR SESIÓN',
              icon: Icons.login_rounded,
              showGlowEffect: true,
              fullWidth: true,
              onPressed: widget.isLoading
                  ? null
                  : () => _processLogin(context),
              customPadding: const EdgeInsets.symmetric(vertical: 18),
            ),
          ],
        ),
      ),
    );
  }
}
