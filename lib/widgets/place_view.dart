import 'package:activitat1_4/models/zippopotam.dart';
import 'package:activitat1_4/widgets/row_key_value.dart';
import 'package:flutter/material.dart';

class PlacesView extends StatelessWidget {
  const PlacesView({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) return const Text("No places found");
    return Column(children: [
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          "Places:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      ...places.map((place) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(children: [
              RowKeyValue(label: "Name", value: place.placeName),
              if (place.postCode != null)
                RowKeyValue(label: "Postal Code", value: place.postCode!),
              if (place.state != null)
                RowKeyValue(label: "State", value: place.state!),
              if (place.stateAbbreviation != null)
                RowKeyValue(
                    label: "State Abbreviation",
                    value: place.stateAbbreviation!),
              RowKeyValue(label: "Longitude", value: place.longitude),
              if (place.latitude.isNotEmpty)
                RowKeyValue(label: "Latitude", value: place.latitude),
            ]),
          ),
        );
      })
    ]);
  }
}
