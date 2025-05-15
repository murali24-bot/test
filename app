<!DOCTYPE html>
<html>
<head>
  <title>Website A - Submit Form</title>
</head>
<body>
  <h2>Send Message to Website B</h2>
  <form id="myForm">
    <input type="text" id="name" placeholder="Your Name" required /><br><br>
    <textarea id="message" placeholder="Your Message" required></textarea><br><br>
    <button type="submit">Send</button>
  </form>

  <script>
    document.getElementById('myForm').addEventListener('submit', function (e) {
      e.preventDefault();
      const name = document.getElementById('name').value;
      const message = document.getElementById('message').value;

      fetch("https://e5222006.app.n8n.cloud/webhook-test/send-to-appb", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ name, message })
      })
      .then(res => res.text())
      .then(data => alert("✅ Sent to Website B via n8n"))
      .catch(err => alert("❌ Error: " + err));
    });
  </script>
</body>
</html>
