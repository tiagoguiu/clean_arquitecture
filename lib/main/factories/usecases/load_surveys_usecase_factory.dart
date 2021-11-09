import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../../composites/composites.dart';
import '../factories.dart';

RemoteLoadSurveys makeRemoteLoadSurveys() => RemoteLoadSurveys(
      httpClient: makeAuthorizedHttpClientDecorator(),
      url: makeApiUrl('surveys'),
    );

LocalLoadSurveys makeLocalLoadSurveys() => LocalLoadSurveys(
      cacheStorage: makeLocalStorageAdapter(),
    );

LoadSurveys makeRemoteLoadSurveysWithLocalFallBack() => RemoteLoadSurveysWithLocalFallBack(
      local: makeLocalLoadSurveys(),
      remote: makeRemoteLoadSurveys(),
    );