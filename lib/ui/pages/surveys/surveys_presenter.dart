import '../../../presentation/mixins/mixins.dart';
import '../../helpers/errors/errors.dart';
import '../pages.dart';

abstract class SurveysPresenter {
  Stream<bool> get isLoadingStream;
  Stream<bool> get isSessionExpiredStream;

  Stream<List<SurveyViewModel>> get surveyStream;
  Stream<UiError> get surveysErrorStream;
  Stream<NavigationArguments> get navigateToWithArgsStream;

  Future<void> loadData();
  Future<void> goToSurveyResult({required String surveyId});
}
