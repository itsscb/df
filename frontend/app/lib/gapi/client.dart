import 'package:app/pb/rpc_login.pbserver.dart';

import 'package:app/pb/service_df.pbserver.dart';

import 'package:grpc/grpc.dart';

import 'package:protobuf/protobuf.dart' as $pb;

import 'package:app/pb/service_df.pb.dart';

class Client {
  late dfApi stub;

//  Future<void> main(List<String> args) async {
//     final channel = ClientChannel('127.0.0.1',
//         port: 8080,
//         options:
//             const ChannelOptions(credentials: ChannelCredentials.insecure()));
//     stub = dfServiceBase(channel,
//         options: CallOptions(timeout: Duration(seconds: 30)));
//     // Run all of the demos in order.
//     try {
//       await runGetFeature();
//       await runListFeatures();
//       await runRecordRoute();
//       await runRouteChat();
//     } catch (e) {
//       print('Caught error: $e');
//     }
//     await channel.shutdown();
//   }
  // Future<LoginResponse> login(
  //     $pb.ServerContext ctx, LoginRequest request) async {}
  // final channel = ClientChannel(
  //   '127.0.0.1',
  //   port: 9090,
  //   options: const ChannelOptions(
  //     credentials: ChannelCredentials.insecure(),
  //   ),
  // );

  // dfApi stub = dfApi(
  //   channel,
  // );
}
