import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Database database;
  static final String dbName = '/ecommerce.db';
  static final String tableName = 'cartProduct';
  static final String columnName = 'name';
  static final String columnImage = 'image';
  static final String columnPrice = 'price';
  static final String columnQuantity = 'quantity';
  static final String columnid = 'id';

  Future<Database> initDataBase() async {
    if (database == null) {
      return await createDataBase();
    } else {
      return database;
    }
  }

  createDataBase() async {
    try {
      String dbPath = await getDatabasesPath();
      String path = dbPath + dbName;
      Database database = await openDatabase(path, version: 2,
          onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE $tableName (
            $columnName TEXT NOT NULL,
            $columnImage TEXT NOT NULL,
            $columnPrice TEXT NOT NULL,
            $columnQuantity INTEGER,
            $columnid TEXT NOT NULL
            )
            ''');
      });
      return database;
    } catch (e) {
      print(e);
    }
  }

  insertProduct(CartProductModel product) async {
    try {
      database = await initDataBase();
      await database.insert(tableName, product.toJson());
      print('product added');
    } catch (e) {
      print(e);
    }
  }

  Future<List<CartProductModel>> getAllProducts() async {
    database = await initDataBase();
    List<Map> maps = await database.query(tableName);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((e) => CartProductModel.fromJson(e)).toList()
        : [];
    print('maps length :' + maps.length.toString());
    return list;
  }

  updateProduct(CartProductModel product) async {
    database = await initDataBase();
    await database.update(tableName, product.toJson(),
        where: '$columnid =?', whereArgs: [product.id]);
  }
}
