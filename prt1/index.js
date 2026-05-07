const http = require('http');

const server = http.createServer((req, res) => {
  res.writeHead(200);
  res.end('API en ligne !');
});
server.listen(3000, () => {
  console.log("L'API est prête et écoute sur le port 3000");
});