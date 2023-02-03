class BioData {
  Name? fullName;
  BioImages? image;
  String? gender;
  String? species;
  String? homePlanet;
  String? occupation;
  List<String>? sayings;
  BioData(
      {this.fullName,
      this.gender,
      this.homePlanet,
      this.image,
      this.occupation,
      this.sayings,
      this.species});
}

class Name {
  String? first;
  String? middle;
  String? last;
  Name({this.first, this.last, this.middle});
}

class BioImages {
  String? headshot;
  String? main;
  BioImages({this.headshot, this.main});
}
