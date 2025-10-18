import '../../domain/entities/breed_entity.dart';
import '../models/breed_model.dart' hide Weight;

extension BreedModelMapper on BreedModel {
  BreedEntity toEntity() => BreedEntity(
    weight: Weight(imperial: weight?.imperial, metric: weight?.metric),
    id: id ?? '',
    name: name ?? '',
    origin: origin ?? '',
    description: description ?? '',
    lifeSpan: lifeSpan ?? '',
    reference_image_id: referenceImageId ?? '',
  );
}

extension BreedEntityMapper on BreedEntity {
  Map<String, dynamic> toJson() => {
    'weight': {
      'imperial': weight?.imperial ?? '',
      'metric': weight?.metric ?? '',
    },
    'id': id,
    'name': name,
    'origin': origin,
    'description': description,
    'life_span': lifeSpan,
    'reference_image_id': reference_image_id,
  };
}