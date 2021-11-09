import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../../composites/composites.dart';
import '../factories.dart';

RemoteLoadSurveyResult makeRemoteLoadSurveyResult({required String id}) => RemoteLoadSurveyResult(
      httpClient: makeAuthorizedHttpClientDecorator(),
      url: makeApiUrl('surveys/$id/results'),
    );

LocalLoadSurveyResult makeLocalLoadSurveyResult({required String id}) => LocalLoadSurveyResult(
      cacheStorage: makeLocalStorageAdapter(),
    );

LoadSurveyResult makeRemoteLoadSurveyResultWithLocalFallBack({required String id}) => RemoteLoadSurveyResultWithLocalFallBack(
      remote: makeRemoteLoadSurveyResult(id: id),
      local: makeLocalLoadSurveyResult(id: id),
    );
