<html>
<head>
  <title>Upload Pattu Image</title>
</head>
<body>
  <h2>Upload Image to Pattu Folder</h2>
  <form action="${pageContext.request.contextPath}/UploadServlet" 
        method="post" enctype="multipart/form-data">
    <input type="file" name="file" accept="image/*" required>
    <input type="submit" value="Upload">
  </form>
</body>
</html>
