
var PROTO_PATH = __dirname + '/protobuf/hello.proto';
var PROTO_PATH_2 = __dirname + '/protobuf/messenger.proto';
import * as grpc from "grpc";
import * as protoLoader from '@grpc/proto-loader';


// region grpc
const helloPackageDefinition = protoLoader.loadSync(
    PROTO_PATH,
    {
        keepCase: true,
        longs: String,
        enums: String,
        defaults: true,
        oneofs: true
    });

const messengerPackageDefinition = protoLoader.loadSync(
    PROTO_PATH_2,
    {
        keepCase: true,
        longs: String,
        enums: String,
        defaults: true,
        oneofs: true
    });
var hello_proto = grpc.loadPackageDefinition(helloPackageDefinition).helloworld as any;
var messenger_proto = grpc.loadPackageDefinition(messengerPackageDefinition).messenger as any;
function sayHello(call, callback) {
    callback(null, { message: 'Hello ' + call.request.name });
}

function showDialog(call, callback) {
    callback(null, { "action": "route://to" })
}

function subscribeMessages(call, callback) {
    callback(null, { "action": "route://to" })
}

export function startGrpc() {
    var server = new grpc.Server();
    server.addService(hello_proto.Greeter.service, { sayHello: sayHello });
    server.addService(messenger_proto.Messenger.service, { subscribeMessages: subscribeMessages });
    server.bind('0.0.0.0:50051', grpc.ServerCredentials.createInsecure());
    server.start();
}
// endregion grpc

