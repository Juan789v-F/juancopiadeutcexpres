# 🐳 XpressUTC - Guía de Docker

## 📋 Requisitos Previos

- **Docker Desktop** instalado y corriendo
- **Git** (opcional, para clonar el repositorio)

## 🚀 Inicio Rápido

### Opción 1: Script Automático (Recomendado)

```powershell
# Ejecutar el script de configuración
.\docker-setup.ps1
```

### Opción 2: Manual

```powershell
# 1. Construir los contenedores
docker-compose build

# 2. Levantar los contenedores
docker-compose up -d

# 3. Instalar dependencias de PHP
docker-compose exec app composer install

# 4. Generar clave de aplicación
docker-compose exec app php artisan key:generate

# 5. Ejecutar migraciones
docker-compose exec app php artisan migrate

# 6. Crear enlace simbólico para storage
docker-compose exec app php artisan storage:link

# 7. Dar permisos
docker-compose exec app chmod -R 775 storage bootstrap/cache
```

## 🌐 Acceder a la Aplicación

Una vez levantado, abre tu navegador en:

- **Frontend**: http://localhost:8000
- **Vite Dev Server**: http://localhost:5173
- **Base de datos MySQL**: localhost:3306

## 📦 Servicios Incluidos

| Servicio | Puerto | Descripción |
|----------|--------|-------------|
| nginx | 8000 | Servidor web |
| app | 9000 | PHP-FPM (Laravel) |
| db | 3306 | MySQL 8.0 |
| node | 5173 | Vite dev server |

## 🛠️ Comandos Útiles

### Gestión de Contenedores

```powershell
# Ver logs en tiempo real
docker-compose logs -f

# Ver logs de un servicio específico
docker-compose logs -f app
docker-compose logs -f nginx

# Detener contenedores
docker-compose down

# Detener y eliminar volúmenes (⚠️ elimina la base de datos)
docker-compose down -v

# Reiniciar contenedores
docker-compose restart

# Reiniciar un servicio específico
docker-compose restart app
```

### Comandos de Laravel

```powershell
# Ejecutar comandos artisan
docker-compose exec app php artisan [comando]

# Ejemplos:
docker-compose exec app php artisan migrate
docker-compose exec app php artisan db:seed
docker-compose exec app php artisan cache:clear
docker-compose exec app php artisan config:clear
docker-compose exec app php artisan route:list
docker-compose exec app php artisan tinker
```

### Comandos de Composer

```powershell
# Instalar dependencias
docker-compose exec app composer install

# Actualizar dependencias
docker-compose exec app composer update

# Instalar paquete específico
docker-compose exec app composer require [paquete]
```

### Comandos de NPM

```powershell
# Instalar dependencias (ya se ejecuta automáticamente)
docker-compose exec node npm install

# Compilar assets para producción
docker-compose exec node npm run build

# Ver logs de Vite
docker-compose logs -f node
```

### Base de Datos

```powershell
# Acceder a MySQL
docker-compose exec db mysql -u xpressutc_user -psecret xpressutc

# Backup de base de datos
docker-compose exec db mysqldump -u xpressutc_user -psecret xpressutc > backup.sql

# Restaurar base de datos
docker-compose exec -T db mysql -u xpressutc_user -psecret xpressutc < backup.sql
```

## 🔧 Configuración

### Variables de Entorno

El archivo `.env` ya está configurado para Docker. Las credenciales por defecto son:

```env
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=xpressutc
DB_USERNAME=xpressutc_user
DB_PASSWORD=secret
```

### Cambiar Puertos

Si los puertos 8000 o 5173 están ocupados, edita `docker-compose.yml`:

```yaml
nginx:
  ports:
    - "8080:80"  # Cambiar 8000 por 8080

node:
  ports:
    - "5174:5173"  # Cambiar 5173 por 5174
```

## 🐛 Solución de Problemas

### Error: Puerto ya en uso

```powershell
# Ver qué está usando el puerto
netstat -ano | findstr :8000

# Detener el proceso o cambiar el puerto en docker-compose.yml
```

### Error: Permisos en storage/

```powershell
docker-compose exec app chmod -R 775 storage bootstrap/cache
docker-compose exec app chown -R www:www storage bootstrap/cache
```

### Error: No se puede conectar a la base de datos

```powershell
# Verificar que el contenedor de MySQL esté corriendo
docker-compose ps

# Ver logs de MySQL
docker-compose logs db

# Reiniciar el contenedor de base de datos
docker-compose restart db
```

### Limpiar y Empezar de Nuevo

```powershell
# Detener y eliminar todo
docker-compose down -v

# Eliminar imágenes
docker-compose down --rmi all

# Volver a construir
docker-compose build --no-cache
docker-compose up -d
```

## 📝 Notas Importantes

1. **Primera vez**: El script `docker-setup.ps1` configura todo automáticamente
2. **Hot Reload**: Vite detecta cambios automáticamente en archivos `.jsx`, `.css`
3. **Base de datos**: Los datos persisten en un volumen Docker (`dbdata`)
4. **Logs**: Usa `docker-compose logs -f` para debugging

## 🎯 Flujo de Desarrollo

```powershell
# 1. Levantar contenedores
docker-compose up -d

# 2. Ver logs (opcional)
docker-compose logs -f

# 3. Hacer cambios en el código
# Los cambios se reflejan automáticamente

# 4. Ejecutar migraciones si es necesario
docker-compose exec app php artisan migrate

# 5. Al terminar, detener contenedores
docker-compose down
```

## 🆘 Ayuda

Si tienes problemas:

1. Verifica que Docker Desktop esté corriendo
2. Revisa los logs: `docker-compose logs -f`
3. Reinicia los contenedores: `docker-compose restart`
4. Limpia y reconstruye: `docker-compose down -v && docker-compose up -d --build`

---

**¡Listo para desarrollar! 🚀**
