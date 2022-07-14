import 'package:easycharge/models/clientes/cliente.dart';
import 'package:flutter/material.dart';

import '../../components/mensagens.dart';
import '../../http/webCliente.dart';
import '../menuDrawer.dart';
import 'formulario.dart';

class ListaClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Clientes'),
        ),
        drawer: MenuDrawer(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Formulario(),
              ),
            );
          },
          label: Text('Novo Clinete'),
          icon: Icon(Icons.person_rounded),
        ),
        body: FutureBuilder<List<Cliente>>(
        future: buscarTodosClientes(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:

              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if(snapshot.hasData){
                  final List<Cliente> clientes = snapshot.requireData;
                  if (clientes.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: clientes.length,
                        itemBuilder: (contextListView, indice) {
                          return ItemCliente(clientes[indice]);
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                      ),
                    );
                  }
                }
            }
            return CenteredMessage('Erro desconhecido!');
          },
        ),


    );
    }
  }

  class ItemCliente extends StatelessWidget {
  final Cliente cliente;

  ItemCliente(this.cliente);

  @override
  Widget build(BuildContext context) {
  return Card(
  child: ListTile(
  leading: const Icon(Icons.people),
  title: Text(cliente.nome),
  subtitle: Text('CPF: ' + cliente.cpf)),
  );
  }
  }
