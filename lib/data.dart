import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:neurocare_task/drug.dart';

class Data {
  getData(String drugName) async {
    var response = await http.get(
        Uri.parse(
            'https://dailymed.nlm.nih.gov/dailymed/services/v2/drugnames.json?drug_name=$drugName'),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*',
          "Access-Control-Allow-Origin":
              "*", // Required for CORS support to work
          // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        });
    print('data' + response.body);
    var responseJson = json.decode(response.body);
    responseJson = responseJson['data'];
    return (responseJson as List).map((e) => Drug.fromJson(e)).toList();
  }
}
