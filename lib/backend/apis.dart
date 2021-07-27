import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class BaseApis {
  Future<void> getCoinbase(
    String name,
    String desc,
    String amount,
  );
  Future<void> getFinNews();
  Future<String> getIp();
}

class AllApis implements BaseApis {
  @override
  Future<void> getCoinbase(
    String name,
    String desc,
    String amount,
  ) async {
    String todoKey = "55114629-17d8-4c75-ab84-f678f5347c3e";
    Map<String, String> headers = {
      'Content-type': 'application/json',
      "X-CC-Api-Key": todoKey,
      "X-CC-Version": "2018-03-22",
    };

    Map<String, dynamic> chargeBody = {
      "name": name,
      "description": desc,
      "pricing_type": "fixed_price",
      "local_price": {
        "amount": amount,
        "currency": "USD",
      },
    };
    String url = "https://api.commerce.coinbase.com/charges";

    http.Response response = await http.post(
      (Uri.parse(url)),
      headers: headers,
      body: jsonEncode(chargeBody),
    );
    var res = jsonDecode(response.body)["data"];
    // print(res);

    print("addresses");
    print(res["addresses"]);
    // print("code");

    return res;
    // print(res["code"]);
    // print("exchange_rates");
    // print(res["exchange_rates"]);
    // print("pricing");
    // print(res["pricing"]);
  }

  @override
  Future<List<dynamic>> getFinNews() async {
    String apiKey = "c3nbcf2ad3iabnjj6md0";
    // String apiKey2 = "c3no7o2ad3iabnjjem70";

    String url =
        "https://finnhub.io/api/v1/news?category=general&token=$apiKey";

    http.Response response = await http.get(
      (Uri.parse(url)),
    );

    var body = jsonDecode(response.body);
    // print(body);
    print("len is ${body.length}");
    return body;
    // print(body["articles"][1]["title"]);
  }

  @override
  Future<String> getIp() async {
    String url = "https://api64.ipify.org?format=json";

    http.Response response = await http.get(
      (Uri.parse(url)),
    );

    var body = jsonDecode(response.body);
    print("ip is ${body["ip"]}");
    return body["ip"];
  }
}
