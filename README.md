# Eventos Yekari — Proyecto (proyecto0)

Este repositorio contiene el código fuente de un pequeño sistema de catálogo y gestión de servicios para "Eventos Yekari".

El sistema incluye:
- Catálogo de servicios (tarjetas), con imágenes y opción "añadir al carrito".
- Carrito de compras en sesión (simulación de pago): inserta en `ordenes` y `orden_items`.
- Panel de administración (single-panel) con CRUD de servicios, subida de imágenes y lista de pedidos.
- Registro e inicio de sesión para clientes y administradores (controladores en PHP).
- Panel de cliente para ver/editar perfil y listar órdenes.

Estructura relevante
- `proyecto0/`
	- `controlador/` : controladores PHP (Carrito, Servicios, Cliente, ProcesarLogin, etc.)
	- `modelo/` : modelos (Administrador, Cliente, servicio/agendaservicio...)
	- `vista/` : vistas públicas y paneles (catalogo, carrito, cliente_panel, dashboard_admin, etc.)
	- `public/` : assets (css, js, img)
	- `db/` : archivos relacionados con la base de datos (migrations, dumps)

Requisitos
- PHP 7.4+ (o PHP 8.x)
- MySQL / MariaDB
- Apache (XAMPP recomendado en Windows para desarrollo)

Instalación rápida (entorno local con XAMPP)
1. Copia/coloca el proyecto en el directorio de htdocs de XAMPP. Por ejemplo:
	 - `C:\xampp\htdocs\eventosyekari` (ya está en esta ruta en este repositorio de ejemplo)
2. Asegúrate de que Apache y MySQL estén corriendo desde el panel de XAMPP.
3. Crear la base de datos y tablas:
	 - Si tienes un `dump.sql` o instrucciones en `db/`, impórtalo en phpMyAdmin o desde la consola MySQL.
	 - Importante: hay una migración pendiente que añade campos a `ordenes` (dirección, teléfono, fecha, hora). Encontrarás el archivo en `db/migrations/add_ordenes_fields.sql`.

Ejecutar la migración (dos opciones comunes):
- Usando phpMyAdmin:
	- Abre http://localhost/phpmyadmin
	- Selecciona tu base de datos
	- Ve a la pestaña SQL y pega el contenido de `db/migrations/add_ordenes_fields.sql` o súbelo.
- Usando la consola MySQL (PowerShell):
	- Abre PowerShell y ejecuta:

```powershell
mysql -u tu_usuario -p nombre_base_de_datos < "C:\ruta\a\proyecto\db\migrations\add_ordenes_fields.sql"
```

Configuración de conexión a la BD
- El archivo de conexión está en `controlador/db.php`. Ajusta el DSN, usuario y contraseña según tu instalación de MySQL (por ejemplo `root` y contraseña vacía en XAMPP por defecto).

Permisos de subida de imágenes
- Las imágenes de servicios se suben a `public/img/`. En Windows normalmente no necesitarás cambiar permisos; en Linux asegúrate de que el usuario del servidor (www-data o apache) tenga permisos de escritura en `public/img/`.

Uso básico
- Abrir catálogo: `http://localhost/eventosyekari/proyecto0/vista/catalogo.php` (ajusta según tu ruta)
- Agregar al carrito desde el catálogo.
- Para completar el pago (simulado) debes iniciar sesión como cliente (registro/inicio de sesión desde la UI).
- El panel admin está en `vista/dashboard_admin.php` (requiere login de administrador).

Sesiones y claves importantes
- Sesiones usadas en el proyecto:
	- Admin: `$_SESSION['Identificacion']`, `$_SESSION['Nombre']`, `$_SESSION['Apellido']`, `$_SESSION['role']='admin'`
	- Cliente: `$_SESSION['ClienteIdentificacion']`, `$_SESSION['ClienteNombre']`, `$_SESSION['ClienteApellido']`, `$_SESSION['role']='cliente'`
	- Carrito: `$_SESSION['carrito']` (array con items: id, titulo, precio, cantidad)

Notas de seguridad y producción
- Actualmente el sistema hace comparaciones de contraseñas en texto plano en algunos puntos (su diseño y pruebas previas). Para producción, es obligatorio:
	- Almacenar contraseñas con `password_hash()` y verificar con `password_verify()`.
	- Proteger el acceso a controladores con CSRF tokens en formularios.
	- Validar y sanitizar todas las entradas del usuario.

Problemas comunes y solución rápida
- Página en blanco al enviar formularios: comprueba los logs de PHP/Apache para ver errores (por ejemplo `C:\xampp\apache\logs\error.log`).
- Redirecciones incorrectas: muchos controladores aceptan un campo `redirect` en POST para devolver al fragmento/URL deseada. Añade `redirect` en formularios si es necesario.
- Subida de imágenes no funciona: verifica que `public/img/` exista y tenga permiso de escritura.
- Campos nuevos en `ordenes`: ejecuta la migración `db/migrations/add_ordenes_fields.sql` antes de probar el checkout que envía `direccion`, `telefono`, `fecha_evento`, `hora_evento`.

Desarrollo y pruebas
- Para desarrollo rápido usa XAMPP y phpMyAdmin:
	- Inicia Apache y MySQL.
	- Importa la estructura de la base de datos y datos iniciales si existen.
	- Abre la URL del proyecto y prueba los flujos: catálogo → carrito → registro/login → checkout (simulado).

Cómo contribuir / próximos pasos sugeridos
- Migrar todas las comparaciones de contraseñas a `password_hash`/`password_verify`.
- Añadir validación del lado del servidor y manejar mejor los mensajes de error (flash messages en la UI).
- Añadir tests básicos (scripts PHP / PHPUnit) para los controladores principales.

Contacto
- Si necesitas que ajuste la configuración inicial (DB, migraciones o permisos), dime qué entorno usas y lo preparo.

---
Generado: instrucciones básicas para iniciar y probar el proyecto en desarrollo local (XAMPP). Si quieres, puedo añadir un script .sql de creación de tablas o un small checklist automatizado para verificar que tu entorno está listo.