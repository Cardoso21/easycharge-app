import 'package:easycharge/models/dividas/listaDividas.dart';
import 'package:easycharge/screens/autenticacao/login.dart';
import 'package:easycharge/screens/dashboard.dart';
import 'package:easycharge/state/wizard_cadastro_cliente.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'http/webCliente.dart';
import 'http/webDivida.dart';
import 'models/clientes/listaClientes.dart';
import 'models/clientes/listaEndereco.dart';
import 'models/funcionarios/listaFuncionario.dart';

void main() {
  buscarTodosClientes();
  buscartodasDividas();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListaDeFuncionarios()),
        ChangeNotifierProvider(create: (context) => ListaDeClientes()),
        ChangeNotifierProvider(create: (context) => ListaEndereco()),
        ChangeNotifierProvider(create: (context) => ListaDeDividas()),
        ChangeNotifierProvider(
            create: (context) => WizardCadastroDeClienteState()),
      ],
      child: EasychargeApp(),
    ));
}

class EasychargeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
        ).copyWith(
          secondary: Color.fromARGB(95, 8, 234, 207),
        ),
        accentColor: Color.fromARGB(255, 142, 253, 236)
      ),
      home: Dashboard(),
    );
  }
}
