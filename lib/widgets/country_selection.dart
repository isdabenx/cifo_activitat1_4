import 'package:activitat1_4/data/countries.dart';
import 'package:flutter/material.dart';

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
