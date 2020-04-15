import 'dart:convert';
import 'package:http/http.dart' as http;

class NetHelper{
NetHelper({this.country});
String country ;

  Future<dynamic> getData() async {
    http.Response response = await http.get(
        'https://corona.lmao.ninja/v2/countries/$country');
    if(response.statusCode==200){
      dynamic data = response.body;
      return  jsonDecode(data);
    } else{
      return response.statusCode;
    }
  }
}