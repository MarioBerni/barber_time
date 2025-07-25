# 🎨 Barber Time: Sistema de Diseño y UI

Este documento es la guía oficial para todo lo relacionado con la interfaz de usuario (UI) y la experiencia de usuario (UX) en Barber Time. Su propósito es garantizar una identidad visual coherente, profesional y fácil de mantener.

## 🌟 Identidad Visual Premium

Barber Time utiliza un **tema dark elegante** con una paleta de colores refinada que transmite sofisticación, profesionalismo y modernidad. La identidad visual se basa en:

- **🖤 Escala de grises armoniosa** - Para crear profundidad y jerarquía visual
- **✨ Acentos dorados selectos** - Para elementos premium y de alta importancia
- **💙 Azul Material Design** - Para elementos interactivos y navegación
- **💎 Contrastes nítidos** - Para máxima legibilidad y accesibilidad

---

## 1. Paleta de Colores Refinada

### 1.1 Escala de Grises Armoniosa

La base de nuestro diseño es una escala de grises perfectamente equilibrada que crea profundidad visual sin saltos bruscos:

```dart
// Escala de grises refinada - Armonía Negro-Gris Premium
context.blackPure       // #000000 - Negro puro para máximo contraste
context.blackDeep       // #0A0A0A - Negro profundo para fondo principal
context.charcoalDark    // #1A1A1A - Carbón oscuro para superficies principales
context.charcoalMedium  // #2A2A2A - Carbón medio para cards y contenedores
context.charcoalLight   // #3A3A3A - Carbón claro para elementos elevados
context.grayDark        // #4A4A4A - Gris oscuro para divisores importantes
context.grayMedium      // #6A6A6A - Gris medio para elementos secundarios
context.grayLight       // #8A8A8A - Gris claro para texto secundario
context.grayPale        // #AAAAAA - Gris pálido para placeholders
```

### 1.2 Colores de Acento Premium

**Dorados Elegantes (Uso Selectivo):**
```dart
context.primaryColor    // #D4AF37 - Oro clásico para elementos premium
context.primaryDarkColor// #B8860B - Oro oscuro para profundidad
context.primaryLightColor// #E6C757 - Oro claro para highlights
```

**Azul Material Design (Interactividad):**
```dart
context.bluePrimary     // #2196F3 - Azul principal para navegación
context.blueDark        // #1976D2 - Azul oscuro para estados pressed
context.blueLight       // #64B5F6 - Azul claro para elementos suaves
```

### 1.3 Textos Optimizados

```dart
context.textColor           // #FFFFFF - Texto principal blanco
context.secondaryTextColor  // #E0E0E0 - Texto secundario gris claro
context.tertiaryTextColor   // #AAAAAA - Texto terciario (placeholders)
```

### 1.4 Aplicación Estratégica

- **Fondos:** `blackDeep` → `charcoalDark` → `charcoalMedium` → `charcoalLight`
- **Navegación:** `charcoalDark` con acentos `bluePrimary`
- **Cards:** `charcoalMedium` con elevación hacia `charcoalLight`
- **Elementos premium:** Acentos dorados selectivos
- **Estados interactivos:** `bluePrimary` y variaciones

---

## 2. El Principio Fundamental: Cero Estilos Hardcodeados

**Regla de Oro:** Está terminantemente **prohibido usar colores, estilos de texto, espaciados o cualquier otro valor de diseño de forma "hardcodeada"** (directamente en el código del widget).

Toda definición de estilo debe provenir de nuestro tema centralizado (`AppTheme`). Esto nos permite:
- **Consistencia Absoluta:** Todas las partes de la app se ven y se sienten igual.
- **Mantenimiento Sencillo:** Cambiar un color o una fuente en un solo lugar (`AppTheme`) actualiza toda la aplicación.
- **Soporte para Temas:** Facilita la implementación futura de modos claro/oscuro.

---

## 3. Cómo Usar el Tema Centralizado

El sistema de temas se accede a través de **extensiones de `BuildContext`**. Este método proporciona una forma corta, legible y consistente de obtener valores de diseño.

**Paso 1: Importa siempre las extensiones del tema**
En cualquier archivo de widget donde necesites acceder a estilos, asegúrate de incluir la siguiente importación:
```dart
import 'package:barber_time/core/theme/app_theme_extensions.dart';
```

**Paso 2: Accede a los valores del tema a través de `context`**

### Ejemplo Práctico: La Forma Correcta vs. la Incorrecta

```dart
// ❌ ANTES (Incorrecto - Hardcodeado)
Container(
  padding: const EdgeInsets.all(16.0),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),
  ),
  child: Text(
    'Título',
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color(0xFF000000),
    ),
  ),
)

// ✅ AHORA (Correcto - Usando el Tema)
Container(
  padding: EdgeInsets.all(context.spacing.md), // Usar espaciados del tema
  decoration: BoxDecoration(
    color: context.color.surface, // Usar colores del tema
    borderRadius: context.borderRadius.card, // Usar radios de borde del tema
  ),
  child: Text(
    'Título',
    style: context.textTheme.h4, // Usar estilos de texto del tema
  ),
)
```

---

## 4. Componentes y Widgets Reutilizables

### 4.1 Biblioteca Central de Widgets
La carpeta `lib/core/widgets/` contiene widgets genéricos y reutilizables en toda la aplicación (botones, campos de texto, tarjetas base, etc.).

**Principio de Reutilización:** Antes de crear un nuevo widget, **siempre** revisa si ya existe uno similar en `lib/core/widgets/` o en la carpeta de widgets de la feature actual (`lib/features/feature_name/presentation/widgets/`).

### 4.2 Principios de UI
- **Coherencia:** Usa los componentes y estilos definidos en `lib/core`. No reinventes la rueda.
- **Simplicidad:** Prefiere diseños limpios, minimalistas y con buen uso del espacio en blanco.
- **Responsividad:** Asegúrate de que los diseños se adapten correctamente a diferentes tamaños de pantalla.

---

## 5. Componentes de Estado de UI

Para asegurar una experiencia de usuario consistente al manejar datos, es fundamental usar componentes estandarizados para los estados comunes de la lógica de negocio (BLoC/Cubit).

Se deben crear y utilizar los siguientes widgets reutilizables desde `lib/core/widgets/`:

*   **`LoadingIndicatorWidget`:**
    *   **Propósito:** Mostrar cuando la aplicación está esperando una respuesta (ej: cargando datos de la red).
    *   **Diseño:** Debe ser una animación sutil y no intrusiva que se alinee con la identidad visual de la marca.

*   **`ErrorMessageWidget`:**
    *   **Propósito:** Mostrar un mensaje de error amigable cuando una operación falla.
    *   **Diseño:** Debe incluir un icono de error, un título claro y un mensaje descriptivo. Opcionalmente, puede incluir un botón de "Reintentar".

*   **`EmptyStateWidget`:**
    *   **Propósito:** Mostrar cuando una lista o una búsqueda no devuelve resultados.
    *   **Diseño:** Debe ser visualmente agradable, con un icono o ilustración, un título (ej: "No se encontraron barberías") y un subtítulo que sugiera una acción.
