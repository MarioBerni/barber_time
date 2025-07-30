import 'package:flutter/material.dart';
import 'animated_gradient_background.dart';
import 'gradient_background_preset.dart';

/// Clase utilitaria para crear instancias de AnimatedGradientBackground
///
/// Proporciona métodos factory que simplifica la creación de fondos
/// (Versión simplificada sin efectos de degradado ni animaciones)
/// con configuraciones predefinidas
class GradientBackgroundFactory {
  // Constructor privado para evitar instanciación directa
  GradientBackgroundFactory._();

  /// Crea una instancia de AnimatedGradientBackground desde un preset
  /// Versión simplificada que solo utiliza el color primario
  static AnimatedGradientBackground fromPreset({
    Key? key,
    required GradientBackgroundPreset preset,
  }) {
    // Sólo utiliza el color primario del preset
    return AnimatedGradientBackground(
      key: key,
      primaryColor: preset.primaryColor,
    );
  }

  /// Crea una instancia con el preset barber específico
  ///
  /// Este preset utiliza tonos azules (versión simplificada)
  static AnimatedGradientBackground lightBarber({Key? key}) {
    return fromPreset(key: key, preset: GradientBackgroundPreset.lightBarber);
  }

  /// Crea una instancia con el preset para auth
  static AnimatedGradientBackground professional({Key? key}) {
    return fromPreset(
      key: key,
      preset: GradientBackgroundPreset.darkPremiumAuth,
    );
  }

  /// Crea una instancia con el preset premium
  static AnimatedGradientBackground premium({Key? key}) {
    return fromPreset(key: key, preset: GradientBackgroundPreset.premium);
  }

  /// Crea una instancia con el preset para app más clara
  static AnimatedGradientBackground welcome({Key? key}) {
    return fromPreset(key: key, preset: GradientBackgroundPreset.lightApp);
  }

  /// Crea una instancia con el preset para datos
  static AnimatedGradientBackground elegant({Key? key}) {
    return fromPreset(key: key, preset: GradientBackgroundPreset.darkData);
  }
}
