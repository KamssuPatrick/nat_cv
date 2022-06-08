
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/emploie.dart';
import '../utils/constants.dart';

class GetService
{



  static Future<List<EmploieModel>?> getAllEmploies () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print('____Projet ${prefs.getInt("id")}');
    var data;
    bool remember = true;
    // String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGQxNTAwMjU0NzdjNDM4YWIzNjc2ODhiOWFlZDZmOTdjZWY0MDdjNTE2MWFkNWRkYWE0NDM5ODFlZWJkNGU4OGU5OTJjOTBjZjc1MTc5MzYiLCJpYXQiOjE2MzM2OTc2MjkuNzkzMTIzLCJuYmYiOjE2MzM2OTc2MjkuNzkzMTI3LCJleHAiOjE2NjUyMzM2MjkuNzkxNDA2LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.S88yLOAeiEYActPAomnbUj6G0Lc6YjxbC-MNJmm9yHGgrGO432tSDXkCKxzCCUkp8YhzYao0ZhG41e9eahCqIJje2FNRbqjfOmMQtphp0PpSkxr0d6QxilyS-TWMH685CGKP1uO6IjFVwYWto1Ee5XzQjGdrmZuNwN2_-zG_0JVg9zG0OP6Qns8Q1ObSe5wL3B0QhpFnwZgOQZQm9uHt8LX5WXdTjMsICXUYMiHYPjQeSJ0bU_TyeRn050dCbOGLjC5_Q8OZGZuorire6NRj2yYcqMb89L2o3FiPj0_I_Cjti1EOQ6X8jdRtWxN3wJ06iK8KAsFwxrA9O9XRQkM0ErJwI2r2jAkD2WS8m5QN-uX-7w67kiTgKd1mHNTN91NPVFMAZOhp1MrkPv51mFpkcdobtK71cwIW09OKbpdgAuY8tAENBUrsT57c6fX7L6MuWE2zF_wWptzb5cDiwrfQWcTSlnyNixQXRJ_k54ETJkkOyy-lUPs6XEFzLUoKAfFU9-koKlySVzC0HW02keanPz5fj4iA9gzpbzFst5QuCLBrjPNEQVlbe6_1T0ckuny8FTmFuJrsLS2cuNVhBdnBU7va63dyuA2rnInBSnjS74gtQ7hBr2hX1lla1HDd8t9fF2h6xnBq6exEPGJd4m2ghPHzqbei5Ar3ZLc_YTsKv1s";
    String url = "$URL_SERVEUR/api/emploi";
    // String url = "https://admin.invest--partners.com/api/user/${prefs.getString("userToken")}/membres";

    // print('postedprefs  ${prefs.getString("userToken")}');
    Map<String, String> headers = {"Content-type": "application/json"};
// if you want to pass json along with it
    // make POST request
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    // check the status code for the result
    var jsonInput = json.decode(response.body);

    if(response.statusCode == 200)
    {
      print('Response body 200 __: ${response.statusCode}');
      print('Response body 200 __: ${response.body}');
      List<EmploieModel> data = (jsonInput as List)
          .map((p) => EmploieModel.fromJson(p))
          .toList();
      // print('Response body __: ${_projetModel}');
      // print('Response body: ${response.body}');
      print('Response bodqsdqsy 200 __:}');
      return data;
    }
    else
    {
      print('Response body: ${response.body}');
      return null;
    }

  }


}