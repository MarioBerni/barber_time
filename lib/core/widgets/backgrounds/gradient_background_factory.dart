import 'package:flutter/material.dart';
import 'animated_gradient_background.dart';
import 'gradient_background_preset.dart';

/// Clase utilitaria para crear instancias de AnimatedGradientBackground 
/// 
/// Proporciona métodos factory que simplifica la creación de fondos
/// (Versión simplificada sin efectos de degradado ni animaciones) con configuraciones predefinidas
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
    return fromPreset(
      key: key,
      preset: GradientBackgroundPreset.lightBarber,
    );
  }
  
  /// Crea una instancia con el preset profesional
  static AnimatedGradientBackground professional({Key? key}) {
    return fromPreset(
      key: key,
      preset: GradientBackgroundPreset.professional,
    );
  }
  
  /// Crea una instancia con el preset premium
  static AnimatedGradientBackground premium({Key? key}) {
    return fromPreset(
      key: key,
      preset: GradientBackgroundPreset.premium,
    );
  }
  
  /// Crea una instancia con el preset de bienvenida
  static AnimatedGradientBackground welcome({Key? key}) {
    return fromPreset(
      key: key,
      preset: GradientBackgroundPreset.welcome,
    );
  }
  
  /// Crea una instancia con el preset elegante
  static AnimatedGradientBackground elegant({Key? key}) {
    return fromPreset(
      key: key,
      preset: GradientBackgroundPreset.elegant,
    );
  }
}
