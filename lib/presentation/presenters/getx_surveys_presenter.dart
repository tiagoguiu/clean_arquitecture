
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/helpers/helpers.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class GetxSurveysPresenter extends GetxController with LoadingManager, SessionManager, ErrorManager, NavigationManager implements SurveysPresenter {
  final LoadSurveys loadSurveys;

  final _surveys = Rx<List<SurveyViewModel>>([]);

  Stream<List<SurveyViewModel>> get surveyStream => _surveys.stream;

  GetxSurveysPresenter({required this.loadSurveys});

  Future<void> loadData() async {
    try {
      isLoading = true;
      addError = UiError.no_error;
      final surveys = await loadSurveys.load();
      _surveys.value = surveys
          .map(
            (survey) => SurveyViewModel(
              id: survey.id,
              question: survey.question,
              date: DateFormat('dd MM yyyy').format(survey.dateTime),
              didAnswer: survey.didAnswer,
            ),
          )
          .toList();
    } on DomainError catch(error) {
      if(error == DomainError.accessDenied){
        isSessionExpired = true;
      }else{
        addError = UiError.unexpected;
      }
    } finally {
      isLoading = false;
    }
  }
  
  Future<void> goToSurveyResult({required String surveyId}) async {
    navigateTo = '/survey_result/$surveyId';
  }
}
