class Character {
  late int id;
  late String name;
  late num height;
  late num mass;
  late String gender;
  late String homeworld;
  late String wiki;
  late String image;
  late num born;
  late num died;
  late String diedLocation;
  late String species;
  late String hairColor;
  late String eyeColor;
  late String skinColor;
  late List<String> affiliations;
  late List<String> masters;
  late List<String> apprentices;
  late List<String> formerAffiliations;

  Character(
      {required this.id,
      required this.name,
      required this.height,
      required this.mass,
      required this.gender,
      required this.homeworld,
      required this.wiki,
      required this.image,
      required this.born,
      required this.died,
      required this.diedLocation,
      required this.species,
      required this.hairColor,
      required this.eyeColor,
      required this.skinColor,
      required this.affiliations,
      required this.masters,
      required this.apprentices,
      required this.formerAffiliations});

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    height = json['height'] ?? double.minPositive;
    mass = json['mass'] ?? 0;
    gender = json['gender'];
    homeworld = "";
    wiki = json['wiki'];
    image = json['image'];
    born = json['born'] ?? 0;
    died = json['died'] ?? 0;
    diedLocation = json['diedLocation'] ?? "";
    species = json['species'];
    hairColor = json['hairColor'] ?? '';
    eyeColor = json['eyeColor'];
    skinColor = json['skinColor'] ?? '';
    affiliations = json['affiliations'].cast<String>();
    masters = json['masters'] != null ? json['masters'].cast<String>() : [];
    apprentices =
        json['apprentices'] != null ? json['apprentices'].cast<String>() : [];
    formerAffiliations = json['formerAffiliations'] != null
        ? json['formerAffiliations'].cast<String>()
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['height'] = this.height;
    data['mass'] = this.mass;
    data['gender'] = this.gender;
    data['homeworld'] = this.homeworld;
    data['wiki'] = this.wiki;
    data['image'] = this.image;
    data['born'] = this.born;
    data['died'] = this.died;
    data['diedLocation'] = this.diedLocation;
    data['species'] = this.species;
    data['hairColor'] = this.hairColor;
    data['eyeColor'] = this.eyeColor;
    data['skinColor'] = this.skinColor;
    data['affiliations'] = this.affiliations;
    data['masters'] = this.masters;
    data['apprentices'] = this.apprentices;
    data['formerAffiliations'] = this.formerAffiliations;
    return data;
  }
}
