import 'package:curso_manguinho/main/factories/usecases/usecases.dart';

import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';


SurveysPresenter makeGetxSurveysPresenter() {
  return GetxSurveysPresenter(
    loadSurveys :  makeRemoteLoadSurveysWithLocalFallBack(),
  );
}
