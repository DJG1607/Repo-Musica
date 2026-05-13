# Mi Reproductor de Música

Reproductor web local + PWA instalable en móvil.

## Cómo usar en local (PC)

**Opción rápida:** doble clic en `iniciar.bat`. Se abre el navegador en `http://localhost:8080`.

**Manual:**
- Con Node.js: `node server.js`
- Con Python: `python -m http.server 8080`

## Instalar en el móvil (PWA)

Necesitas que el reproductor esté servido por **HTTP/HTTPS**, no abierto directamente como archivo.

### Opción A — Misma red WiFi (rápido, sin internet)

1. En el PC, ejecuta `iniciar.bat`. La consola mostrará algo como `http://192.168.1.50:8080`.
2. En el móvil (misma WiFi), abre esa URL en **Chrome** (Android) o **Safari** (iPhone).
3. **Android (Chrome):** menú ⋮ → "Instalar aplicación" / "Añadir a pantalla principal".
4. **iPhone (Safari):** botón compartir ⎋ → "Añadir a pantalla de inicio".

Nota: la instalación PWA completa sólo aparece bajo HTTPS. Por HTTP de red local funciona pero algunos prompts no salen — usa "Añadir a pantalla de inicio" manualmente.

### Opción B — Subir a un servidor público (recomendado)

Cualquier hosting estático sirve. Gratis y fácil:

**GitHub Pages**
1. Crea un repo en GitHub, sube todos los archivos de esta carpeta.
2. Settings → Pages → Source: `main` branch → guardar.
3. URL: `https://tuusuario.github.io/turepo/`

**Netlify** (arrastrar y soltar)
1. Entra en https://app.netlify.com/drop
2. Arrastra esta carpeta entera.
3. Te dan una URL pública con HTTPS.

**Vercel**
1. https://vercel.com → "New Project" → sube la carpeta.

**Tu propio VPS / servidor**
- Copia los archivos a `/var/www/reproductor/`
- Configura Nginx o Apache para servir esa carpeta.
- Ejemplo Nginx mínimo:
  ```
  server {
    listen 443 ssl;
    server_name musica.tudominio.com;
    root /var/www/reproductor;
    index index.html;
  }
  ```

Una vez en HTTPS, abre la URL en el móvil y el navegador propondrá instalarla.

## Estructura de archivos

```
Reproductor/
├── index.html       Reproductor (UI + lógica)
├── manifest.json    Metadatos PWA
├── sw.js            Service worker (offline)
├── icon.svg         Icono
├── server.js        Servidor Node.js sin dependencias
├── iniciar.bat      Lanzador Windows
├── musica/          Carpeta opcional para tus MP3
└── README.md
```

## Notas

- **Música guardada:** las canciones descargadas o subidas se guardan en IndexedDB del navegador. Cada dispositivo tiene su propia biblioteca.
- **Offline:** el reproductor funciona sin internet una vez cargado. Las canciones de Internet Archive necesitan conexión para descargar.
- **Iconos PNG:** el manifiesto referencia `icon-192.png` e `icon-512.png` como opcionales. Si quieres iconos más nítidos en algunos sistemas, conviértelos desde `icon.svg` con cualquier herramienta online y colócalos junto al HTML.
