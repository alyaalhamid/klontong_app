import 'dart:convert';

import 'package:klontong_app/APIKLONTONG.dart';
import 'package:http/http.dart' as http;

class ApiKlontongDetail {
  Future<List<klontong>?> getklontongDetail(String id) async {
    try {
      final response = await http.get(Uri.parse(
          'https://crudcrud.com/api/3a1b0f848e3a4ee98c5af14985f6c9bd/users/id/'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var getKLontongdatadetail = jsonData as List;
        var listklontongdatadetail =
            getKLontongdatadetail.map((i) => klontong.fromJson(i)).toList();
        return listklontongdatadetail;
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
