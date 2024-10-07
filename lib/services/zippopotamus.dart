import 'package:http/http.dart' as http;

class Zippopotamus {
  static const String scheme = 'https';
  static const String host = 'api.zippopotam.us';
  String countryCode;
  String? state;
  String? city;
  String? postalCode;

  Zippopotamus(
      {required this.countryCode, this.state, this.city, this.postalCode});

  void test() async {
    List<String> pathSegments = [countryCode];

    if (postalCode != null) pathSegments.add(postalCode!);

    var response = await http
        .get(Uri(scheme: scheme, host: host, pathSegments: pathSegments));
    print(response.body);
  }
}
