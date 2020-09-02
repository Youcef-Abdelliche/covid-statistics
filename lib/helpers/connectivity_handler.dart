import 'package:connectivity/connectivity.dart';

class ConnectivityHandler {
  static Future checkConnectivity() async {
    ConnectivityResult _connectivityResult =
        await Connectivity().checkConnectivity();
    return (_connectivityResult == ConnectivityResult.mobile ||
            _connectivityResult == ConnectivityResult.wifi)
        ? true
        : false;
  }
}
