import 'package:http/http.dart';
import 'dart:convert';

class network {
  String url;
  network(this.url);

  Future getdata() async {
    Response res = await get(Uri.parse(url));
    if (res.statusCode == 200) {
      String data = res.body;
      return jsonDecode(data);
    } else
      print(res.statusCode);
  }
}
