# ✅ Código Subido a GitHub

Tu proyecto ya está en: **https://github.com/Juan789v-F/juancopiadeutcexpres**

---

## 🚀 Siguiente Paso: Desplegar en Railway

### Paso 1: Ir a Railway
Ve a: **https://railway.app**

### Paso 2: Iniciar sesión
- Click en "Login"
- Selecciona "Login with GitHub"
- Autoriza Railway

### Paso 3: Crear nuevo proyecto
1. Click en "New Project"
2. Selecciona "Deploy from GitHub repo"
3. Busca y selecciona: **juancopiadeutcexpres**
4. Click en "Deploy Now"

### Paso 4: Configurar variables de entorno
1. Espera a que termine el primer deploy (puede fallar, es normal)
2. Click en tu proyecto
3. Ve a la pestaña "Variables"
4. Click en "Raw Editor"
5. Pega esto:

```env
APP_NAME=XpressUTC
APP_ENV=production
APP_DEBUG=false
APP_URL=${{RAILWAY_PUBLIC_DOMAIN}}
DB_CONNECTION=sqlite
SESSION_DRIVER=database
CACHE_STORE=database
QUEUE_CONNECTION=database
LOG_LEVEL=error
```

6. Click en "Add" o "Update"

### Paso 5: Generar APP_KEY
1. En la misma sección de "Variables"
2. Agrega una nueva variable:
   - **Name:** `APP_KEY`
   - **Value:** Genera una key ejecutando localmente: `php artisan key:generate --show`
   - O usa esta temporal: `base64:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX`

3. Railway redesplegará automáticamente

### Paso 6: Configurar dominio público
1. Ve a "Settings"
2. Busca "Networking"
3. Click en "Generate Domain"
4. Railway te dará una URL como: `https://juancopiadeutcexpres-production.up.railway.app`

### Paso 7: ¡Visita tu sitio!
Abre la URL que te dio Railway y verás tu aplicación funcionando 🎉

---

## 📱 Vistas disponibles en tu sitio:

- `https://tu-url.railway.app/` - Inicio
- `https://tu-url.railway.app/menu` - Menú de productos
- `https://tu-url.railway.app/login` - Login
- `https://tu-url.railway.app/register` - Registro
- `https://tu-url.railway.app/cart` - Carrito
- `https://tu-url.railway.app/checkout` - Checkout
- `https://tu-url.railway.app/profile` - Perfil
- `https://tu-url.railway.app/orders` - Pedidos
- `https://tu-url.railway.app/dashboard` - Dashboard
- `https://tu-url.railway.app/contact` - Contacto

---

## 🔧 Si algo falla:

### Ver logs:
1. En Railway, ve a "Deployments"
2. Click en el último deploy
3. Click en "View Logs"

### Errores comunes:

**Error: "APP_KEY not set"**
- Solución: Agrega la variable `APP_KEY` como se indica arriba

**Error: "Storage not writable"**
- Solución: Ya está configurado en el `Procfile`, solo redespliega

**Error: "Database not found"**
- Solución: Verifica que `DB_CONNECTION=sqlite` esté en las variables

### Redesplegar manualmente:
1. Ve a "Deployments"
2. Click en los 3 puntos del último deploy
3. Click en "Redeploy"

---

## 💰 Costos

Railway ofrece **$5 USD gratis al mes** para nuevos usuarios.
Es suficiente para desarrollo y pruebas.

---

## 🎯 Resumen:

1. ✅ Código ya está en GitHub
2. Ve a railway.app
3. Conecta tu repositorio
4. Configura variables de entorno
5. Genera dominio público
6. ¡Listo!

**Tiempo estimado:** 5-10 minutos ⏱️

---

## 📞 ¿Necesitas ayuda?

Si tienes problemas, revisa los logs en Railway o consulta la documentación completa en `DEPLOY-RAILWAY.md`
