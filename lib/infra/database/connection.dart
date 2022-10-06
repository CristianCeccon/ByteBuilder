import 'package:sqflite/sqflite.dart';
import "package:path/path.dart" as path;

const String sqlProc = """
CREATE TABLE PROCESSADOR(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    marca TEXT NOT NULL,
    preco DOUBLE NOT NULL,

    nucleo INTEGER NOT NULL,
    frequencia DOUBLE NOT NULL,
    socket TEXT NOT NULL
); 
""";
const String sqlPlac = """
CREATE TABLE PLACA_MAE(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    marca TEXT NOT NULL,
    preco DOUBLE NOT NULL,

    ddr INTEGER NOT NULL,
    socket TEXT NOT NULL
); 
""";

const List<String> inserts = [
  "INSERT INTO PROCESSADOR VALUES (1, 'p1', 'Intel', 150.00, 2, 2.5, 'LGA1151');",
  "INSERT INTO PROCESSADOR VALUES (2, 'p2', 'AMD', 1300.00, 4, 4.6, 'AM4');",
  "INSERT INTO PLACA_MAE VALUES (3, 'pm1', 'Gigabyte', 500.00, 4, 'LGA1151');",
  "INSERT INTO PLACA_MAE VALUES (4, 'pm2', 'ASUS', 400.00, 4, 'AM4');",
];

class Connection {
  static Database? _db;

  static Future<Database> get db async {
    _db ??= await init();
    return _db!;
  }

  static Future<Database> init() async {
    String caminho = path.join(await getDatabasesPath(), "db_bytebuilder");
    return await openDatabase(
      caminho,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(sqlProc);
        await db.execute(sqlPlac);
        for (String sql in inserts){
          await db.rawInsert(sql);
        }
        
      },
    );
  }

  static deleteDB() async {
    var db = await Connection.db;
    databaseFactory.deleteDatabase(db.path);
  }
}
