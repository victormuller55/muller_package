import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> hasInternetConnection() async {
  List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult.first == ConnectivityResult.mobile || connectivityResult.first == ConnectivityResult.wifi;
}

String thereInternetConnection() {
  return '''
{
  "tipo": "BAD GATEWAY",
  "mensagem": "Verifique sua conexão com a internet",
  "erro": "Sem conexão com a internet"
}
''';
}
