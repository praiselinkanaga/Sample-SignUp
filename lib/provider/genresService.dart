import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import '../model/getGenresModel.dart';

class GenresService {
  Future<GetGenresModel?> getGenresApi() async {
    try {
      var response =
          await http.get(Uri.parse(Constants.baseUrl + Constants.userEndPoint));

      debugPrint(response.body);
      if (response.statusCode == 200) {
        return GetGenresModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load');
      }
    } on SocketException {
      throw Exception('Failed to load');
    }
  }
}
