import 'dart:io';

import 'package:final_eight_app/models/product.dart';
import 'package:final_eight_app/models/shop.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBLocalHelper {
  DBLocalHelper._();

  static final DBLocalHelper dbProductHelper = DBLocalHelper._();
  
  static String usersTable = 'userstable';
  static String id = 'id';
   Database? database;

  initDatabase() async {
    if (database == null) {
      database = await connectToDatabase();
    }
  }

  Future<Database> connectToDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path; // get
    String databasePath = join(appDocPath, 'shop.db'); // to create db path
    Database database =
        await openDatabase(databasePath, version: 1, onCreate: (db, version) {
      createTable(db);
    }); // to connect to database if its estableshed else will be create new one and return connection to DB
    return database;
  }
                       
  createTable(Database db) {
    db.execute(
        '''CREATE TABLE $usersTable (id INTEGER PRIMARY KEY AUTOINCREMENT,full_name TEXT,login_name TEXT NOT NULL,phone TEXT,Commission TEXT,password TEXT,image TEXT,date_work TEXT,address TEXT,card TEXT,account_number,purchase_commission TEXT,account_type TEXT)''');
  }

  insertInToDatabase(User user) async {
    try {
      int rowIndex = await database!.insert(usersTable, user.toJson());
      print(rowIndex);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<Data>?> getAllProductsFromDatabase() async {
    try {
      List<Data> users =[];
      List<Map<String, dynamic>> allproducts = await database!.query(usersTable);
      print(allproducts);
          allproducts.forEach((element) {users.add(Data(
            status: "success",
            user:  User.fromJson(element)));});
      return users;
    } on Exception catch (e) {
      print(e);
    }
  }


  deleteOneUserFromDatabase(int userId) {
    database!.delete(usersTable, where: 'id=?', whereArgs: [userId]);
  }

}
