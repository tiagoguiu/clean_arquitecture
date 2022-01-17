import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

/*LoginPresenter makeStreamLoginPresenter(){
  return StreamLoginPresenter(
    validation: makeLoginValidation(), authentication: makeLoginAuthentication());
}*/
LoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
      validation: makeLoginValidation(),
      authentication: makeLoginAuthentication(),
      saveCurrentAccount: makeLocalSaveAccount());
}
