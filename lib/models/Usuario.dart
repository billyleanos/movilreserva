import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toMap());

class User {
  int id_usuario;
  String nombre_apellido;
  String correo;
  String password;
  String telefono;
  int estado;

  User(
      {this.id_usuario = 0,
      this.nombre_apellido = '',
      this.correo = '',
      this.password = '',
      this.telefono = '',
      this.estado = 1
      
      });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id_usuario: json["id_usuario"],
        nombre_apellido: json["nombre_apellido"],
        correo: json["correo"],
        password: json["password"],
        telefono: json["telefono"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "id_usuario": id_usuario,
        "nombre_apellido": nombre_apellido,
        "correo": correo,
        "password": password,
        "telefono": telefono,
        "estado": estado,
      };
}


class UserLogin {
  String correo;
  String password;

  UserLogin({
    this.correo = '',
    this.password = '',
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        correo: json["correo"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "correo": correo,
        "password": password,
      };
}