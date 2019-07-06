import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/utilities/hidden_constants.dart';

class NetworkHelper{
  NetworkHelper({this.url});
  final String url;

Future getData() async{
  http.Response response = await http.get(url);
  if(response.statusCode == 200){
    String data = response.body;
    return jsonDecode(data);
  }else{
    print('Something went wrong: ');
    print(response.statusCode);
  }
}
}