import 'dart:io';
import 'package:sytex_coding_challenge/helpers/abstractions/connection_helper.dart';

class ConnectionHelperImplementation implements ConnectionHelper {
  @override
  Future<bool> isConnected() async {
    var connect = false;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connect = true;
      }
    } on SocketException catch (_) {
      connect = false;
    }

    return connect;
  }
}
