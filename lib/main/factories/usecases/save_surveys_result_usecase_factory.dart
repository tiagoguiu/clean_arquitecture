import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

SaveSurveyResult makeRemoteSaveSurveyResult({required String id}) => RemoteSaveSurveyResult(
    httpClient: makeAuthorizedHttpClientDecorator(),
    url: makeApiUrl('surveys/$id/results'),
    );
