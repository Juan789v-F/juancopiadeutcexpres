# Script para preparar y subir a Railway
Write-Host "=== Preparando proyecto para Railway ===" -ForegroundColor Green

# 1. Inicializar Git si no existe
if (-not (Test-Path ".git")) {
    Write-Host "`n1. Inicializando Git..." -ForegroundColor Yellow
    git init
    git branch -M main
} else {
    Write-Host "`n1. Git ya está inicializado" -ForegroundColor Green
}

# 2. Crear .gitignore si no existe
if (-not (Test-Path ".gitignore")) {
    Write-Host "`n2. Creando .gitignore..." -ForegroundColor Yellow
    @"
/node_modules
/public/hot
/public/storage
/storage/*.key
/vendor
.env
.env.backup
.env.production
.phpunit.result.cache
Homestead.json
Homestead.yaml
auth.json
npm-debug.log
yarn-error.log
/.fleet
/.idea
/.vscode
"@ | Out-File -FilePath ".gitignore" -Encoding utf8
}

# 3. Agregar archivos a Git
Write-Host "`n3. Agregando archivos a Git..." -ForegroundColor Yellow
git add .

# 4. Hacer commit
Write-Host "`n4. Haciendo commit..." -ForegroundColor Yellow
git commit -m "Preparado para deploy en Railway"

Write-Host "`n=== Proyecto preparado ===" -ForegroundColor Green
Write-Host "`nAhora tienes 2 opciones:" -ForegroundColor Cyan
Write-Host "`nOpción 1 - Subir a GitHub primero:" -ForegroundColor Yellow
Write-Host "1. Crea un repositorio en GitHub" -ForegroundColor White
Write-Host "2. Ejecuta estos comandos:" -ForegroundColor White
Write-Host "   git remote add origin https://github.com/tu-usuario/tu-repo.git" -ForegroundColor Gray
Write-Host "   git push -u origin main" -ForegroundColor Gray
Write-Host "3. Ve a railway.app y conecta tu repositorio de GitHub" -ForegroundColor White
Write-Host "`nOpción 2 - Usar Railway CLI:" -ForegroundColor Yellow
Write-Host "1. Instala Railway CLI: npm install -g @railway/cli" -ForegroundColor White
Write-Host "2. Ejecuta: railway login" -ForegroundColor White
Write-Host "3. Ejecuta: railway init" -ForegroundColor White
Write-Host "4. Ejecuta: railway up" -ForegroundColor White
Write-Host "`nLee DEPLOY-RAILWAY.md para más detalles" -ForegroundColor Cyan
