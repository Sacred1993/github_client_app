import 'dart:io';

import 'package:github_client_app/db/client.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbUtil {
  Directory documentsDirectory;
  String dbPath;
  Database _dataBase;

  init() async {
    if (documentsDirectory == null) {
      documentsDirectory = await getApplicationDocumentsDirectory();
    }
    if (dbPath == null) {
      dbPath = join(documentsDirectory.path, "client.db");
    }
  }

  ///打开数据库,没有该数据库将会创建
  openDb() async {
    _dataBase = await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Client ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "age INTEGER,"
          "sex BIT"
          ")");
    });
  }

  ///关闭数据库
  ///Many applications use one database and would never need to close it (it will be closed when the application is terminated).
  ///If you want to release resources, you can close the database
  closeDb() async {
    await _dataBase.close();
  }

  deleteDb() async {
    // Delete the database
    await deleteDatabase(dbPath);
  }

  insertClient() async {
    await _dataBase.rawInsert(
        "INSERT Into Client (id,name,age,sex) VALUES (?,?,?,?)",
        [101, '张三', 20, true]);
    await _dataBase.rawInsert(
        "INSERT Into Client (id,name,age,sex) VALUES (102, '李四', 30, false)");
    await _dataBase.insert("Client", {
      "id": 103,
      "name": "王五",
      "age": 35,
      "sex": true,
    });
  }

  deleteClientData(int id) async {
    int count =
        await _dataBase.delete("Client", where: "id=?", whereArgs: [id]);

    // Delete a record
    int count2 = await _dataBase
        .rawDelete('DELETE FROM Client WHERE id = ?', [id]);
  }

  updateClient(Client newClient) async {
    int count = await _dataBase.update("Client", newClient.toMap(),
        where: "id=?", whereArgs: [newClient.id]);
    print("count=$count");
    int count2 = await _dataBase.rawUpdate(
        'UPDATE Client SET name = ?, age = ? WHERE id = ?',
        ['王五rawUpdate', 99, 103]);
    print('updated: $count,rawUpdate=$count2');
  }

  queryClient(int id) async {
    List<Map> list = await _dataBase.rawQuery('SELECT * FROM Client');

    List<Map> res =
        await _dataBase.query("Client", where: "id=?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromMap(res.first) : null;
  }
}
