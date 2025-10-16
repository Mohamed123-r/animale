import 'dart:convert';


BreedModel breedModelFromJson(String str) => BreedModel.fromJson(json.decode(str));
String breedModelToJson(BreedModel data) => json.encode(data.toJson());
class BreedModel {
  BreedModel({
      this.weight, 
      this.id, 
      this.name, 
      this.cfaUrl, 
      this.vetstreetUrl, 
      this.vcahospitalsUrl, 
      this.temperament, 
      this.origin, 
      this.countryCodes, 
      this.countryCode, 
      this.description, 
      this.lifeSpan, 
      this.indoor, 
      this.lap, 
      this.adaptability, 
      this.affectionLevel, 
      this.childFriendly, 
      this.catFriendly, 
      this.dogFriendly, 
      this.energyLevel, 
      this.grooming, 
      this.healthIssues, 
      this.intelligence, 
      this.sheddingLevel, 
      this.socialNeeds, 
      this.strangerFriendly, 
      this.vocalisation, 
      this.bidability, 
      this.experimental, 
      this.hairless, 
      this.natural, 
      this.rare, 
      this.rex, 
      this.suppressedTail, 
      this.shortLegs, 
      this.wikipediaUrl, 
      this.hypoallergenic, 
      this.referenceImageId,});

