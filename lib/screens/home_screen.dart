import 'package:activitat1_4/data/countries.dart';
import 'package:activitat1_4/services/zippopotamus.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Selected selected = Selected(country: countries.first);
  final TextEditingController postalCode = TextEditingController();

  HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zippopoam API"),
        backgroundColor: const Color(0xFFFCA311),
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          CountrySelection(
            selectedCountry: selected,
          ),
          TextField(
            controller: postalCode,
            decoration: const InputDecoration(
              labelText: 'Postal Code',
            ),
          ),
          TextButton(
            onPressed: () {
              Zippopotamus(
                      countryCode: selected.country.code,
                      postalCode: postalCode.text)
                  .test();
            },
            child: const Text("Send"),
          )
        ],
      ),
    );
  }
}

class CountrySelection extends StatefulWidget {
  final Selected selectedCountry;
  const CountrySelection({
    super.key,
    required this.selectedCountry,
  });

  @override
  State<CountrySelection> createState() => _CountrySelectionState();
}

class _CountrySelectionState extends State<CountrySelection> {
  // Country _selected = countries.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: widget.selectedCountry.country,
      items: countries.map((country) {
        return DropdownMenuItem(
          value: country,
          child: Text(country.name),
        );
      }).toList(),
      onChanged: (country) {
        setState(() {
          if (country != null) widget.selectedCountry.country = country;
        });
      },
    );
  }
}
