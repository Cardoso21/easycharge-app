import 'package:easycharge/database/dao/cliente_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String path = join(await getDatabasesPath(), 'easycharger.db');
  return openDatabase(path, onCreate: (db, version) {
      db.execute(ClienteDAO.tabelaSql);
    }, version: 1,
        // onDowngrade: onDatabaseDowngradeDelete
    );
}
