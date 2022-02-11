import 'dart:convert';
import 'dart:io';

import 'package:final_eight_app/models/product.dart';
import 'package:final_eight_app/models/shop.dart';
import 'package:http/http.dart' as http;

class DBRemoteHelper {
  DBRemoteHelper._();
  static final DBRemoteHelper dbRemoteHelper = DBRemoteHelper._();

  final String apiUrl = "https://api-eqaara.herokuapp.com/api/";
  final String all_users = "all-users";
  final String myusers = "user";

  var header = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json'
  };

  createNewProduct(User user) async {
    var jasonData;
    var body = jsonEncode(user.toJson());
    try {
      await http
          .post(
            Uri.parse(apiUrl + myusers),
            headers: header,
            body:body,
          )
          .then((data) => {
                print(data.statusCode),
                if (data.statusCode == 200)
                  {
                    print("create successfully"),
                  }
              });
    } catch (e) {
      print(e);
    }
  }

  Future<List<Data>?> getAllProducts() async {
    var jasonData;
    Users users;
    try {
      var response = await http.get(
        Uri.parse(apiUrl + all_users),
        headers: header,
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        jasonData = json.decode(response.body);
        users = Users.fromJson(jasonData);
        return users.data!;
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  deleteProduct(int id)async {
String uri = "https://api-eqaara.herokuapp.com/api/user/$id";
 var jasonData;
    try {
      await http
          .delete(
            Uri.parse(uri),
            headers: header,
          )
          .then((data) => {
                print(data.statusCode),
                if (data.statusCode == 200)
                  {
                    print("delete successfully"),
                  }
              });
    } catch (e) {
      print(e);
    }


  }
}
