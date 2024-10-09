import 'package:activitat1_4/models/zippopotam.dart';
import 'package:activitat1_4/widgets/place_view.dart';
import 'package:activitat1_4/widgets/row_key_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';

class DetailedZippopotam extends StatefulWidget {
  final Zippopoam? zippopoam;
  const DetailedZippopotam({super.key, this.zippopoam});

  @override
  State<DetailedZippopotam> createState() => _DetailedZippopotamState();
}

class _DetailedZippopotamState extends State<DetailedZippopotam> {
  @override
  Widget build(BuildContext context) {
    Zippopoam? zippopoam = widget.zippopoam;
    if (zippopoam == null) {
      return const Text("No data");
    }
    return Column(
      children: [
        if (zippopoam.placeName != null)
          RowKeyValue(label: "Name", value: zippopoam.placeName!),
        if (zippopoam.state != null)
          RowKeyValue(label: "State", value: zippopoam.state!),
        if (zippopoam.stateAbbreviation != null)
          RowKeyValue(
              label: "State Abbreviation", value: zippopoam.stateAbbreviation!),
        if (zippopoam.postCode != null)
          RowKeyValue(label: "Postal Code", value: zippopoam.postCode!),
        RowKeyValue(label: "Country", value: zippopoam.country),
        RowKeyValue(
            label: "Country Abbreviation",
            value: zippopoam.countryAbbreviation),
        PlacesView(places: zippopoam.places),
        const Divider(),
        const SizedBox(height: 20),
        JsonView.map(
          zippopoam.toJson(),
          theme: JsonViewTheme(
            errorBuilder: (context, object) => Text(
              "$object",
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ),
        ExpansionTile(
          title: const Text(
            "Response",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: const Icon(Icons.info),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(zippopoam.toJson().toString()),
            )
          ],
        ),
      ],
    );
  }
}
