# 📱 Barber Time: Visión General del Proyecto

## Propósito
Este documento presenta la visión general del proyecto Barber Time, incluyendo su propósito, público objetivo y alcance inicial.

## 1. Concepto del Producto

Barber Time es una aplicación móvil para la gestión de servicios de estética dirigidos al público masculino en Uruguay. La plataforma conecta a clientes con proveedores de servicios de estética masculina, facilitando el descubrimiento, comparación y reserva de citas.

### Público Objetivo

1. **Clientes:** Hombres en Uruguay que buscan descubrir, comparar y reservar servicios de estética.
2. **Propietarios:** Dueños de negocios del sector de estética masculina.  
3. **Empleados:** Profesionales que trabajan en establecimientos de estética.

## 2. Funcionalidades Clave

### Para Clientes
- Registro y autenticación con múltiples métodos
- Búsqueda y descubrimiento de proveedores de servicios
- Visualización de perfiles de negocios, servicios, precios y disponibilidad
- Reserva y gestión de citas online
- Sistema de calificaciones y reseñas

### Para Proveedores de Servicios
- Gestión de agenda y calendario de citas
- Configuración de servicios, precios y horarios de atención
- Gestión de perfiles de empleados con roles y permisos
- Base de datos de clientes con historial
- Herramientas de marketing básicas

## 3. Etapas de Desarrollo

El desarrollo del proyecto se realizará en tres fases principales:

1. **Fase 1 (Actual): Frontend**
   - Desarrollo completo de la interfaz de usuario
   - Implementación de flujos de navegación
   - Gestión de estado con datos mock
   - Diseño visual y experiencia de usuario

2. **Fase 2: Testing**
   - Implementación de pruebas unitarias
   - Pruebas de widgets
   - Pruebas de integración
   - Validación de usabilidad

3. **Fase 3: Backend**
   - Integración con Firebase (Auth, Firestore, Storage)
   - Implementación de reglas de seguridad
   - Persistencia de datos en la nube
   - Implementación de notificaciones

## 4. Principios Fundamentales de Desarrollo

### 4.1 Reutilización y Coherencia Visual

El proyecto Barber Time enfatiza los siguientes principios como pilares fundamentales del desarrollo:

- **Verificación antes de creación:** Antes de crear cualquier nuevo componente visual, verificar exhaustivamente si ya existe un componente similar que pueda ser reutilizado o extendido.

- **Mantener coherencia visual:** Asegurar que todos los elementos visuales compartan un lenguaje de diseño consistente, referenciando siempre el sistema de temas centralizado (AppTheme).

- **Documentación continua:** Documentar cada nuevo componente reutilizable inmediatamente después de su creación para facilitar su descubrimiento por otros desarrolladores.

- **Modularización efectiva:** Diseñar componentes independientes pero visualmente coherentes que puedan combinarse para crear interfaces complejas.

### 4.2 Tecnologías Clave

- **Frontend:** Flutter (SDK) / Dart (Lenguaje)
- **Gestión de Estado:** BLoC / Cubit (flutter_bloc)
- **Navegación:** go_router
- **Inyección de Dependencias:** get_it
- **UI/Animaciones:** flutter_animate
- **Modelos Inmutables:** freezed, equatable

## 5. Ecosistema de Documentación

| Documento | Propósito |
|-----------|-----------|
| **PROJECT_OVERVIEW.md** | **Este documento** - Visión general del proyecto |
| **DEVELOPMENT_GUIDE.md** | Metodología, estándares y flujo de trabajo |
| **CODE_STANDARDS.md** | Reglas específicas de codificación y estructura |

---

*Actualizado: Junio 2025*
