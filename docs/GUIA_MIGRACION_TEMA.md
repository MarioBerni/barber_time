# Guía de Migración al Sistema de Temas Centralizado

## Objetivo
Este documento describe el proceso para migrar componentes existentes al nuevo sistema de temas centralizado de Barber Time, asegurando consistencia visual y facilitando el mantenimiento.

## Sistema de Temas Centralizado

### Estructura
El nuevo sistema de temas se compone de:

1. **Colores y estilos base (`app_theme.dart`)**
   - Paleta de colores centralizada
   - Temas de widgets configurados
   - ThemeData configurado con todos los estilos necesarios

2. **Abstracciones de estilo**
   - `AppTextStyles`: Estilos de texto predefinidos para toda la aplicación
   - `AppSpacing`: Espaciados estandarizados para márgenes y paddings
   - `AppBorderRadius`: Radios de borde consistentes para todos los componentes

3. **Extensiones de contexto (`app_theme_extensions.dart`)**
   - Acceso simplificado a colores, estilos y dimensiones
   - Consistencia mejorada para todos los desarrolladores

## Proceso de Migración

### Paso 1: Actualizar imports
```dart
// Antes solo se usaba
import '../../../../core/theme/app_theme.dart';

// Ahora usar
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/theme/app_spacing.dart'; // Si se necesitan espaciados
```

### Paso 2: Reemplazar referencias directas a colores
```dart
// Antes
color: AppTheme.kLightPrimaryColor,

// Ahora
color: context.primaryColor,
```

### Paso 3: Reemplazar TextStyle directos
```dart
// Antes
style: TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
),

// Ahora
style: context.h4, // o el estilo que mejor se ajuste
```

### Paso 4: Reemplazar dimensiones hardcodeadas
```dart
// Antes
padding: const EdgeInsets.symmetric(vertical: 16.0),

// Ahora
padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
```

### Paso 5: Reemplazar bordes hardcodeados
```dart
// Antes
borderRadius: BorderRadius.circular(8.0),

// Ahora
borderRadius: context.cardBorderRadius, // o el radio adecuado
```

## Recomendaciones

1. **Migrar componente por componente**: No intentar cambiar toda la aplicación de una vez
2. **Priorizar componentes reutilizables**: Empezar por widgets comunes como botones, campos de texto, etc.
3. **Probar visualmente después de cada cambio**: Asegurar que no hay regresiones visuales
4. **Eliminar constantes no necesarias**: Al migrar un componente, eliminar cualquier definición de estilo redundante
5. **Considerar la accesibilidad**: Verificar que los contrastes y tamaños son adecuados

## Ejemplos de Uso

### Ejemplo completo antes
```dart
Container(
  padding: const EdgeInsets.all(16.0),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 4.0,
      ),
    ],
  ),
  child: Text(
    'Título',
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppTheme.kLightTextColor,
    ),
  ),
)
```

### Ejemplo completo después
```dart
Container(
  padding: EdgeInsets.all(AppSpacing.md),
  decoration: BoxDecoration(
    color: context.surfaceColor,
    borderRadius: context.cardBorderRadius,
    boxShadow: [
      BoxShadow(
        color: context.textColor.withOpacity(0.1),
        blurRadius: 4.0,
      ),
    ],
  ),
  child: Text(
    'Título',
    style: context.h4,
  ),
)
```

## Soporte y Contacto

Si tienes dudas sobre qué estilo utilizar o cómo migrar un componente específico, consulta la documentación del sistema de diseño o contacta al equipo de UI/UX.
