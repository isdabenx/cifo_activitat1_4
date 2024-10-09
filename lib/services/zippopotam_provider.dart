import 'package:activitat1_4/models/zippopotam.dart';
import 'package:http/http.dart' as http;

class ZippopotamProvider {
  static const String scheme = 'https';
  static const String host = 'api.zippopotam.us';
  String countryCode;
  String state;
  String city;
  String postalCode;

  ZippopotamProvider(
      {required this.countryCode,
      required this.state,
      required this.city,
      required this.postalCode});

  Future<Zippopoam> fetch() async {
    List<String> pathSegments = [countryCode];

    if (state.isNotEmpty && city.isNotEmpty) {
      pathSegments.addAll([state, city]);
    } else if (postalCode.isNotEmpty) {
      pathSegments.add(postalCode);
    }

    http.Response response = await http
        .get(Uri(scheme: scheme, host: host, pathSegments: pathSegments));
    final Zippopoam zippopoam = zippopoamFromJson(response.body);
    return zippopoam;
  }
}
