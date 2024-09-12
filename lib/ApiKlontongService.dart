import 'dart:convert';

import 'package:klontong_app/APIKLONTONG.dart';
import 'package:http/http.dart' as http;

class ApiKlontongService {
  Future<List<klontong>?> getklontong() async {
    try {
      final response = await http.get(Uri.parse(
          'https://crudcrud.com/api/3a1b0f848e3a4ee98c5af14985f6c9bd/users'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var getKLontongdata = jsonData as List;
        var listklontongdata =
            getKLontongdata.map((i) => klontong.fromJson(i)).toList();
        return listklontongdata;
        // var jsondata = jsonDecode(response.body) as Map<String, dynamic>;
        // return klontong.fromJson(jsondata);
      } else {
        throw Exception('Failed to report data');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
