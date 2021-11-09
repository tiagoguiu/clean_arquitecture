import 'package:get/get.dart';

import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/helpers/helpers.dart';
import '../../ui/pages/pages.dart';
import '../../ui/pages/survey_result/components/components.dart';
import '../helpers/helpers.dart';

class GetxSurveyResultPresenter extends GetxController implements SurveyResultPresenter {
  final LoadSurveyResult loadSurveyResult;
  final SaveSurveyResult saveSurveyResult;
  final String surveyId;

  final _isLoading = true.obs;
  final _isSession = false.obs;
  final _surveys = Rx<SurveyResultViewModel>(SurveyResultViewModel.empty());
  final _surveysError = Rx<UiError>(UiError.no_error);

  Stream<UiError> get surveyResultErrorStream => _surveysError.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;
  Stream<bool> get isSessionExpiredStream => _isSession.stream;
  Stream<SurveyResultViewModel> get surveyResultStream => _surveys.stream;

  GetxSurveyResultPresenter({
    required this.loadSurveyResult,
    required this.saveSurveyResult,
    required this.surveyId,
  });

  Future<void> loadData() async {
    showResult(() => loadSurveyResult.loadBySurvey(surveyId: surveyId));
  }

  Future<void> save({required String answer}) async {
    showResult(() => saveSurveyResult.save(answer: answer));
  }

  Future<void> showResult(Future<SurveyResultEntity> action()) async {
    try {
      _surveysError.subject.add(UiError.no_error);
      _isLoading.value = true;
      final surveyResult = await action();
      _surveys.subject.add(surveyResult.toViewModel());
    } on DomainError catch (error) {
      if (error == DomainError.accessDenied) {
        _isSession.value = true;
      } else {
        _surveysError.subject.add(UiError.unexpected);
      }
    } finally {
      _isLoading.value = false;
    }
  }
}

