import 'package:easycharge/models/dividas/dividas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/dividas/listaDividas.dart';
import '../menuDrawer.dart';
import 'formulario.dart';

class DividaLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Dividas')
      ),
      drawer: MenuDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormularioDeDivida(),
            ),
          );
        },
        label: Text('Nova Divida'),
        icon: Icon(Icons.monetization_on),
      ),
      body:Consumer<ListaDeDividas>(
        builder:(context,listaDeDividas,child){
          List<Divida> todasDividas =listaDeDividas.getDividas();

          return ListView.builder(
              itemCount: todasDividas.length,
              itemBuilder:(contextListView, index){
                return ItemDivida(todasDividas[index]);
              });
        }
      ),
    );
  }
}

class ItemDivida extends StatelessWidget {
  final Divida divida;

  ItemDivida(this.divida);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: const Icon(Icons.people),
          title: Text(divida.cliente),
          subtitle: Text('Valor: ' + divida.valor)
      ),
    );
  }
}
