# 🎯 Lineamientos Visuales: Barber Time Premium

> **Guía maestra para aplicar la identidad visual refinada en toda la aplicación**

---

## 🌟 Filosofía de Diseño

Barber Time Premium representa **elegancia, sofisticación y modernidad** en el mundo de las barberías. Nuestro diseño dark transmite profesionalismo mientras mantiene la calidez y confianza que buscan nuestros usuarios.

### Principios Fundamentales:
- **🖤 Minimalismo Elegante**: Menos es más - cada elemento tiene un propósito
- **💎 Contraste Nítido**: Máxima legibilidad y jerarquía visual clara
- **💧 Interactividad Moderna**: Elementos turquesa-menta guían la navegación
- **🍅 Acentos Premium**: Naranjas terracota para elementos de alto valor

---

## 🎨 Paleta de Colores: Aplicación Estratégica

### 🖤 Escala de Grises - Jerarquía Visual

```dart
// FONDOS - De más profundo a más elevado
context.blackDeep       → Fondo principal de pantallas
context.charcoalDark    → Navegación, headers, footers
context.charcoalMedium  → Cards principales, contenedores
context.charcoalLight   → Elementos elevados, modals

// ELEMENTOS SECUNDARIOS
context.grayDark        → Divisores, borders importantes
context.grayMedium      → Iconos secundarios, elementos de apoyo
context.grayLight       → Texto secundario, placeholders
```

### 💧 Turquesa-Menta - SOLO Interactividad y Estados Activos

```dart
// USO RESTRINGIDO: SOLO PARA ELEMENTOS INTERACTIVOS Y ESTADOS ACTIVOS
// NO USAR PARA ELEMENTOS ESTÁTICOS O DECORATIVOS
context.primaryColor     → Tabs/botones activos, links interactivos
context.primaryDarkColor → Estados pressed/hover en elementos interactivos
context.primaryLightColor → Highlights de selección, notificaciones, indicadores de estado activo
```

> **⚠️ Regla Estricta**: El color turquesa-menta está reservado EXCLUSIVAMENTE para indicar interactividad o estados activos. Nunca debe usarse como color decorativo o en elementos estáticos.

### 🍅 Naranja Terracota - Elementos de Valor

```dart
// USO SELECTIVO - SOLO PARA ELEMENTOS PREMIUM
context.primaryColor    → Precios, ofertas especiales, ratings altos
context.primaryDarkColor→ Elementos premium pressed
context.primaryLightColor→ Highlights dorados suaves
```

---

## 🏗️ Arquitectura Visual por Componentes

### 📱 Estructura de Pantalla Estándar

```dart
Scaffold(
  backgroundColor: context.blackDeep,          // Fondo principal siempre
  appBar: AppBar(
    backgroundColor: context.charcoalDark,     // Headers oscuros
    foregroundColor: context.textColor,       // Texto blanco
  ),
  body: Container(
    color: context.blackDeep,                  // Cuerpo principal
    child: // Contenido...
  ),
  bottomNavigationBar: Container(
    color: context.charcoalDark,               // Nav bottom oscuro
    // Iconos activos: context.bluePrimary
    // Iconos inactivos: context.grayLight
  ),
)
```

### 🎛️ Cards y Contenedores

```dart
// CARD ESTÁNDAR
Container(
  decoration: BoxDecoration(
    color: context.charcoalMedium,             // Fondo de card
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: context.blackPure.withOpacity(0.3),  // Sombra sutil
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: // Contenido...
)

// CARD PREMIUM/ELEVADO
Container(
  decoration: BoxDecoration(
    color: context.charcoalLight,              // Más claro = más elevado
    border: Border.all(
      color: context.primaryColor.withOpacity(0.2),  // Borde dorado sutil
    ),
    // ... resto de propiedades
  ),
)
```

### 🔘 Botones y Elementos Interactivos

```dart
// BOTÓN PRIMARIO (Principal)
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: context.bluePrimary,      // Azul para acciones principales
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child: Text('Acción Principal'),
)

// BOTÓN PREMIUM (Especial)
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: context.primaryColor,     // Dorado para acciones premium
    foregroundColor: context.blackDeep,
    // ... styling
  ),
  child: Text('Acción Premium'),
)

// BOTÓN SECUNDARIO
OutlinedButton(
  style: OutlinedButton.styleFrom(
    side: BorderSide(color: context.grayMedium),
    foregroundColor: context.textColor,
    // ... styling
  ),
  child: Text('Acción Secundaria'),
)
```

### 📝 Tipografía y Textos

```dart
// JERARQUÍA DE TEXTOS
Text('Título Principal', 
  style: context.textTheme.headlineLarge?.copyWith(
    color: context.textColor,                 // Blanco principal
    fontWeight: FontWeight.bold,
  )
)

Text('Subtítulo/Descripción', 
  style: context.textTheme.bodyLarge?.copyWith(
    color: context.secondaryTextColor,        // Gris claro
  )
)

Text('Texto de apoyo', 
  style: context.textTheme.bodyMedium?.copyWith(
    color: context.grayLight,                 // Gris más claro
  )
)

// TEXTO PREMIUM/PRECIO
Text('\$25.00', 
  style: context.textTheme.headlineMedium?.copyWith(
    color: context.primaryColor,              // Dorado para precios
    fontWeight: FontWeight.bold,
  )
)
```

