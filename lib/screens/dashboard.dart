import 'package:flutter/material.dart';

import 'menuDrawer.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: const Center(
          child: Text('Easycharge'),
        ),
      ),

    );
  }
}
