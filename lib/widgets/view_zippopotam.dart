import 'package:activitat1_4/models/zippopotam.dart';
import 'package:activitat1_4/widgets/detailed_zippopotam.dart';
import 'package:flutter/material.dart';

class ViewZippopotam extends StatefulWidget {
  const ViewZippopotam({
    super.key,
  });

  @override
  State<ViewZippopotam> createState() => ViewZippopotamState();
}

class ViewZippopotamState extends State<ViewZippopotam> {
  Zippopoam? zippopoam;

  void updateView(Zippopoam? newZippopoam) {
    setState(() {
      zippopoam = newZippopoam;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: zippopoam == null,
      child: DetailedZippopotam(zippopoam: zippopoam),
    );
  }
}