---

## 🎯 Patrones de Aplicación por Sección

### 🏠 Home Page - Patrón Establecido

- **Header**: `charcoalDark` → `charcoalMedium` con gradiente sutil
- **Iconos de navegación**: `bluePrimary` SOLO para activos, `grayLight` para inactivos
- **Cards de ofertas**: `charcoalMedium` con acentos dorados para ofertas especiales
- **Bottom Navigation**: `charcoalDark` con iconos azules SOLO para elementos activos
- **Botones interactivos**: Usar `bluePrimary` para estados activos, hover o pressed
- **Textos interactivos**: Links y botones de texto en `bluePrimary`, texto normal en escala de grises/blanco

### 👤 Profile Page - Aplicar Consistentemente

```dart
// Header de perfil
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [context.charcoalDark, context.charcoalMedium],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  // Avatar, nombre, etc.
)

// Opciones de perfil
ListTile(
  tileColor: context.charcoalMedium,
  iconColor: context.bluePrimary,              // Iconos azules
  textColor: context.textColor,                // Texto blanco
  // ...
)
```

### 📅 Booking Pages - Sugerencias

- **Calendario**: Días disponibles en `bluePrimary`, seleccionados en `primaryColor`
- **Horarios**: Slots disponibles en `charcoalMedium`, seleccionados en `blueLight`
- **Confirmación**: Cards de confirmación en `charcoalLight` con acentos dorados

---

## ⚡ Estados Interactivos

### Botones y Elementos Tocables

```dart
// ESTADOS HOVER/PRESSED
MaterialStateProperty.resolveWith<Color>((states) {
  if (states.contains(MaterialState.pressed)) {
    return context.blueDark;                   // Más oscuro cuando pressed
  }
  if (states.contains(MaterialState.hovered)) {
    return context.blueLight;                  // Más claro en hover
  }
  return context.bluePrimary;                  // Estado normal
})
```

### Elementos Seleccionados

```dart
// TABS ACTIVOS/INACTIVOS
TabBar(
  indicatorColor: context.bluePrimary,         // Indicador azul
  selectedLabelColor: context.bluePrimary,     // Texto activo azul
  unselectedLabelColor: context.grayLight,     // Texto inactivo gris
  // ...
)
```

---

## 🔍 Casos Especiales

### 🎁 Elementos Premium/Ofertas

- **Badges de oferta**: Fondo `primaryColor` con texto `blackDeep`
- **Cards de servicios premium**: Border sutil en `primaryColor`
- **Ratings altos (4.5+)**: Estrellas en `primaryColor`

### ⚠️ Estados de Error/Éxito

```dart
// ERROR
color: Colors.red[400],                        // Rojo Material suave
backgroundColor: Colors.red[50]?.withOpacity(0.1),

// ÉXITO  
color: Colors.green[400],                      // Verde Material suave
backgroundColor: Colors.green[50]?.withOpacity(0.1),

// WARNING
color: Colors.orange[400],                     // Naranja Material suave
```

---

## 🎨 Efectos Visuales Estándar

### Sombras Consistentes

```dart
// SOMBRA CARD ESTÁNDAR
BoxShadow(
  color: context.blackPure.withOpacity(0.3),
  blurRadius: 8,
  offset: Offset(0, 4),
)

// SOMBRA ELEVADA
BoxShadow(
  color: context.blackPure.withOpacity(0.4),
  blurRadius: 12,
  offset: Offset(0, 6),
)

// SOMBRA AZUL SUTIL (para elementos interactivos)
BoxShadow(
  color: context.bluePrimary.withOpacity(0.1),
  blurRadius: 6,
  offset: Offset(0, 2),
)
```

### Bordes y Divisores

```dart
// BORDER ESTÁNDAR
Border.all(color: context.grayDark, width: 1)

// BORDER INTERACTIVO
Border.all(color: context.bluePrimary, width: 2)

// DIVIDER
Divider(color: context.grayDark, thickness: 1)
```

---

## ✅ Checklist de Aplicación

Antes de implementar cualquier pantalla nueva, verifica:

- [ ] **Fondo principal**: `context.blackDeep` ✓
- [ ] **Headers/Navigation**: `context.charcoalDark` ✓  
- [ ] **Cards principales**: `context.charcoalMedium` ✓
- [ ] **Elementos interactivos**: `context.bluePrimary` ✓
- [ ] **Texto principal**: `context.textColor` (blanco) ✓
- [ ] **Texto secundario**: `context.secondaryTextColor` ✓
- [ ] **Acentos premium**: Solo cuando aplique ✓
- [ ] **Sombras consistentes**: Según patrones establecidos ✓
- [ ] **Estados hover/pressed**: Implementados ✓

---

## 🎯 Resultado Esperado

**Al seguir estos lineamientos, toda la app tendrá:**
- ✨ **Identidad visual consistente** en todas las pantallas
- 🖤 **Jerarquía visual clara** con la escala de grises refinada  
- 💙 **Navegación intuitiva** con elementos azules guía
- ⚡ **Interactividad fluida** con estados bien definidos
- 💎 **Sensación premium** con acentos dorados selectivos

---

> **💡 Recuerda**: Estos lineamientos están basados en el refinamiento visual exitoso de HomeHeader y BottomNavigationBar. ¡Aplícalos con confianza en toda la app!
