import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/spacers/spacers.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_text_field.dart';

/// Pantalla de registro de usuarios
class RegisterPage extends StatefulWidget {
  /// Constructor de RegisterPage.
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String _selectedRole = 'client'; // Valor por defecto: cliente

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  void _handleRegister(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Las contraseñas no coinciden'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      FocusScope.of(context).unfocus();
      context.read<AuthCubit>().register(
        _nameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text,
        _selectedRole,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Cuenta')),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // Mostrar mensajes de error si los hay
          if (state.status == AuthStatus.error && state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: context.errorColor,
              ),
            );
            context.read<AuthCubit>().clearError();
          }

          // Navegar a la pantalla principal si el registro fue exitoso
          if (state.status == AuthStatus.authenticated) {
            context.go(AppRoutes.home);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Título y descripción
                  SizedBox(height: AppSpacing.md),
                  Text(
                    'Crea tu cuenta',
                    textAlign: TextAlign.center,
                    style: context.h2,
                  ),
                  SizedBox(height: AppSpacing.xs),
                  Text(
                    'Ingresa tus datos para registrarte',
                    textAlign: TextAlign.center,
                    style: context.bodyMedium.copyWith(
                      color: context.secondaryTextColor,
                    ),
                  ),
                  SizedBox(height: AppSpacing.xl),

                  // Campos del formulario
                  AuthTextField(
                    controller: _nameController,
                    labelText: 'Nombre completo',
                    hintText: 'Juan Pérez',
                    prefixIcon: Icons.person_outline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu nombre';
                      }
                      if (value.length < 3) {
                        return 'El nombre debe tener al menos 3 caracteres';
                      }
                      return null;
                    },
                  ),
                  AppSpacers.md,

                  AuthTextField(
                    controller: _emailController,
                    labelText: 'Correo electrónico',
                    hintText: 'ejemplo@correo.com',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
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
                  AppSpacers.md,

                  AuthTextField(
                    controller: _passwordController,
                    labelText: 'Contraseña',
                    hintText: '••••••••',
                    prefixIcon: Icons.lock_outline,
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppTheme.kSecondaryTextColor,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa una contraseña';
                      }
                      if (value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                  AppSpacers.md,

                  AuthTextField(
                    controller: _confirmPasswordController,
                    labelText: 'Confirmar contraseña',
                    hintText: '••••••••',
                    prefixIcon: Icons.lock_outline,
                    obscureText: _obscureConfirmPassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppTheme.kSecondaryTextColor,
                      ),
                      onPressed: _toggleConfirmPasswordVisibility,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor confirma tu contraseña';
                      }
                      if (value != _passwordController.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                  ),
                  AppSpacers.lg,

                  // Selección de rol
                  Text('Tipo de cuenta:', style: context.bodyMedium),
                  SizedBox(height: AppSpacing.xs),

                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.secondaryTextColor.withAlpha(
                          (0.5 * 255).round(),
                        ),
                      ),
                      borderRadius: context.defaultBorderRadius,
                      color: context.backgroundColor.withAlpha(
                        (0.5 * 255).round(),
                      ),
                    ),
                    child: Column(
                      children: [
                        RadioListTile<String>(
                          title: const Text('Cliente'),
                          subtitle: const Text('Busco servicios de barbería'),
                          value: 'client',
                          groupValue: _selectedRole,
                          onChanged: (value) {
                            setState(() {
                              _selectedRole = value!;
                            });
                          },
                          activeColor: AppTheme.kAccentColor,
                        ),
                        RadioListTile<String>(
                          title: const Text('Barbero/Negocio'),
                          subtitle: const Text('Ofrezco servicios de barbería'),
                          value: 'barber',
                          groupValue: _selectedRole,
                          onChanged: (value) {
                            setState(() {
                              _selectedRole = value!;
                            });
                          },
                          activeColor: AppTheme.kAccentColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.xl),

                  // Botón de registro
                  ElevatedButton(
                    onPressed: state.isLoading
                        ? null
                        : () => _handleRegister(context),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                      shape: RoundedRectangleBorder(
                        borderRadius: context.buttonBorderRadius,
                      ),
                    ),
                    child: state.isLoading
                        ? SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: context.textColor,
                              strokeWidth: 2,
                            ),
                          )
                        : Text('REGISTRARSE', style: context.button),
                  ),
                  const SizedBox(height: 24),

                  // Enlace para iniciar sesión
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿Ya tienes cuenta? ',
                        style: TextStyle(color: AppTheme.kSecondaryTextColor),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go(AppRoutes.login);
                        },
                        child: const Text('Inicia sesión'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
