<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>KYYS 🤍 ELIN — UHD</title>
<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500;700&display=swap" rel="stylesheet">
<style>
:root {
  --bg1: #08061a;
  --accent: #a783ff;
  --accent2: #c7b3ff;
  --text: #fff;
}
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
body {
  font-family: 'Orbitron', sans-serif;
  background: radial-gradient(circle at 50% 20%, #1a0f3b 0%, #08061a 100%);
  color: var(--text);
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  overflow-x: hidden;
}

/* INTRO */
.intro {
  position: fixed;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background: radial-gradient(circle at center, #1a0f3b, #08061a);
  z-index: 1000;
  font-size: 2.7rem;
  font-weight: 700;
  color: white;
  text-shadow: 0 0 15px rgba(255,255,255,0.6), 0 0 35px var(--accent);
  letter-spacing: 3px;
  animation: glowPulse 1.5s infinite alternate;
  transition: opacity 1s ease;
}
@keyframes glowPulse {
  from { text-shadow: 0 0 10px var(--accent2), 0 0 20px var(--accent); }
  to { text-shadow: 0 0 25px white, 0 0 40px var(--accent2); }
}
.intro.hide { opacity: 0; pointer-events: none; }

/* MAIN */
.container {
  width: 95%;
  max-width: 820px;
  margin-top: 30px;
  text-align: center;
}
.topbar {
  color: var(--accent);
  background: rgba(255,255,255,0.05);
  border-radius: 12px;
  font-size: 22px;
  font-weight: 700;
  padding: 10px;
  box-shadow: 0 6px 16px rgba(0,0,0,0.4);
}
.card {
  background: rgba(0,0,0,0.35);
  padding: 20px;
  border-radius: 16px;
  margin-top: 20px;
  box-shadow: 0 8px 32px rgba(0,0,0,0.6);
}
.upload-row {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 12px;
  margin: 10px 0;
}
.file-btn {
  background: linear-gradient(90deg, var(--accent), var(--accent2));
  color: #08102a;
  font-weight: 700;
  border: none;
  padding: 10px 18px;
  border-radius: 10px;
  cursor: pointer;
}
.file-name {
  font-size: 13px;
  color: rgba(255,255,255,0.6);
}
.enhance-btn, .download-btn {
  width: 90%;
  max-width: 500px;
  background: linear-gradient(90deg, var(--accent), var(--accent2));
  color: #08102a;
  font-weight: 800;
  padding: 14px;
  border: none;
  border-radius: 12px;
  font-family: 'Orbitron', sans-serif;
  letter-spacing: 3px;
  font-size: 17px;
  margin-top: 15px;
  cursor: pointer;
  box-shadow: 0 8px 32px rgba(100,120,255,0.25);
  transition: transform .15s;
}
.enhance-btn:active, .download-btn:active { transform: scale(.97); }

.preview {
  width: 100%;
  margin-top: 15px;
  display: none;
  position: relative;
}
.preview img {
  width: 100%;
  height: auto;
  border-radius: 10px;
  display: block;
  object-fit: contain;
  background: #000;
}
.preview-label {
  position: absolute;
  top: -28px;
  left: 0;
  right: 0;
  text-align: center;
  color: var(--accent2);
  font-size: 18px;
  letter-spacing: 2px;
  font-weight: 600;
  text-shadow: 0 0 6px var(--accent);
}

.hidden { display: none; }
</style>
</head>
<body>
  <div class="intro" id="intro">KYYS 🤍 ELIN</div>

  <audio id="bgMusic" autoplay>
    <source src="intro.mp3" type="audio/mpeg">
  </audio>

  <div class="container hidden" id="mainContent">
    <div class="topbar">KYYS 🤍 ELIN</div>

    <div class="card">
      <div class="upload-row">
        <label class="file-btn" for="fileInput">Pilih Foto</label>
        <input id="fileInput" type="file" accept="image/*" style="display:none;">
        <div class="file-name" id="fileName">Belum ada file</div>
      </div>
      <button id="enhanceBtn" class="enhance-btn">UHD</button>
      <button id="downloadBtn" class="download-btn hidden">DOWNLOAD</button>
    </div>

    <div class="preview" id="previewContainer">
      <div id="previewLabel" class="preview-label">BEFORE</div>
      <img id="beforeImg" src="" alt="Before" />
      <img id="afterImg" class="hidden" src="" alt="After" />
    </div>
  </div>

<script>
window.addEventListener('load', () => {
  const intro = document.getElementById('intro');
  const main = document.getElementById('mainContent');
  const music = document.getElementById('bgMusic');
  music.loop = true;
  music.play().catch(()=>{});
  setTimeout(() => {
    intro.classList.add('hide');
    setTimeout(() => {
      intro.remove();
      main.classList.remove('hidden');
    }, 800);
  }, 3000);
});

const fileInput = document.getElementById('fileInput');
const fileName = document.getElementById('fileName');
const beforeImg = document.getElementById('beforeImg');
const afterImg = document.getElementById('afterImg');
const previewContainer = document.getElementById('previewContainer');
const enhanceBtn = document.getElementById('enhanceBtn');
const downloadBtn = document.getElementById('downloadBtn');
const previewLabel = document.getElementById('previewLabel');

let currentSrc = null;

fileInput.addEventListener('change', e => {
  const file = e.target.files[0];
  if (!file) return;
  fileName.textContent = file.name;
  currentSrc = URL.createObjectURL(file);
  beforeImg.src = currentSrc;
  previewContainer.style.display = 'block';
  beforeImg.classList.remove('hidden');
  afterImg.classList.add('hidden');
  previewLabel.textContent = "BEFORE";
});

enhanceBtn.addEventListener('click', () => {
  if (!currentSrc) {
    alert('Upload foto dulu ya 🤍');
    return;
  }
  // simulasi proses UHD
  setTimeout(() => {
    afterImg.src = currentSrc;
    beforeImg.classList.add('hidden');
    afterImg.classList.remove('hidden');
    previewLabel.textContent = "AFTER";
    downloadBtn.classList.remove('hidden');
  }, 1200);
});

downloadBtn.addEventListener('click', () => {
  const link = document.createElement('a');
  link.href = afterImg.src;
  link.download = 'kyys_elin_result.png';
  link.click();
});
</script>
</body>
        </html>
