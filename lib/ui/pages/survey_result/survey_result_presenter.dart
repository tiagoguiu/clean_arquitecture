import '../../helpers/errors/errors.dart';
import 'components/components.dart';

abstract class SurveyResultPresenter {
  Stream<bool> get isLoadingStream;
  Stream<bool> get isSessionExpiredStream;
  
  Stream<SurveyResultViewModel> get surveyResultStream;
  Stream<UiError> get surveyResultErrorStream;

  Future<void> loadData();
  Future<void> save({required String answer});
}
