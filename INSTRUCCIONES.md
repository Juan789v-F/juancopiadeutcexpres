# 🚀 Instrucciones para ver el Frontend funcionando

## ✅ Paso 1: Reiniciar Kiro
**MUY IMPORTANTE:** Cierra completamente Kiro y vuelve a abrirlo para que reconozca Laravel Herd.

## ✅ Paso 2: Ejecutar el setup
Después de reiniciar Kiro, abre una terminal y ejecuta:

```powershell
.\setup-simple.ps1
```

**Si te da error de permisos**, ejecuta primero:
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

Y luego:
```powershell
.\setup-simple.ps1
```

## ✅ Paso 3: Iniciar los servidores

### Terminal 1 - Servidor Laravel:
```bash
php artisan serve
```

### Terminal 2 - Servidor Vite (Frontend):
```bash
npm run dev
```

## ✅ Paso 4: Abrir en el navegador
Abre tu navegador en: **http://localhost:8000**

---

## 📱 Vistas disponibles para probar:

### Públicas (sin login):
- `http://localhost:8000/` - Inicio
- `http://localhost:8000/menu` - Menú de productos
- `http://localhost:8000/contact` - Contacto
- `http://localhost:8000/login` - Login
- `http://localhost:8000/register` - Registro

### Requieren autenticación:
- `http://localhost:8000/cart` - Carrito
- `http://localhost:8000/checkout` - Checkout
- `http://localhost:8000/profile` - Perfil
- `http://localhost:8000/orders` - Pedidos
- `http://localhost:8000/dashboard` - Dashboard

---

## 🔧 Si algo falla:

### Problema: "php no se reconoce"
**Solución:** Reinicia Kiro completamente.

### Problema: Error de base de datos
**Solución:** 
```bash
php artisan migrate:fresh
```

### Problema: Error de permisos en storage
**Solución:**
```bash
php artisan cache:clear
php artisan config:clear
```

### Problema: Vite no conecta
**Solución:** Verifica que el puerto 5173 esté libre y ejecuta:
```bash
npm run dev -- --host
```

---

## 📝 Comandos útiles:

```bash
# Ver todas las rutas
php artisan route:list

# Limpiar todo el caché
php artisan optimize:clear

# Ver logs en tiempo real
php artisan tail

# Crear usuario de prueba (si existe seeder)
php artisan db:seed
```

---

## 🎯 Resumen rápido:
1. Reinicia Kiro
2. Ejecuta `.\setup-simple.ps1`
3. Ejecuta `php artisan serve`
4. En otra terminal: `npm run dev`
5. Abre `http://localhost:8000`

¡Listo! 🎉
