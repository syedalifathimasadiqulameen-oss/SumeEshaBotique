<%@ page import="java.io.File" %>
<%@ page import="java.util.*" %>
<html>
<head>
  <title>Pattu Pavadai Gallery</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background: #f9f9f9;
    }
    header {
      background: #333;
      color: #fff;
      padding: 15px;
      text-align: center;
      font-size: 24px;
      font-weight: bold;
      position: relative;
    }
    header button {
      position: absolute;
      left: 15px;
      top: 15px;
      padding: 8px 15px;
      font-size: 14px;
      background: #ff9800;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      color: #fff;
    }
    header button:hover {
      background: #e68900;
    }
    h1 {
      text-align: center;
      margin: 20px 0;
    }
    .gallery {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
      gap: 15px;
      padding: 20px;
    }
    .item img {
      width: 100%;
      height: 200px;
      object-fit: cover;
      border-radius: 8px;
      cursor: pointer;
      transition: transform 0.3s ease;
    }

    /* Modal styles */
    .modal {
      display: none;
      position: fixed;
      z-index: 999;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background: rgba(0,0,0,0.8);
      text-align: center;
    }
    .modal-content {
      margin: 5% auto;
      display: block;
      max-width: 90%;
      max-height: 80%;
      object-fit: contain;
      border-radius: 8px;
    }
    .close {
      position: absolute;
      top: 20px;
      right: 35px;
      color: #fff;
      font-size: 40px;
      font-weight: bold;
      cursor: pointer;
    }

    footer {
      margin-top: 30px;
      padding: 15px;
      background: #333;
      color: #fff;
      text-align: center;
    }
    footer button {
      padding: 10px 20px;
      font-size: 16px;
      font-weight: bold;
      background: #ff9800;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      color: #fff;
    }
    footer button:hover {
      background: #e68900;
    }
  </style>
</head>
<body>
  <!-- Header with Back Button -->
  <header>
    <button onclick="history.back()">Back</button>
    SumeEsha Boutique (Pattu Pavadai Collection)
  </header>

  <h1>Blouses Gallery</h1>
  <div class="gallery">
    <%
      // Point to the correct folder
      String path = application.getRealPath("/images/Blouse");
      File folder = new File(path);
      File[] files = folder.listFiles();

      if (files != null) {
        for (File file : files) {
          if (file.isFile() && (file.getName().endsWith(".jpg") || file.getName().endsWith(".jpeg") || file.getName().endsWith(".png"))) {
    %>
          <div class="item">
            <!-- Match the folder name here -->
            <img src="images/Blouse/<%= file.getName() %>" alt="<%= file.getName() %>" onclick="openModal(this)">
          </div>
    <%
          }
        }
      }
    %>
  </div>

  <!-- Modal -->
  <div id="myModal" class="modal">
    <span class="close" onclick="closeModal()">&times;</span>
    <img class="modal-content" id="modalImage">
  </div>

  <!-- Footer -->
  <footer>
    <button onclick="startSlideshow()">Slide Show</button>
    <p>&copy; 2026 SumeEsha Stitches. All rights reserved.</p>
  </footer>

  <script>
    let modal = document.getElementById("myModal");
    let modalImg = document.getElementById("modalImage");
    let slideshowInterval;
    let images = [];
    let currentIndex = 0;

    function openModal(imgElement) {
      modal.style.display = "block";
      modalImg.src = imgElement.src;
    }

    function closeModal() {
      modal.style.display = "none";
      clearInterval(slideshowInterval);
    }

    function startSlideshow() {
      images = Array.from(document.querySelectorAll(".gallery img"));
      if (images.length === 0) return;

      currentIndex = 0;
      modal.style.display = "block";
      modalImg.src = images[currentIndex].src;

      slideshowInterval = setInterval(() => {
        currentIndex = (currentIndex + 1) % images.length;
        modalImg.src = images[currentIndex].src;
      }, 5000);
    }
  </script>
</body>
</html>
