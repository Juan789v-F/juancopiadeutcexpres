# Script de configuración para Laravel con Herd
Write-Host "=== Configurando XpressUTC con Laravel Herd ===" -ForegroundColor Green

# 1. Verificar PHP y Composer
Write-Host "`n1. Verificando PHP y Composer..." -ForegroundColor Yellow
php -v
composer -v

# 2. Instalar dependencias de PHP
Write-Host "`n2. Instalando dependencias de Composer..." -ForegroundColor Yellow
composer install --no-interaction

# 3. Copiar archivo .env si no existe
if (-not (Test-Path ".env")) {
    Write-Host "`n3. Copiando archivo .env..." -ForegroundColor Yellow
    Copy-Item ".env.example" ".env"
} else {
    Write-Host "`n3. Archivo .env ya existe" -ForegroundColor Green
}

# 4. Generar APP_KEY
Write-Host "`n4. Generando APP_KEY..." -ForegroundColor Yellow
php artisan key:generate

# 5. Crear base de datos SQLite (más fácil que MySQL para desarrollo)
Write-Host "`n5. Configurando base de datos..." -ForegroundColor Yellow
if (-not (Test-Path "database/database.sqlite")) {
    New-Item -Path "database/database.sqlite" -ItemType File -Force
    Write-Host "Base de datos SQLite creada" -ForegroundColor Green
}

# Actualizar .env para usar SQLite
(Get-Content .env) -replace 'DB_CONNECTION=mysql', 'DB_CONNECTION=sqlite' | Set-Content .env
(Get-Content .env) -replace 'DB_HOST=.*', '# DB_HOST=127.0.0.1' | Set-Content .env
(Get-Content .env) -replace 'DB_PORT=.*', '# DB_PORT=3306' | Set-Content .env
(Get-Content .env) -replace 'DB_DATABASE=.*', '# DB_DATABASE=xpressutc' | Set-Content .env
(Get-Content .env) -replace 'DB_USERNAME=.*', '# DB_USERNAME=root' | Set-Content .env
(Get-Content .env) -replace 'DB_PASSWORD=.*', '# DB_PASSWORD=' | Set-Content .env

# 6. Ejecutar migraciones
Write-Host "`n6. Ejecutando migraciones..." -ForegroundColor Yellow
php artisan migrate --force

# 7. Crear enlace simbólico para storage
Write-Host "`n7. Creando enlace simbólico para storage..." -ForegroundColor Yellow
php artisan storage:link

# 8. Dar permisos a carpetas
Write-Host "`n8. Configurando permisos..." -ForegroundColor Yellow
if (Test-Path "storage") {
    attrib -r "storage\*" /s
}
if (Test-Path "bootstrap\cache") {
    attrib -r "bootstrap\cache\*" /s
}

# 9. Instalar dependencias de Node
Write-Host "`n9. Instalando dependencias de Node..." -ForegroundColor Yellow
npm install

# 10. Agregar sitio a Herd
Write-Host "`n10. Agregando sitio a Herd..." -ForegroundColor Yellow
herd link

Write-Host "`n=== Configuración completada ===" -ForegroundColor Green
Write-Host "`nPara iniciar el servidor de desarrollo:" -ForegroundColor Cyan
Write-Host "1. Abre una terminal y ejecuta: npm run dev" -ForegroundColor White
Write-Host "2. Abre tu navegador en: http://byteados_hackaton-master.test" -ForegroundColor White
Write-Host "`nO usa el servidor de Laravel:" -ForegroundColor Cyan
Write-Host "php artisan serve" -ForegroundColor White
Write-Host "Y abre: http://localhost:8000" -ForegroundColor White
