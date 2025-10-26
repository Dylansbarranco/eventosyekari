# Eventos Yekari - Tienda de Alquiler de Brincolines

Sitio web de comercio electrónico para **Eventos Yekari**, una empresa especializada en el alquiler de inflables (brincolines) y organización de eventos.

## 🎈 Características

- **Catálogo de productos**: Amplia variedad de inflables incluyendo:
  - Castillos inflables
  - Resbaladillas
  - Pistas de obstáculos
  - Inflables acuáticos
  - Combos para fiestas

- **Carrito de compras**: Funcionalidad completa de carrito para seleccionar y reservar productos
- **Filtros de productos**: Filtrado por categorías para facilitar la búsqueda
- **Galería de eventos**: Muestra de eventos realizados anteriormente
- **Formulario de contacto**: Para consultas y reservaciones
- **Diseño responsive**: Compatible con dispositivos móviles, tablets y escritorio

## 📁 Estructura del Proyecto

```
eventosyekari/
├── index.html          # Página principal
├── productos.html      # Catálogo de productos
├── galeria.html        # Galería de eventos
├── contacto.html       # Página de contacto
├── css/
│   └── styles.css      # Estilos CSS del sitio
├── js/
│   ├── cart.js         # Funcionalidad del carrito de compras
│   ├── filter.js       # Filtrado de productos
│   └── contact.js      # Manejo del formulario de contacto
└── images/             # Directorio para imágenes de productos
```

## 🚀 Cómo Usar

1. Abre `index.html` en tu navegador web
2. Navega por las diferentes secciones usando el menú superior
3. Explora los productos disponibles en la página de Productos
4. Agrega productos al carrito haciendo clic en "Agregar al Carrito"
5. Revisa tu carrito haciendo clic en el ícono 🛒
6. Procede a reservar y completa el formulario de contacto

## 💻 Tecnologías Utilizadas

- HTML5
- CSS3 (con diseño responsive)
- JavaScript (Vanilla JS, sin frameworks)
- LocalStorage para persistencia del carrito

## 🎨 Personalización

### Cambiar Colores
Edita las siguientes variables en `css/styles.css`:
- Colores principales: `#667eea`, `#764ba2`
- Color de acento: `#ff6b6b`

### Agregar Productos
Edita `productos.html` y agrega nuevas tarjetas de producto siguiendo la estructura existente.

### Agregar Imágenes
Coloca las imágenes de productos en el directorio `images/` y actualiza las referencias en el HTML.

## 📱 Características del Carrito

- Almacenamiento persistente usando LocalStorage
- Contador de productos en tiempo real
- Cálculo automático de totales
- Eliminación de productos
- Integración con el formulario de contacto

## 📞 Información de Contacto

- Teléfono: (555) 123-4567
- Email: info@eventosyekari.com
- Ubicación: Ciudad de México

## 📝 Notas

Este es un sitio web estático diseñado para demostración. Para una implementación en producción, se recomienda:
- Integrar un backend para procesar pedidos
- Implementar un sistema de pago en línea
- Agregar base de datos para gestión de inventario
- Implementar sistema de autenticación de usuarios

## 📄 Licencia

© 2025 Eventos Yekari. Todos los derechos reservados.