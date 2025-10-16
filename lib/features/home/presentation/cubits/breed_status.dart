import 'package:animals/features/home/domain/entities/breed_entity.dart';

abstract class BreedState {}

class BreedInitial extends BreedState {}

class BreedLoading extends BreedState {}

class BreedLoaded extends BreedState {
  final List<BreedEntity> breeds;
  final bool hasMore;
  BreedLoaded(this.breeds,{required this.hasMore});
}

class BreedError extends BreedState {
  final String message;
  BreedError(this.message);
}