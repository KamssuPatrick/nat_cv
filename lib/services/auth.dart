
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/constants.dart';


String rootAPI = 'https://invests-partners.herokuapp.com/mobile/auth/';

class Auth
{





  static Future<Map<String, dynamic>> addUtilisateurAPI(String nom, String prenom, String email, String password, status, tel, role) async {



    print('posted2  ${role}');
    // int role = 3;
    String url = '$URL_SERVEUR/api/auth/register';
    Map<String, String> headers = {"Content-type": "application/json"};
// if you want to pass json along with it
    String jsons = '{"email": "$email", "password": "$password", "role": "$role", "nom" : "$nom", "prenom" : "$prenom", "telephone" : "$tel", "status" : "$status"}';
    // String json2 = '{"email": "kamssupatrick@gmail.com", "password": "patson"}';
    // make POST request
    http.Response response = await http.post(Uri.parse(url), headers: headers, body: jsons);
    // check the status code for the result
    Map<String, dynamic> jsonInput = jsonDecode(response.body);

    print('posted2  ${jsonInput}');

    return jsonInput;
    // } catch (e) {
    //   return e;
    // }
  }


  static Future<Map<String, dynamic>> addUtilisateurInvestAPI(String nom, String prenom, String email, String password, status, tel, role, plage) async {

    // var map = new Map<String, dynamic>();
    // map["action"] = _ADD_UTILISATEUR_ACTION;
    // map["nom_utilisateur"] = nom;
    // map["prenom_utilisateur"] = prenom;
    // map["email_utilisateur"] = email;
    // map["password_utilisateur"] = password;
    // final response = await http.post(ROOT, body: map);
    // print("addEmployee >> Response:: ${response.body}");


    print('posted2  ${role}');
    // int role = 3;
    String url = '$URL_SERVEUR/api/auth/register';
    Map<String, String> headers = {"Content-type": "application/json"};
// if you want to pass json along with it
    String jsons = '{"email": "$email", "password": "$password", "role": "$role", "nom" : "$nom", "prenom" : "$prenom", "telephone" : "$tel", "status" : "$status", "profil" : "$plage"}';
    // String json2 = '{"email": "kamssupatrick@gmail.com", "password": "patson"}';
    // make POST request
    http.Response response = await http.post(Uri.parse(url), headers: headers, body: jsons);
    // check the status code for the result
    Map<String, dynamic> jsonInput = jsonDecode(response.body);

    print('posted2  ${jsonInput}');

    return jsonInput;
    // } catch (e) {
    //   return e;
    // }
  }


  static Future<int> verificationEmailUtilisateurAPI( String email, tel, role) async {
    try {
      // var map = new Map<String, dynamic>();
      // map["action"] = _ADD_UTILISATEUR_ACTION;
      // map["nom_utilisateur"] = nom;
      // map["prenom_utilisateur"] = prenom;
      // map["email_utilisateur"] = email;
      // map["password_utilisateur"] = password;
      // final response = await http.post(ROOT, body: map);
      // print("addEmployee >> Response:: ${response.body}");

      print("Len___________gth ${role}");
      // int role = 3;
      String url = '$URL_SERVEUR/api/auth/check/register';
      Map<String, String> headers = {"Content-type": "application/json"};
// if you want to pass json along with it
      String jsons = '{"email": "$email", "telephone" : "$tel", "role": "$role"}';
      // String json2 = '{"email": "kamssupatrick@gmail.com", "password": "patson"}';
      // make POST request
      http.Response response = await http.post(Uri.parse(url), headers: headers, body: jsons);
      // check the status code for the result
      Map<String, dynamic> jsonInput = jsonDecode(response.body);

      print('posted2  ${jsonInput}');

      return response.statusCode;
    } catch (e) {
      return 0;
    }
  }

