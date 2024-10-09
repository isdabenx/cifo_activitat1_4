import 'package:activitat1_4/data/countries.dart';
import 'package:activitat1_4/models/zippopotam.dart';
import 'package:activitat1_4/services/zippopotam_provider.dart';
import 'package:activitat1_4/widgets/country_selection.dart';
import 'package:activitat1_4/widgets/view_zippopotam.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Selected selected = Selected(country: countries.first);
  final TextEditingController postalCode = TextEditingController();
  final TextEditingController stateAbbreviation = TextEditingController();
  final TextEditingController city = TextEditingController();
  final GlobalKey<ViewZippopotamState> viewZippopotamKey =
      GlobalKey<ViewZippopotamState>();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
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
              TextField(
                controller: stateAbbreviation,
                decoration:
                    const InputDecoration(labelText: "State Abbreviation"),
              ),
              TextField(
                controller: city,
                decoration: const InputDecoration(labelText: "City"),
              ),
              TextButton(
                onPressed: () {
                  if (postalCode.text.isNotEmpty ||
                      (city.text.isNotEmpty &&
                          stateAbbreviation.text.isNotEmpty)) {
                    Future<Zippopoam> zippopoam = ZippopotamProvider(
                      countryCode: selected.country.code,
                      postalCode: postalCode.text,
                      city: city.text,
                      state: stateAbbreviation.text,
                    ).fetch();
                    zippopoam
                        .then((Zippopoam zippopoamResult) => viewZippopotamKey
                            .currentState
                            ?.updateView(zippopoamResult))
                        .catchError((error) {
                      viewZippopotamKey.currentState?.updateView(null);
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        duration: const Duration(seconds: 10),
                        content: Card(
                          color: Colors.red.shade200,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Para continuar, debes proporcionar los siguientes datos:\n"
                              "\t- Opción 1: El país y el código postal.\n"
                              "\t- Opción 2: El país, la abreviación del estado y la ciudad.\n"
                              "Por favor, asegúrate de ingresar la información correctamente antes de proceder.",
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: const Text("Send"),
              ),
              const SizedBox(height: 20),
              ViewZippopotam(
                key: viewZippopotamKey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
