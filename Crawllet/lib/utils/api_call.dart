import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class ApiCall {
  fetchCryptoData() async {
    var client = http.Client();
    try {
      var res = await client.get(
          Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"));
      if (res.statusCode == 200) {
        return json.decode(res.body);
      } else if (res.statusCode == 502) {
        return const Text("Not Connected");
      }
    } catch (e) {
      return false;
    }
  }
}
