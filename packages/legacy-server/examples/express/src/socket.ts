import * as http from 'http'

// region socket io
import * as socket from 'socket.io'
import { Namespace } from "socket.io";

export interface NewsToClientEvent {
    data: string
}


let clientIo: Namespace

export function initSockets(app) {

    const server = new http.Server(app);
    const io = socket(server);

    server.listen(3001);

    io.on('connection', function (socket) {
        socket.on('ping!', function (data, fn) {
            fn({ "data": data, "message": "nice yo pong you client!" })
        });
    });

    clientIo = io.of('/client');

    clientIo.on('connection', function (socket) {
        console.log('clientIo connected');
        socket.on('alert', function (data) {
            socket.broadcast.emit('alert', data);
        });
    });
}


export function eventToClient(news: string) {
    const data: NewsToClientEvent = {
        data: news,
    };
    clientIo.emit('news', data);
}