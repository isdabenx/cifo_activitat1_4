import 'dart:convert';

Zippopoam zippopoamFromJson(String str) => Zippopoam.fromJson(json.decode(str));

String zippopoamToJson(Zippopoam data) => json.encode(data.toJson());

class Zippopoam {
  String? postCode;
  String country;
  String countryAbbreviation;
  List<Place> places;
  String? placeName;
  String? state;
  String? stateAbbreviation;

  Zippopoam({
    this.postCode,
    required this.country,
    required this.countryAbbreviation,
    required this.places,
    this.placeName,
    this.state,
    this.stateAbbreviation,
  });

  factory Zippopoam.fromJson(Map<String, dynamic> json) => Zippopoam(
        postCode: json["post code"],
        country: json["country"],
        countryAbbreviation: json["country abbreviation"],
        places: List<Place>.from(json["places"].map((x) => Place.fromJson(x))),
        placeName: json["place name"],
        state: json["state"],
        stateAbbreviation: json["state abbreviation"],
      );

  Map<String, dynamic> toJson() => {
        "post code": postCode,
        "country": country,
        "country abbreviation": countryAbbreviation,
        "places": List<dynamic>.from(places.map((x) => x.toJson())),
        "place name": placeName,
        "state": state,
        "state abbreviation": stateAbbreviation,
      };
}

class Place {
  String placeName;
  String longitude;
  String? state;
  String? stateAbbreviation;
  String latitude;
  String? postCode;

  Place({
    required this.placeName,
    required this.longitude,
    this.state,
    this.stateAbbreviation,
    required this.latitude,
    this.postCode,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        placeName: json["place name"],
        longitude: json["longitude"],
        state: json["state"],
        stateAbbreviation: json["state abbreviation"],
        latitude: json["latitude"],
        postCode: json["post code"],
      );

  Map<String, dynamic> toJson() => {
        "place name": placeName,
        "longitude": longitude,
        "state": state,
        "state abbreviation": stateAbbreviation,
        "latitude": latitude,
        "post code": postCode,
      };
}
