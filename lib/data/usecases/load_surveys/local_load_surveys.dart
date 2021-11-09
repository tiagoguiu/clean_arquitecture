import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/load_surveys.dart';
import '../../cache/cache.dart';
import '../../models/models.dart';

class LocalLoadSurveys implements LoadSurveys {
  final CacheStorage cacheStorage;

  LocalLoadSurveys({
    required this.cacheStorage,
  });

  Future<List<SurveyEntity>> load() async {
    try {
      final data = await cacheStorage.fetch(key : 'surveys');
      if (data.isEmpty) {
        throw Exception();
      }
      return _mapToEntity(data);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }

  Future<void> validate() async {
    try {
      final data = await cacheStorage.fetch(key :'surveys');
      _mapToEntity(data);
    } catch (e) {
      await cacheStorage.delete(key :'surveys');
    }
  }

  Future<void> save(List<SurveyEntity> surveys) async {
    try {
      await cacheStorage.save(key: 'surveys', value: _mapToJson(surveys));
    } catch (e) {
      throw DomainError.unexpected;
      }
  }

  List<SurveyEntity> _mapToEntity(List<Map> list) =>
      list.map<SurveyEntity>((json) => LocalSurveyModel.fromJson(json).toEntity()).toList();

  List<Map> _mapToJson(List<SurveyEntity> list) =>
      list.map((entity) => LocalSurveyModel.fromEntity(entity).toJson()).toList();
}