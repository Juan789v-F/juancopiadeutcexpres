# Script de configuración inicial para Docker
Write-Host "🚀 Iniciando configuración de XpressUTC con Docker..." -ForegroundColor Green

# Verificar que Docker esté corriendo
Write-Host "`n📦 Verificando Docker..." -ForegroundColor Cyan
docker --version
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Docker no está instalado o no está corriendo" -ForegroundColor Red
    exit 1
}

# Construir contenedores
Write-Host "`n🔨 Construyendo contenedores Docker..." -ForegroundColor Cyan
docker-compose build

# Levantar contenedores
Write-Host "`n🚀 Levantando contenedores..." -ForegroundColor Cyan
docker-compose up -d

# Esperar a que los contenedores estén listos
Write-Host "`n⏳ Esperando a que los contenedores estén listos..." -ForegroundColor Cyan
Start-Sleep -Seconds 10

# Instalar dependencias de Composer
Write-Host "`n📦 Instalando dependencias de PHP (Composer)..." -ForegroundColor Cyan
docker-compose exec -T app composer install

# Generar clave de aplicación
Write-Host "`n🔑 Generando clave de aplicación..." -ForegroundColor Cyan
docker-compose exec -T app php artisan key:generate

# Ejecutar migraciones
Write-Host "`n🗄️  Ejecutando migraciones de base de datos..." -ForegroundColor Cyan
docker-compose exec -T app php artisan migrate --force

# Crear enlace simbólico para storage
Write-Host "`n🔗 Creando enlace simbólico para storage..." -ForegroundColor Cyan
docker-compose exec -T app php artisan storage:link

# Dar permisos a directorios
Write-Host "`n🔐 Configurando permisos..." -ForegroundColor Cyan
docker-compose exec -T app chmod -R 775 storage bootstrap/cache

Write-Host "`n✅ ¡Configuración completada!" -ForegroundColor Green
Write-Host "`n📱 La aplicación está disponible en:" -ForegroundColor Cyan
Write-Host "   🌐 Frontend: http://localhost:8000" -ForegroundColor Yellow
Write-Host "   🔧 Vite Dev Server: http://localhost:5173" -ForegroundColor Yellow
Write-Host "`n📝 Comandos útiles:" -ForegroundColor Cyan
Write-Host "   Ver logs:           docker-compose logs -f" -ForegroundColor White
Write-Host "   Detener:            docker-compose down" -ForegroundColor White
Write-Host "   Reiniciar:          docker-compose restart" -ForegroundColor White
Write-Host "   Ejecutar comandos:  docker-compose exec app php artisan [comando]" -ForegroundColor White
