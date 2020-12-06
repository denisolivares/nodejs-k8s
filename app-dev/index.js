const http = require("../app-prod/node_modules/http");

http
  .createServer(function(request, response) {
    console.log("request received");
    response.end("Hello DEV World", "utf-8");
  })
  .listen(3000);
console.log("server started");