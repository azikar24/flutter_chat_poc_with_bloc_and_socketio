const express = require("express");
const cors = require("cors");
const http = require("http");
const { Server } = require("socket.io");
const app = express();
const server = http.createServer(app);
const os = require("os");

const port = 1996;




app.use(cors());
app.options("*", cors());

io = new Server(server, {
    maxHttpBufferSize: 1e8
});

console.log("HERE");
io.on("connection", async (socket) => {
    console.log("Hello world socket connection started");
    const { username, room } = socket.handshake.query;
    socket.join(room);

    socket.emit("message", {
        "type": "username",
        "data": "azikar"
    });


    socket.on("message", (event) => {
        console.log(`message::event::`, event);

        socket.broadcast.to(room).emit("message", {
            "type": "message",
            "data": {
                messageText: event.messageText
            },
        });

    });
    
    socket.on("typing", (event) => {
        console.log(`typing::event::`, event);
        socket.broadcast.to(room).emit("message", {
            "type": "typing",
            "data": event,
        });

    });

 

});


server.listen(port, () => {
    console.log(`Application is listening at http://${getIPAddress()}:${port}`);
});

process.on("uncaughtException", (err) => {
    console.log("Close uncaughtException ");
    console.error(err, err.stack);
});



function getIPAddress() {
    var interfaces = os.networkInterfaces();
    for (var devName in interfaces) {
        var iface = interfaces[devName];
        if (iface == undefined) continue;
        for (var i = 0; i < iface.length; i++) {
            var alias = iface[i];
            if (alias.family === 'IPv4' && alias.address !== '127.0.0.1' && !alias.internal)
                return alias.address;
        }
    }
    return '0.0.0.0';
}


