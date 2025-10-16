// Entity: Domain representation for Breed

class BreedEntity {
  final Weight weight;
  final String id;
  final String name;

  final String origin;

  final String description;
  final String lifeSpan;
  final String reference_image_id;

  const BreedEntity({
    required this.reference_image_id,
    required this.weight,
    required this.id,
    required this.name,

    required this.origin,

    required this.description,
    required this.lifeSpan,
  });
}

class Weight {
  final String? imperial;
  final String? metric;

  const Weight({this.imperial, this.metric});
}
