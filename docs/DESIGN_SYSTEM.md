# 🎨 Barber Time: Sistema de Diseño

> **Guía oficial para interfaces consistentes, elegantes y de alto rendimiento**

## 🔸 Filosofía de Diseño

Barber Time representa **elegancia, sofisticación y modernidad** con un tema dark premium que comunica profesionalismo y exclusividad. Nuestros principios fundamentales son:

- **🖤 Minimalismo Elegante**: Menos es más - cada elemento tiene un propósito
- **💎 Contraste Nítido**: Máxima legibilidad y jerarquía visual clara
- **💧 Interactividad Intuitiva**: Elementos turquesa-menta guían la navegación
- **🍅 Acentos Premium**: Naranjas terracota para elementos destacados

---

## 🎨 Paleta de Colores

### Escala de Grises - Base del Diseño

```dart
// De más profundo a más claro
context.blackPure       // #000000 - Negro puro para máximo contraste
context.blackDeep       // #0A0A0A - Fondo principal de pantallas
context.charcoalDark    // #1A1A1A - Navegación, headers, footers
context.charcoalMedium  // #2A2A2A - Cards principales, contenedores
context.charcoalLight   // #3A3A3A - Elementos elevados, modals
context.grayDark        // #4A4A4A - Divisores, borders importantes
context.grayMedium      // #6A6A6A - Iconos secundarios
context.grayLight       // #8A8A8A - Texto secundario
context.grayPale        // #AAAAAA - Placeholders
```

### Colores de Acento

```dart
// TURQUESA-MENTA - SOLO INTERACTIVIDAD
context.primaryColor     // #3BBFAD - Elementos interactivos/activos
context.primaryDarkColor // #2A9D8F - Estados pressed/hover 
context.primaryLightColor// #5DCFBF - Highlights, notificaciones

// NARANJA TERRACOTA - ELEMENTOS DESTACADOS
context.secondaryColor    // #E57C4B - Precios, ofertas, rating
context.secondaryDarkColor// #D3632F - Estados pressed
context.secondaryLightColor// #F2936A - Highlights suaves

// TEXTOS
context.textColor         // #FFFFFF - Texto principal
context.secondaryTextColor// #E0E0E0 - Texto secundario
context.tertiaryTextColor // #AAAAAA - Placeholders
```

> ⚠️ **IMPORTANTE**: El color turquesa-menta (primaryColor) está reservado SOLO para interactividad o estados activos. Nunca debe usarse como decorativo o en elementos estáticos.

---

## 🗽 Tipografía y Espaciado

### Jerarquía Tipográfica (Poppins)

```dart
// TÍTULOS
headlineLarge  // 28px, bold     - Títulos principales
headlineMedium // 24px, semibold - Subtitulos
headlineSmall  // 20px, semibold - Títulos de sección

// TEXTO
bodyLarge      // 16px, normal   - Texto principal
bodyMedium     // 14px, normal   - Texto estándar
bodySmall      // 12px, normal   - Texto pequeño

// ETIQUETAS
labelLarge     // 14px, medium   - Etiquetas destacadas
labelMedium    // 12px, medium   - Etiquetas estándar
labelSmall     // 10px, medium   - Etiquetas pequeñas
```

### Espaciado Consistente

```dart
context.spacing.xxs   // 4.0  - Mínimo (entre icono y texto)
context.spacing.xs    // 8.0  - Padding interno compacto
context.spacing.sm    // 12.0 - Padding estándar
context.spacing.md    // 16.0 - Margen entre elementos relacionados
context.spacing.lg    // 24.0 - Margen entre secciones
context.spacing.xl    // 32.0 - Separación entre bloques
context.spacing.xxl   // 48.0 - Separación entre secciones principales
```

---

## 🔨 Componentes Principales

### Estructura de Pantalla Estándar

```dart
Scaffold(
  backgroundColor: context.blackDeep,          // Fondo principal
  appBar: AppBar(
    backgroundColor: context.charcoalDark,     // Headers oscuros
    foregroundColor: context.textColor,        // Texto blanco
  ),
  bottomNavigationBar: BarberBottomNavigationBar(),  // Nav oscuro con iconos turquesa activos
)
```

### Cards y Contenedores

```dart
// CARD ESTÁNDAR
Container(
  decoration: BoxDecoration(
    color: context.charcoalMedium,             // Fondo de card
    borderRadius: BorderRadius.circular(12),   // Radio estándar
  ),
)
```

### Botones

```dart
// BOTÓN PRIMARIO
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: context.primaryColor,     // Turquesa para acciones principales
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
)
```

---

## 🚀 Optimización Visual

### Carga de Imágenes

- Usar `CachedNetworkImage` para mejor rendimiento
- Implementar placeholders durante la carga
- Aplicar desvanecimientos suaves (300ms)

```dart
CachedNetworkImage(
  imageUrl: imageUrl,
  placeholder: (context, url) => Container(
    color: context.charcoalMedium,
    child: Center(
      child: CircularProgressIndicator(
        color: context.primaryColor,
      ),
    ),
  ),
  fit: BoxFit.cover,
  fadeInDuration: const Duration(milliseconds: 300),
)
```

### Rendimiento de Listas

- Usar `SliverList` con `SliverChildBuilderDelegate` para lazy loading
- Implementar técnicas de memoización para evitar reconstrucciones
- Usar `const constructors` donde sea apropiado

```dart
SliverList(
  delegate: SliverChildBuilderDelegate(
    (context, index) => _buildOptimizedSalonItem(context, salones[index]),
    childCount: salones.length,
  ),
)
```

---

> **💡 Recuerda**: La simplicidad y consistencia son clave. Este documento define los estándares para toda la aplicación - ¡síguelos con confianza!

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

**Turquesa-Menta (Uso Principal):**
```dart
context.primaryColor    // #3BBFAD - Turquesa-menta para elementos premium
context.primaryDarkColor// #2A9D8F - Turquesa-menta oscuro para profundidad
context.primaryLightColor// #5DCFBF - Turquesa-menta claro para highlights
```

**Naranja Terracota (Complementario):**
```dart
context.secondaryColor  // #E57C4B - Naranja terracota para elementos destacados
context.secondaryDarkColor// #D3632F - Naranja terracota oscuro para estados pressed
context.secondaryLightColor// #F2936A - Naranja terracota claro para elementos suaves
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
