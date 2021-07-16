import 'dart:convert';
import 'package:pic_a_picture_app/utils/scr.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

//To get the pics from pixabay
Future<Map> getPics( String category) async {
  String url = 'https://pixabay.com/api/?key=$apiKey&q=$category&image_type=photo&pretty=true';
  print(url);
  http.Response response = await http.get(url);
  return json.decode(response.body);
}
