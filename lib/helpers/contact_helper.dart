// Importa o pacote sqflite para usar SQLite no Flutter
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

// Definição dos nomes das colunas que serão usadas no banco de dados
final String contactTable = "contactTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String emailColumn = "emailColumn";
final String phoneColumn = "phoneColumn";
final String imgColumn = "imgColumn";

// Classe responsável por interações com o banco de dados (está vazia por enquanto)
class ContactHelper {
  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  late Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contacts.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int newerVersion) async {
        await db.execute(
          "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY,$nameColumn TEXT, $emailColumn TEXT, $phoneColumn TEXT, $imgColumn TEXT)",
        );
      },
    );
  }
}

// Classe modelo que representa um contato
class Contact {
  // Atributos do contato
  late int id;
  late String name;
  late String email;
  late String phone;
  late String img;

  // Construtor que cria um objeto Contact a partir de um Map (vindo do banco de dados)
  Contact.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }

  // Método que converte o objeto Contact em um Map (para salvar no banco)
  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img,
    };

    // Adiciona o id ao Map apenas se ele já foi definido
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  // Método que retorna uma string representando o contato (útil para debug)
  @override
  String toString() {
    return "Contact(id $id, name: $name, email: $email, phone: $phone, img: $img)";
  }
}
