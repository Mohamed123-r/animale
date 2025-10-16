import 'package:animals/features/home/domain/entities/breed_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repo/breed_repo.dart';
import 'breed_status.dart';

class BreedCubit extends Cubit<BreedState> {
  BreedCubit(this.breedRepo) : super(BreedInitial());

  final BreedRepo breedRepo;

  List<BreedEntity> breeds = [];
  int _currentPage = 0;
  final int _pageSize = 10;
  bool _isLoading = false;
  bool _hasReachedEnd = false;

  bool get hasReachedEnd => _hasReachedEnd;

  Future<void> fetchBreeds({bool isInitialLoad = false}) async {
    if (_isLoading || (!isInitialLoad && _hasReachedEnd)) return;

    _isLoading = true;

    if (isInitialLoad) {
      _currentPage = 0;
      _hasReachedEnd = false;
      breeds.clear();
    }

    emit(BreedLoading());

    try {
      final newBreeds = await breedRepo.getBreeds(
        limit: _pageSize,
        page: _currentPage,
      );

      if (newBreeds.length < _pageSize) {
        _hasReachedEnd = true;
      }

      breeds.addAll(newBreeds);
      _currentPage++;

      emit(BreedLoaded(List.from(breeds), hasMore: !_hasReachedEnd));
    } catch (e) {
      emit(BreedError(e.toString()));
    } finally {
      _isLoading = false;
    }
  }

  Future<void> fetchNewBreeds() async {
    if (_isLoading) return;

    emit(BreedLoading());
    try {
      final newBreeds = await breedRepo.getBreeds(
        limit: _pageSize,
        page: 0,
      );

      if (newBreeds.isNotEmpty && newBreeds.first.id != breeds.first.id) {
        final uniqueNew = newBreeds
            .where(
              (breed) => !breeds.any((existing) => existing.id == breed.id),
        )
            .toList();
        breeds.insertAll(0, uniqueNew);
        emit(BreedLoaded(breeds, hasMore: !_hasReachedEnd));
      }
    } catch (e) {
      emit(BreedError(e.toString()));
    }
  }

  Future<void> refreshBreeds() async {
    await fetchBreeds(isInitialLoad: true);
  }




  Future<void> searchBreeds(String query) async {

  try {
  if (query.isEmpty) {
    fetchBreeds(isInitialLoad: true);
  return;
  }
  final results = await breedRepo.searchBreeds(query: query, );
  breeds = results;
  _currentPage = 0;
  _hasReachedEnd = results.length < _pageSize;
  emit(BreedLoaded(breeds, hasMore: !_hasReachedEnd));
  } catch (e) {
  emit(BreedError(e.toString()));
  } finally {
  _isLoading = false;
  }
  }

}
