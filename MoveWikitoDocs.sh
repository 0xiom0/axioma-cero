# Configurar GitHub Pages desde la raíz
# Mover el contenido de wiki a docs
mv wiki docs/wiki

# Crear un index.html en docs que redirija a la wiki
cat > docs/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="0; url=./wiki/">
    <title>Redirigiendo...</title>
</head>
<body>
    <p>Redirigiendo a <a href="./wiki/">Axioma Cero Wiki</a>...</p>
</body>
</html>
EOF

# Commit los cambios
git add -A
git commit -m "Reorganizar estructura para GitHub Pages"
git push

# Configurar GitHub Pages desde /docs
gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /repos/0xiom0/axioma-cero/pages \
  -f source[branch]=main \
  -f source[path]=/docs