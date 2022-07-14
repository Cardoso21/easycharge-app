import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../models/dividas/dividas.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    debugPrint(data.body);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}

Future<List<Divida>> buscartodasDividas() async {
  final List<Divida> dividas = [];
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  final Response response = await client
      .get(Uri.http('172.19.144.1:8080', '/api/dividas'))
      .timeout(Duration(seconds: 5));
  final List<dynamic> decodedJson = jsonDecode(response.body);

  for (Map<String, dynamic> divida in decodedJson) {
    final Divida json = Divida(

      divida['id'],
      divida['valor'],
      divida['dataAbertura'],
      divida['dataQuitacao'],
      divida['descricao'],
      divida['cliente'],
      divida['statusDivida'],

    );
    dividas.add(json);
  }

  return dividas;
}

void cadastroDivida(Divida divida) async {
  final Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  final String dividaJson = jsonEncode(divida.mapJson());

  final Response response = await client.post(
    Uri.http('172.19.144.1:8080', '/api/dividas'),
    headers: {'Content-type': 'application/json'},
    body: dividaJson,
  );

  Map<String, dynamic> json = jsonDecode(response.body);


}
