import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Modals/biodata.dart';

class BiodataProvider with ChangeNotifier {
  List<BioData> biodataList = [];

  Future getBioData() async {
    try {
      final url = Uri.parse("https://api.sampleapis.com/futurama/characters");
      final response = await get(url);
      List<BioData> demobiodataList = [];
      final List responsedata = json.decode(response.body);
      if (response.statusCode == 200) {
        responsedata.forEach((element) {
          return demobiodataList.add(BioData(
              fullName: Name(
                first: element["name"]["first"],
                last: element["name"]["last"],
                middle: element["name"]["middle"],
              ),
              image: BioImages(
                headshot: element["images"]["head-shot"],
                main: element["images"]["main"],
              ),
              gender: element["gender"],
              homePlanet: element["homePlanet"],
              occupation: element["occupation"],
              species: element["species"],
              sayings: (element["sayings"] as List)
                  .map((e) => e.toString())
                  .toList()));
        });
        biodataList = demobiodataList;
        notifyListeners();
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
