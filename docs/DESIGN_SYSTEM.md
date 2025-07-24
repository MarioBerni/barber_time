# 🎨 Barber Time: Sistema de Diseño y UI

Este documento es la guía oficial para todo lo relacionado con la interfaz de usuario (UI) y la experiencia de usuario (UX) en Barber Time. Su propósito es garantizar una identidad visual coherente, profesional y fácil de mantener.

---

## 1. El Principio Fundamental: Cero Estilos Hardcodeados

**Regla de Oro:** Está terminantemente **prohibido usar colores, estilos de texto, espaciados o cualquier otro valor de diseño de forma "hardcodeada"** (directamente en el código del widget).

Toda definición de estilo debe provenir de nuestro tema centralizado (`AppTheme`). Esto nos permite:
- **Consistencia Absoluta:** Todas las partes de la app se ven y se sienten igual.
- **Mantenimiento Sencillo:** Cambiar un color o una fuente en un solo lugar (`AppTheme`) actualiza toda la aplicación.
- **Soporte para Temas:** Facilita la implementación futura de modos claro/oscuro.

---

## 2. Cómo Usar el Tema Centralizado

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

## 3. Componentes y Widgets Reutilizables

### 3.1 Biblioteca Central de Widgets
La carpeta `lib/core/widgets/` contiene widgets genéricos y reutilizables en toda la aplicación (botones, campos de texto, tarjetas base, etc.).

**Principio de Reutilización:** Antes de crear un nuevo widget, **siempre** revisa si ya existe uno similar en `lib/core/widgets/` o en la carpeta de widgets de la feature actual (`lib/features/feature_name/presentation/widgets/`).

### 3.2 Principios de UI
- **Coherencia:** Usa los componentes y estilos definidos en `lib/core`. No reinventes la rueda.
- **Simplicidad:** Prefiere diseños limpios, minimalistas y con buen uso del espacio en blanco.
- **Responsividad:** Asegúrate de que los diseños se adapten correctamente a diferentes tamaños de pantalla.

---

## 4. Componentes de Estado de UI

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
