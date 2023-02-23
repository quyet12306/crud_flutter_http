import 'dart:convert';

import 'package:http/http.dart' as http;
import 'persion.dart';

class Repostiory {
  String uri = "https://63f636f4ab76703b15babfa5.mockapi.io/persion";

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Persion> persion = it.map((e) => Persion.fromJson(e)).toList();
        return persion;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future createData(
    String firstname,
    String lastname,
    String message,
  ) async {
    try {
      final response = await http.post(Uri.parse(uri), body: {
        'first_name': firstname,
        'last_name': lastname,
        'message': message,
      });

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future updatePage(
    String id,
    String firstname,
    String lastname,
    String message,
  ) async {
    try {
      final response = await http.put(Uri.parse('$uri/$id'), body: {
        'first_name': firstname,
        'last_name': lastname,
        'message': message,
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future deleteData(String id) async {
    try {
      final response = await http.delete(Uri.parse('$uri/$id'));

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
