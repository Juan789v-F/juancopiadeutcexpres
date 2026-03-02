# Guía de Configuración con Laravel Herd

## Paso 1: Reiniciar Kiro
**IMPORTANTE:** Cierra y vuelve a abrir Kiro para que reconozca Herd en el PATH.

## Paso 2: Ejecutar el script de setup
Abre una terminal en Kiro y ejecuta:

```powershell
.\setup-herd.ps1
```

Si te da error de permisos, ejecuta primero:
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\setup-herd.ps1
```

## Paso 3: Iniciar el servidor de desarrollo

### Opción A: Usar Herd (Recomendado)
El script ya configuró el sitio en Herd. Solo necesitas:

1. Abrir una terminal y ejecutar:
```bash
npm run dev
```

2. Abrir tu navegador en:
```
http://byteados_hackaton-master.test
```

### Opción B: Usar servidor de Laravel
1. En una terminal ejecuta:
```bash
php artisan serve
```

2. En otra terminal ejecuta:
```bash
npm run dev
```

3. Abre tu navegador en:
```
http://localhost:8000
```

## Vistas disponibles

Una vez que el servidor esté corriendo, podrás acceder a:

### Vistas públicas:
- `/` - Página de inicio
- `/menu` - Menú de productos
- `/cart` - Carrito de compras
- `/checkout` - Proceso de pago
- `/contact` - Contacto

### Vistas de autenticación:
- `/login` - Iniciar sesión
- `/register` - Registro de usuario

### Vistas de usuario autenticado:
- `/profile` - Perfil de usuario
- `/orders` - Historial de pedidos
- `/dashboard` - Panel de usuario

## Solución de problemas

### Si PHP no se reconoce:
Reinicia Kiro o ejecuta:
```powershell
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
```

### Si hay errores de base de datos:
El script usa SQLite por defecto (más fácil). Si prefieres MySQL:
1. Abre Herd
2. Inicia el servicio de MySQL
3. Edita el archivo `.env` y cambia `DB_CONNECTION=sqlite` a `DB_CONNECTION=mysql`
4. Ejecuta: `php artisan migrate:fresh`

### Si hay errores de permisos:
```powershell
php artisan cache:clear
php artisan config:clear
php artisan view:clear
```

## Comandos útiles

```bash
# Ver todas las rutas disponibles
php artisan route:list

# Limpiar caché
php artisan optimize:clear

# Crear un usuario admin (si existe el seeder)
php artisan db:seed

# Ver logs en tiempo real
php artisan tail
```
