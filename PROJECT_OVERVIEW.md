# 💈 Barber Time: Visión General del Proyecto

¡Bienvenido a Barber Time! Este documento es el punto de partida para cualquier persona que se una al proyecto. Aquí encontrarás una visión general del producto, nuestros objetivos y el estado actual del desarrollo.

---

## 1. ¿Qué es Barber Time?

**Barber Time** es una aplicación móvil diseñada para modernizar y simplificar la forma en que los hombres en Uruguay encuentran, comparan y reservan servicios de estética. Nuestra plataforma conecta a clientes con barberías, peluquerías y otros centros de cuidado masculino.

### 1.1 El Problema que Resolvemos
El descubrimiento y agendamiento de servicios de barbería es un proceso fragmentado. Los clientes dependen de recomendaciones, redes sociales o llamadas, sin una forma centralizada de ver disponibilidad, precios y opiniones.

### 1.2 Nuestra Solución
Barber Time ofrece una experiencia de usuario fluida, enfocada inicialmente en el perfil del **Cliente**, permitiéndole descubrir, comparar y reservar citas 24/7.

---

## 2. Roadmap y Estado Actual

El desarrollo del proyecto está dividido en fases para entregar valor de manera incremental.

### Estado Actual: **Fase 1 - Prototipo Frontend**

Actualmente, el proyecto se encuentra en la **primera fase de desarrollo**, con un enfoque exclusivo en la **construcción del Frontend**.

**Objetivos de la Fase Actual:**
- [x] Desarrollar la interfaz de usuario (UI) completa para el flujo del cliente.
- [x] Implementar la navegación con `go_router`.
- [x] Gestionar el estado con `BLoC/Cubit` utilizando **datos mock**.
- [x] Establecer una Arquitectura Limpia y un Sistema de Diseño robustos.

**Fuera del Alcance de esta Fase:**
- **Backend:** No se realizará ninguna integración con bases de datos o servicios de backend (como Firebase). Todas las fuentes de datos son locales y simuladas (`mock`).
- **Pruebas Automatizadas:** La escritura de pruebas unitarias, de widgets o de integración no es una prioridad en esta fase inicial.

---

## 3. Documentación del Proyecto

Para entender cómo trabajar en Barber Time, es esencial leer nuestra documentación. Está dividida en módulos para facilitar su consulta.

1.  **Para Empezar (Lectura Obligatoria):**
    *   ➡️ **[Manual de Desarrollo (`DEVELOPMENT_GUIDE.md`)](./DEVELOPMENT_GUIDE.md):** Contiene las reglas, flujos de trabajo y estándares que debes seguir.

2.  **Documentos de Referencia:**
    *   ➡️ **[Arquitectura (`ARCHITECTURE.md`)](./ARCHITECTURE.md):** Explica la estructura del código, la Arquitectura Limpia y la organización de directorios.
    *   ➡️ **[Sistema de Diseño (`DESIGN_SYSTEM.md`)](./DESIGN_SYSTEM.md):** Describe cómo usar el tema de la aplicación, los colores, estilos y componentes de UI.