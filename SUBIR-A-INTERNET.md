# 🌐 Cómo Subir tu Proyecto a Internet (SUPER FÁCIL)

## 🎯 Opción más fácil: Railway.app

### Paso 1: Preparar el proyecto
Ejecuta en la terminal:
```powershell
.\deploy-railway.ps1
```

### Paso 2: Crear cuenta en Railway
1. Ve a: **https://railway.app**
2. Click en "Login" → "Login with GitHub"
3. Autoriza Railway

### Paso 3: Crear repositorio en GitHub
1. Ve a: **https://github.com/new**
2. Nombre del repositorio: `xpressutc`
3. Click en "Create repository"
4. Copia la URL que te da (algo como: `https://github.com/tu-usuario/xpressutc.git`)

### Paso 4: Subir código a GitHub
En la terminal, ejecuta (reemplaza con tu URL):
```bash
git remote add origin https://github.com/TU-USUARIO/xpressutc.git
git push -u origin main
```

### Paso 5: Conectar Railway con GitHub
1. En Railway, click en "New Project"
2. Click en "Deploy from GitHub repo"
3. Selecciona tu repositorio `xpressutc`
4. Railway empezará a construir automáticamente

### Paso 6: Configurar variables de entorno
1. En Railway, click en tu proyecto
2. Ve a la pestaña "Variables"
3. Click en "Raw Editor"
4. Pega esto:
```env
APP_NAME=XpressUTC
APP_ENV=production
APP_DEBUG=false
DB_CONNECTION=sqlite
SESSION_DRIVER=database
CACHE_STORE=database
LOG_LEVEL=error
```

5. Click en "Add" o "Update"

### Paso 7: Generar APP_KEY
1. En Railway, ve a "Settings"
2. Busca "Custom Start Command"
3. Agrega:
```bash
php artisan key:generate --force && php artisan migrate --force && php artisan storage:link && php artisan serve --host=0.0.0.0 --port=$PORT
```

O simplemente agrega en Variables:
```env
APP_KEY=base64:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```
(Genera la key localmente con: `php artisan key:generate --show`)

### Paso 8: ¡Ver tu sitio en vivo!
1. Railway te dará una URL como: `https://xpressutc-production.up.railway.app`
2. Click en esa URL
3. ¡Tu sitio está en línea! 🎉

---

## 🚀 Opción alternativa: Render.com

### Más simple pero más lento:

1. Ve a: **https://render.com**
2. Crea cuenta con GitHub
3. Click en "New +" → "Web Service"
4. Conecta tu repositorio de GitHub
5. Configuración:
   - **Name:** xpressutc
   - **Build Command:** 
   ```bash
   composer install --no-dev && npm ci && npm run build
   ```
   - **Start Command:**
   ```bash
   php artisan key:generate --force && php artisan migrate --force && php artisan serve --host=0.0.0.0 --port=$PORT
   ```
6. En "Environment Variables" agrega:
   ```
   APP_ENV=production
   DB_CONNECTION=sqlite
   ```
7. Click en "Create Web Service"
8. Espera 5-10 minutos
9. ¡Listo!

---

## 📱 ¿Qué podrás ver en línea?

Todas las vistas del frontend:
- ✅ Página de inicio
- ✅ Menú de productos
- ✅ Carrito de compras
- ✅ Login y registro
- ✅ Perfil de usuario
- ✅ Historial de pedidos
- ✅ Y más...

---

## 💰 ¿Cuánto cuesta?

**Railway:** $5 USD gratis al mes (sin tarjeta)
**Render:** Plan gratuito permanente (más lento)

---

## 🎯 Resumen ultra rápido:

1. Ejecuta: `.\deploy-railway.ps1`
2. Sube a GitHub
3. Conecta Railway con GitHub
4. Configura variables de entorno
5. ¡Tu sitio está en línea!

**Tiempo total:** 10-15 minutos ⏱️

---

## ❓ ¿Necesitas ayuda?

Lee el archivo `DEPLOY-RAILWAY.md` para más detalles y solución de problemas.
