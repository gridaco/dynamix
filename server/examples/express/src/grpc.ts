
var PROTO_PATH_2 = __dirname + '/protobuf/messenger.proto';
import * as grpc from "grpc";
import * as protoLoader from '@grpc/proto-loader';


// region grpc

const messengerPackageDefinition = protoLoader.loadSync(
    PROTO_PATH_2,
    {
        keepCase: true,
        longs: String,
        enums: String,
        defaults: true,
        oneofs: true
    });
var messenger_proto = grpc.loadPackageDefinition(messengerPackageDefinition).messenger as any;
function sayHello(call, callback) {
    console.log(callback);
    callback(null, { message: 'Hello ' + call.request.name });
}

function showDialog(call, callback) {
    callback(null, { message: "route://to" })
}

async function subscribeMessages(call) {
    console.log(call);
    while (true) {
        await new Promise(r => setTimeout(r, 2000));
        console.log(Date.now())
        call.write({ msg: `route://to ${Date.now()}` })
    }
}

export function startGrpc() {
    var server = new grpc.Server();
    server.addService(messenger_proto.Messenger.service, { sayHello: subscribeMessages });
    server.addService(messenger_proto.Greeter.service, {
        sayHello: subscribeMessages,
        subscribeMessages: subscribeMessages
    });
    server.bind('0.0.0.0:50051', grpc.ServerCredentials.createInsecure());
    server.start();
}
// endregion grpc

