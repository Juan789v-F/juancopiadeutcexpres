# Script simple de configuración
Write-Host "=== Setup Simple XpressUTC ===" -ForegroundColor Green

# Instalar dependencias
Write-Host "`nInstalando dependencias de Composer..." -ForegroundColor Yellow
composer install

# Generar APP_KEY
Write-Host "`nGenerando APP_KEY..." -ForegroundColor Yellow
php artisan key:generate

# Crear base de datos SQLite
Write-Host "`nCreando base de datos..." -ForegroundColor Yellow
New-Item -Path "database/database.sqlite" -ItemType File -Force

# Ejecutar migraciones
Write-Host "`nEjecutando migraciones..." -ForegroundColor Yellow
php artisan migrate

# Storage link
Write-Host "`nCreando storage link..." -ForegroundColor Yellow
php artisan storage:link

# Instalar Node
Write-Host "`nInstalando dependencias de Node..." -ForegroundColor Yellow
npm install

Write-Host "`n=== Listo! ===" -ForegroundColor Green
Write-Host "Ejecuta: php artisan serve" -ForegroundColor Cyan
Write-Host "Y en otra terminal: npm run dev" -ForegroundColor Cyan