  static Future<String> connexionUtilisateur(String email, String password) async
  {
    try {
      var map = new Map<String, dynamic>();
      Map<String, String> headers = {"Content-type": "application/json"};
// if you want to pass json along with it
      String jsons = '{"email": "$email", "password": "$password"}';

      rootAPI = URL_SERVEUR + "/api/login";

      http.Response response = await http.post(Uri.parse(rootAPI), headers: headers, body: jsons);


      // map["action"] = _CONNEXION_UTILISATEUR_ACTION;
      // map["email_utilisateur"] = email;
      // map["password_utilisateur"] = password;
      // final response = await http.post(ROOT, body: map);
      // print("addEmployee >> Response:: ${response.body}");
      print('Response status: ${response.statusCode}');
      print('Response status: ${rootAPI}');
      // Map<String, dynamic> dataa = parsePhotos(response.body);
      print('Response body: ${response.body}');
      return response.body;
    } catch (e) {
      return 'error';
    }
  }


  static Future<Map<String, dynamic>> connexionUtilisateurAPI(email, password, role) async{
    // print('postedss');
    bool remember = true;
    print('Response status: $email $password $role');
    // String url = 'https://admin.invest--partners.com/api/auth/login';
    String url = '$URL_SERVEUR/api/auth/login';
    Map<String, String> headers = {"Content-type": "application/json"};
// if you want to pass json along with it
    String jsons = '{"email": "$email", "password": "$password", "role": "$role", "remember": "$remember"}';
    String json2 = '{"email": "kamssupatrick@gmail.com", "password": "patson"}';
    // make POST request
    http.Response response = await http.post(Uri.parse(url), headers: headers, body: jsons);
    // check the status code for the result
    Map<String, dynamic> jsonInput = jsonDecode(response.body);
    // print('posted2  ${jsonInput["success"]}');
    // print('posted23  ${jsonInput["data"]["user"]['role_data']['id']}');


    // Utilisateur user = Utilisateur.fromJson(jsonInput["data"]["user"]);
    // List<Utilisateur> list = parsePhotos(jsonInput["data"]["user"]);



    print('Response status: ${response.statusCode}');

    return jsonInput;

  }


  static Future<Map<String, dynamic>> sendTokenUtilisateurAPI(idUser, fcmToken, userToken) async{
    // print('postedss');
    bool remember = true;
    print('Response status: $fcmToken');
    // String url = 'https://admin.invest--partners.com/api/auth/login';
    String url = '$URL_SERVEUR/api/user/$idUser/device/token';
    Map<String, String> headers = {"Content-type": "application/json", "Authorization": "Bearer $userToken"};
// if you want to pass json along with it
    String jsons = '{"device_token": "$fcmToken"}';
    print('Response status: $jsons');
    // make POST request
    http.Response response = await http.put(Uri.parse(url), headers: headers, body: jsons);
    // check the status code for the result
    Map<String, dynamic> jsonInput = jsonDecode(response.body);

    print('Response status Send Token: ${response.statusCode}');
    print('Response status Send Token: ${response.body}');

    return jsonInput;

  }


  static Future<Map<String, dynamic>> deconnexionUtilisateurAPI(token) async{
    // print('postedss');
    bool remember = true;
    String url = '$URL_SERVEUR/api/auth/logout';
    // String url = 'https://admin.invest--partners.com/api/auth/logout';
    Map<String, String> headers = {"Content-type": "application/json", "Authorization": "Bearer $token"};
// if you want to pass json along with it
    String jsons = '{}';
    String json2 = '{"email": "kamssupatrick@gmail.com", "password": "patson"}';
    // make POST request
    http.Response response = await http.post(Uri.parse(url), headers: headers);
    // check the status code for the result
    Map<String, dynamic> jsonInput = jsonDecode(response.body);
    // print('posted2  ${jsonInput["success"]}');
    // print('posted23  ${jsonInput["data"]["user"]['role_data']['id']}');


    // Utilisateur user = Utilisateur.fromJson(jsonInput["data"]["user"]);
    // List<Utilisateur> list = parsePhotos(jsonInput["data"]["user"]);



    print('Response status: ${response.statusCode}');
    // Map<String, dynamic> dataa = parsePhotos(response.body);
    // print('Response body: ${response.body}');
    // print('Response body: ${dataa}');

    return jsonInput;

  }

}

