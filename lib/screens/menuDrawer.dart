import 'package:flutter/material.dart';

import 'autenticacao/login.dart';
import 'cliente/listaClientes.dart';
import 'dashboard.dart';
import 'divida/dividaLista.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 2),
                  colors: <Color>[
                    Color.fromRGBO(1, 72, 66, 1.0),
                    Color.fromRGBO(2, 111, 102, 1.0),
                    Color.fromRGBO(2, 132, 123, 1.0),
                    Color.fromRGBO(2, 167, 155, 1.0),
                    Color.fromRGBO(67, 183, 173, 1.0),
                    Color.fromRGBO(39, 230, 144, 1.0),
                    Color.fromRGBO(93, 244, 158, 0.5),
                    Color.fromRGBO(143, 220, 174, 0.5019607843137255),
                  ],
                  tileMode: TileMode.mirror),
            ),
            child: Text(
              'Easycharge',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Dashboard(),
                ),
                (route) => false,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Clientes'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaClientes(),
                ),
                (route) => false,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Dividas'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => DividaLista(),
                ),
                (route) => false,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_outlined),
            title: Text('Cobranças'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaClientes(),
                ),
                (route) => false,
              );
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.logout),
          //   title: Text('Sair'),
          //   onTap: () {
          //     Navigator.pushAndRemoveUntil(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => Login(),
          //       ),
          //           (route) => false,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
