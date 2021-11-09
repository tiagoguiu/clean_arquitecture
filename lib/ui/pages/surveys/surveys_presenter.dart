import 'package:curso_manguinho/ui/helpers/errors/errors.dart';
import 'package:curso_manguinho/ui/pages/pages.dart';

abstract class SurveysPresenter {
  Stream<bool> get isLoadingStream;
  Stream<bool> get isSessionExpiredStream;
  
  Stream<List<SurveyViewModel>> get surveyStream;
  Stream<UiError> get surveysErrorStream;
  Stream<String> get navigateToStream;

  Future<void> loadData();
  Future<void> goToSurveyResult({required String surveyId});
}
