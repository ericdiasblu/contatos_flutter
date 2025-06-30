// Classe modelo que representa um contato
import '../helpers/contact_helper.dart';

class Contact {
  // Atributos do contato
  int? id;
  String? name;
  String? email;
  String? phone;
  String? img;

  Contact();

  // Construtor que cria um objeto Contact a partir de um Map (vindo do banco de dados)
  Contact.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }

  // Método que converte o objeto Contact em um Map (para salvar no banco)
  Map<String,dynamic> toMap() {
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