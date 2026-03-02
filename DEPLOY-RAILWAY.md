# 🚀 Guía para Subir a Railway.app

## ✅ Paso 1: Preparar el proyecto

Ya está todo listo. Los archivos necesarios ya fueron creados:
- ✅ `railway.json` - Configuración de Railway
- ✅ `nixpacks.toml` - Configuración de build
- ✅ `Procfile` - Comando de inicio
- ✅ `.env.example` - Variables de entorno

## ✅ Paso 2: Crear cuenta en Railway

1. Ve a: **https://railway.app**
2. Haz clic en "Start a New Project"
3. Inicia sesión con GitHub (es gratis)

## ✅ Paso 3: Subir el proyecto

### Opción A: Desde GitHub (Recomendado)

1. Sube tu proyecto a GitHub:
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/tu-usuario/xpressutc.git
git push -u origin main
```

2. En Railway:
   - Click en "Deploy from GitHub repo"
   - Selecciona tu repositorio
   - Railway detectará automáticamente que es Laravel

### Opción B: Desde Railway CLI

1. Instala Railway CLI:
```bash
npm install -g @railway/cli
```

2. Inicia sesión:
```bash
railway login
```

3. Inicializa el proyecto:
```bash
railway init
```

4. Despliega:
```bash
railway up
```

## ✅ Paso 4: Configurar variables de entorno

En el dashboard de Railway, ve a "Variables" y agrega:

```env
APP_NAME=XpressUTC
APP_ENV=production
APP_KEY=base64:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
APP_DEBUG=false
APP_URL=https://tu-proyecto.up.railway.app

DB_CONNECTION=sqlite

SESSION_DRIVER=database
CACHE_STORE=database
QUEUE_CONNECTION=database

LOG_CHANNEL=stack
LOG_LEVEL=error
```

**IMPORTANTE:** Railway generará automáticamente el `APP_KEY` o puedes generarlo localmente con:
```bash
php artisan key:generate --show
```

## ✅ Paso 5: Agregar base de datos (Opcional)

Si quieres usar MySQL en lugar de SQLite:

1. En Railway, click en "New" → "Database" → "Add MySQL"
2. Railway creará automáticamente las variables:
   - `MYSQLHOST`
   - `MYSQLPORT`
   - `MYSQLDATABASE`
   - `MYSQLUSER`
   - `MYSQLPASSWORD`

3. Actualiza tus variables de entorno:
```env
DB_CONNECTION=mysql
DB_HOST=${MYSQLHOST}
DB_PORT=${MYSQLPORT}
DB_DATABASE=${MYSQLDATABASE}
DB_USERNAME=${MYSQLUSER}
DB_PASSWORD=${MYSQLPASSWORD}
```

## ✅ Paso 6: Verificar el deploy

1. Railway te dará una URL como: `https://xpressutc-production.up.railway.app`
2. Abre esa URL en tu navegador
3. ¡Deberías ver tu aplicación funcionando! 🎉

## 🔧 Solución de problemas

### Error: "APP_KEY not set"
Genera una key:
```bash
php artisan key:generate --show
```
Copia el resultado y agrégalo a las variables de entorno en Railway.

### Error: "Storage not writable"
Railway ya ejecuta `php artisan storage:link` automáticamente en el Procfile.

### Error: "Database not found"
Verifica que `DB_CONNECTION=sqlite` esté en las variables de entorno.

### Ver logs en tiempo real
En Railway dashboard, ve a "Deployments" → Click en el último deploy → "View Logs"

## 📱 Vistas que podrás ver en producción:

Una vez desplegado, podrás acceder a:
- `https://tu-app.railway.app/` - Inicio
- `https://tu-app.railway.app/menu` - Menú
- `https://tu-app.railway.app/login` - Login
- `https://tu-app.railway.app/register` - Registro
- Y todas las demás vistas...

## 💰 Costos

Railway ofrece:
- **$5 USD gratis al mes** para nuevos usuarios
- Suficiente para desarrollo y pruebas
- No necesitas tarjeta de crédito para empezar

## 🎯 Resumen rápido:

1. Crea cuenta en railway.app
2. Sube tu código a GitHub
3. Conecta GitHub con Railway
4. Configura variables de entorno
5. ¡Listo! Tu app estará en línea

---

## 🔄 Alternativa: Render.com

Si prefieres Render.com (también gratis):

1. Ve a: **https://render.com**
2. Crea cuenta con GitHub
3. "New" → "Web Service"
4. Conecta tu repositorio
5. Configuración:
   - **Build Command:** `composer install --optimize-autoloader --no-dev && npm ci && npm run build`
   - **Start Command:** `php artisan migrate --force && php artisan serve --host=0.0.0.0 --port=$PORT`
6. Agrega las mismas variables de entorno
7. Deploy

¡Eso es todo! 🚀
