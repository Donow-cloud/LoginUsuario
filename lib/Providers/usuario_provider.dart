import 'package:flutter/material.dart';
import 'package:traveler_app/Models/usuario.dart';
import 'package:traveler_app/Widgets/constant.dart';
import 'package:http/http.dart' as http;

final urlapi = url;

class Usuario_provider with ChangeNotifier {
  List<Usuario> usuarios = [];

  Usuario_provider() {
    getUsuarios();
  }

  getUsuarios() async {
    final url1 = Uri.http(urlapi, 'api/Usuario');
    final resp = await http.get(
      url1,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": "true",
        "Content-Type": 'application/json',
        "Accept": 'application/json',
      },
    );
    final response = usuarioFromJson(resp.body);
    usuarios = response;
    notifyListeners();
  }
}