  BreedModel.fromJson(dynamic json) {
    weight = json['weight'] != null ? Weight.fromJson(json['weight']) : null;
    id = json['id'];
    name = json['name'];
    cfaUrl = json['cfa_url'];
    vetstreetUrl = json['vetstreet_url'];
    vcahospitalsUrl = json['vcahospitals_url'];
    temperament = json['temperament'];
    origin = json['origin'];
    countryCodes = json['country_codes'];
    countryCode = json['country_code'];
    description = json['description'];
    lifeSpan = json['life_span'];
    indoor = json['indoor'];
    lap = json['lap'];
    adaptability = json['adaptability'];
    affectionLevel = json['affection_level'];
    childFriendly = json['child_friendly'];
    catFriendly = json['cat_friendly'];
    dogFriendly = json['dog_friendly'];
    energyLevel = json['energy_level'];
    grooming = json['grooming'];
    healthIssues = json['health_issues'];
    intelligence = json['intelligence'];
    sheddingLevel = json['shedding_level'];
    socialNeeds = json['social_needs'];
    strangerFriendly = json['stranger_friendly'];
    vocalisation = json['vocalisation'];
    bidability = json['bidability'];
    experimental = json['experimental'];
    hairless = json['hairless'];
    natural = json['natural'];
    rare = json['rare'];
    rex = json['rex'];
    suppressedTail = json['suppressed_tail'];
    shortLegs = json['short_legs'];
    wikipediaUrl = json['wikipedia_url'];
    hypoallergenic = json['hypoallergenic'];
    referenceImageId = json['reference_image_id'];
  }
  Weight? weight;
  String? id;
  String? name;
  String? cfaUrl;
  String? vetstreetUrl;
  String? vcahospitalsUrl;
  String? temperament;
  String? origin;
  String? countryCodes;
  String? countryCode;
  String? description;
  String? lifeSpan;
  num? indoor;
  num? lap;
  num? adaptability;
  num? affectionLevel;
  num? childFriendly;
  num? catFriendly;
  num? dogFriendly;
  num? energyLevel;
  num? grooming;
  num? healthIssues;
  num? intelligence;
  num? sheddingLevel;
  num? socialNeeds;
  num? strangerFriendly;
  num? vocalisation;
  num? bidability;
  num? experimental;
  num? hairless;
  num? natural;
  num? rare;
  num? rex;
  num? suppressedTail;
  num? shortLegs;
  String? wikipediaUrl;
  num? hypoallergenic;
  String? referenceImageId;
BreedModel copyWith({  Weight? weight,
  String? id,
  String? name,
  String? cfaUrl,
  String? vetstreetUrl,
  String? vcahospitalsUrl,
  String? temperament,
  String? origin,
  String? countryCodes,
  String? countryCode,
  String? description,
  String? lifeSpan,
  num? indoor,
  num? lap,
  num? adaptability,
  num? affectionLevel,
  num? childFriendly,
  num? catFriendly,
  num? dogFriendly,
  num? energyLevel,
  num? grooming,
  num? healthIssues,
  num? intelligence,
  num? sheddingLevel,
  num? socialNeeds,
  num? strangerFriendly,
  num? vocalisation,
  num? bidability,
  num? experimental,
  num? hairless,
  num? natural,
  num? rare,
  num? rex,
  num? suppressedTail,
  num? shortLegs,
  String? wikipediaUrl,
  num? hypoallergenic,
  String? referenceImageId,
}) => BreedModel(  weight: weight ?? this.weight,
  id: id ?? this.id,
  name: name ?? this.name,
  cfaUrl: cfaUrl ?? this.cfaUrl,
  vetstreetUrl: vetstreetUrl ?? this.vetstreetUrl,
  vcahospitalsUrl: vcahospitalsUrl ?? this.vcahospitalsUrl,
  temperament: temperament ?? this.temperament,
  origin: origin ?? this.origin,
  countryCodes: countryCodes ?? this.countryCodes,
  countryCode: countryCode ?? this.countryCode,
  description: description ?? this.description,
  lifeSpan: lifeSpan ?? this.lifeSpan,
  indoor: indoor ?? this.indoor,
  lap: lap ?? this.lap,
  adaptability: adaptability ?? this.adaptability,
  affectionLevel: affectionLevel ?? this.affectionLevel,
  childFriendly: childFriendly ?? this.childFriendly,
  catFriendly: catFriendly ?? this.catFriendly,
  dogFriendly: dogFriendly ?? this.dogFriendly,
  energyLevel: energyLevel ?? this.energyLevel,
  grooming: grooming ?? this.grooming,
  healthIssues: healthIssues ?? this.healthIssues,
  intelligence: intelligence ?? this.intelligence,
  sheddingLevel: sheddingLevel ?? this.sheddingLevel,
  socialNeeds: socialNeeds ?? this.socialNeeds,
  strangerFriendly: strangerFriendly ?? this.strangerFriendly,
  vocalisation: vocalisation ?? this.vocalisation,
  bidability: bidability ?? this.bidability,
  experimental: experimental ?? this.experimental,
  hairless: hairless ?? this.hairless,
  natural: natural ?? this.natural,
  rare: rare ?? this.rare,
  rex: rex ?? this.rex,
  suppressedTail: suppressedTail ?? this.suppressedTail,
  shortLegs: shortLegs ?? this.shortLegs,
  wikipediaUrl: wikipediaUrl ?? this.wikipediaUrl,
  hypoallergenic: hypoallergenic ?? this.hypoallergenic,
  referenceImageId: referenceImageId ?? this.referenceImageId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (weight != null) {
      map['weight'] = weight?.toJson();
    }
    map['id'] = id;
    map['name'] = name;
    map['cfa_url'] = cfaUrl;
    map['vetstreet_url'] = vetstreetUrl;
    map['vcahospitals_url'] = vcahospitalsUrl;
    map['temperament'] = temperament;
    map['origin'] = origin;
    map['country_codes'] = countryCodes;
    map['country_code'] = countryCode;
    map['description'] = description;
    map['life_span'] = lifeSpan;
    map['indoor'] = indoor;
    map['lap'] = lap;
    map['adaptability'] = adaptability;
    map['affection_level'] = affectionLevel;
    map['child_friendly'] = childFriendly;
    map['cat_friendly'] = catFriendly;
    map['dog_friendly'] = dogFriendly;
    map['energy_level'] = energyLevel;
    map['grooming'] = grooming;
    map['health_issues'] = healthIssues;
    map['intelligence'] = intelligence;
    map['shedding_level'] = sheddingLevel;
    map['social_needs'] = socialNeeds;
    map['stranger_friendly'] = strangerFriendly;
    map['vocalisation'] = vocalisation;
    map['bidability'] = bidability;
    map['experimental'] = experimental;
    map['hairless'] = hairless;
    map['natural'] = natural;
    map['rare'] = rare;
    map['rex'] = rex;
    map['suppressed_tail'] = suppressedTail;
    map['short_legs'] = shortLegs;
    map['wikipedia_url'] = wikipediaUrl;
    map['hypoallergenic'] = hypoallergenic;
    map['reference_image_id'] = referenceImageId;
    return map;
  }

}

/// imperial : "6 - 12"
/// metric : "3 - 7"

Weight weightFromJson(String str) => Weight.fromJson(json.decode(str));
String weightToJson(Weight data) => json.encode(data.toJson());
class Weight {
  Weight({
      this.imperial, 
      this.metric,});

  Weight.fromJson(dynamic json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }
  String? imperial;
  String? metric;
Weight copyWith({  String? imperial,
  String? metric,
}) => Weight(  imperial: imperial ?? this.imperial,
  metric: metric ?? this.metric,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imperial'] = imperial;
    map['metric'] = metric;
    return map;
  }

}