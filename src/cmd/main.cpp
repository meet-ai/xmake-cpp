
#include "message.grpc.pb.h"
#include "message.pb.h"

#include <grpc/grpc.h>
#include <grpcpp/security/server_credentials.h>
#include <grpcpp/server.h>
#include <grpcpp/server_builder.h>
#include <grpcpp/server_context.h>
#include <iostream>
#include <memory>
#include <string>

using grpc::Server;
using grpc::ServerBuilder;
using grpc::ServerContext;
using grpc::ServerReader;
using grpc::ServerReaderWriter;
using grpc::ServerWriter;
using grpc::Status;
using std::cout;
using std::endl;
using std::string;

using namespace helloworld;
class GreeterServiceImpl final : public helloworld::Greeter::Service {
  Status SayHello(ServerContext *context, const HelloRequest *request,
                  HelloReply *reply) override {
    std::string prefix("Hi!");
    reply->set_message("hi");
    return Status::OK;
  }
};

void RunServer() {
  std::string server_addr("0.0.0.0:50051");
  // create an instance of our service implementation class Test1Impl
  GreeterServiceImpl service;

  // Create an instance of factory ServerBuilder class
  ServerBuilder builder;

  // Specify the address and port we want to use to listen for client requests
  // using the builder’s AddListeningPort() method.
  builder.AddListeningPort(server_addr, grpc::InsecureServerCredentials());

  // Register our service implementation with the builder.
  builder.RegisterService(&service);

  // Call BuildAndStart() on the builder to create and start an RPC server for
  // our service.
  std::unique_ptr<Server> server(builder.BuildAndStart());
  cout << "Server listening on " << server_addr << endl;

  // Call Wait() on the server to do a blocking wait until process is killed or
  // Shutdown() is called
  server->Wait();
}
int main() { RunServer(); }
