import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../usecases/usecases.dart';

SurveyResultPresenter makeGetxSurveyResultPresenter(String surveyId) {
  return GetxSurveyResultPresenter(
    loadSurveyResult: makeRemoteLoadSurveyResultWithLocalFallBack(id: surveyId),
    surveyId: surveyId,
    saveSurveyResult: makeRemoteSaveSurveyResult(id: surveyId),
  );
}
