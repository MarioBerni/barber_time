# 🏛️ Barber Time: Arquitectura y Estructura de Código

Este documento describe la arquitectura de software y la organización estructural del proyecto Barber Time. Su propósito es asegurar que el código sea limpio, mantenible, escalable y fácil de entender para cualquier desarrollador.

---

## 1. Arquitectura Limpia

El proyecto sigue una **Arquitectura Limpia** estricta. Esta filosofía de diseño separa el software en capas, cada una con responsabilidades claras y dependencias bien definidas. El objetivo es aislar la lógica de negocio de los detalles de implementación (como la UI y la base de datos), haciendo el sistema más fácil de probar y mantener.

**Regla de Dependencia:** Las dependencias solo pueden apuntar hacia adentro. La capa de Presentación conoce al Dominio, pero el Dominio no sabe nada sobre la Presentación.

### 1.1 Estructura de Directorios por Feature
La arquitectura se aplica a nivel de *feature* (módulo de funcionalidad). Cada feature dentro de `lib/features/` contiene tres capas:

```
lib/features/
└── feature_name/     # Ej: auth, home, profile
    ├── data/         # Implementación de repositorios y fuentes de datos
    │   ├── datasources/ # Fuentes de datos (API, local, mock)
    │   ├── models/      # Modelos de datos específicos de la fuente (ej: JSON)
    │   └── repositories/ # Implementación de los repositorios del dominio
    ├── domain/       # Lógica de negocio pura (independiente de UI y datos)
    │   ├── entities/    # Objetos de negocio principales
    │   ├── repositories/ # Interfaces (contratos) de los repositorios
    │   └── usecases/    # Casos de uso que orquestan la lógica
    └── presentation/ # Capa de UI
        ├── bloc/        # Lógica de estado (BLoCs/Cubits)
        ├── pages/       # Pantallas principales de la feature
        └── widgets/     # Widgets específicos de esta feature
```

### 1.2 Mapa de Decisiones: Dónde Colocar Cada Componente

| Si estás creando... | Colocarlo en... |
|---------------------|----------------|
| Un widget reutilizable en **toda** la app (ej: un botón custom) | `/lib/core/widgets/` |
| Un widget específico de **una** feature (ej: el formulario de login) | `/lib/features/auth/presentation/widgets/` |
| Una clase de utilidad general (ej: un formateador de fechas) | `/lib/core/utils/` |
| Un nuevo objeto de negocio (ej: `Cita`) | `/lib/features/appointments/domain/entities/` |
| La implementación de un repositorio (ej: `AuthRepositoryImpl`) | `/lib/features/auth/data/repositories/` |
| La lógica de estado para una pantalla | `/lib/features/{feature}/presentation/bloc/` |

---

## 2. Principios de Modularización

La modularización es clave para la mantenibilidad. El objetivo es tener componentes pequeños, enfocados y fáciles de entender.

### 2.1 Regla de Oro: Límite Estricto de Tamaño
- **Regla Crítica:** Ningún archivo `.dart` debe exceder las **200 líneas** de código.
- Este límite es **obligatorio y no negociable**.
- Si un archivo se acerca a este límite, debe ser refactorizado y dividido inmediatamente. La planificación debe hacerse para evitar llegar a este punto.

### 2.2 Señales de Alerta para Refactorizar
Debes considerar dividir un componente si:
- Un widget tiene más de **3 niveles de anidación** de `Column`/`Row`/`Stack`.
- Un método tiene más de **20 líneas**.
- Una clase tiene más de **5 métodos públicos**.
- Un archivo importa más de **10 dependencias**.
- Un componente maneja múltiples responsabilidades (ej: muestra datos Y maneja la entrada del usuario Y hace cálculos).

### 2.3 Estrategias de Modularización
- **Widgets:** Extrae secciones visuales coherentes en widgets separados. En lugar de un `LoginPage` de 400 líneas, tendrás `LoginHeader`, `LoginForm`, `SocialLoginButtons`, cada uno en su propio archivo.
- **Lógica de Negocio:** Extrae métodos complejos a clases de ayuda o servicios específicos.
- **Gestión de Estado:** Divide estados complejos en sub-estados. Crea Cubits/BLoCs específicos para dominios de estado independientes.

---

## 3. Estructuras de Código Transversales (`/core`)

La carpeta `lib/core/` contiene código que es compartido por múltiples features. Además de `di`, `routes`, `theme` y `widgets`, se deben considerar las siguientes estructuras:

### 3.1 Constantes de la Aplicación (`/core/constants`)
- **Propósito:** Centralizar valores literales que se usan en múltiples lugares de la aplicación para evitar errores de tipeo y facilitar su modificación.
- **Regla:** **No usar "magic strings" o "magic numbers" directamente en el código.** Deben ser definidos como constantes en esta carpeta.
- **Ejemplos de Archivos:**
    - `app_constants.dart`: Para valores numéricos (ej: `kDefaultPageSize = 20`).
    - `route_constants.dart`: Para los nombres de las rutas (ej: `const kHomeRoute = '/home'`).
    - `asset_constants.dart`: Para las rutas a los activos (ej: `const kLogoImage = 'assets/images/logo.png'`).
