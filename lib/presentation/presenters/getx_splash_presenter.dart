import 'package:get/get.dart';

import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';

class GetxSplashPresenter implements SplashPresenter {

  final LoadCurrentAccount loadCurrentAccount;
  var _navigateTo = RxString("no_error");


  GetxSplashPresenter({
    required this.loadCurrentAccount,
  });

  Stream<String> get navigateToStream => _navigateTo.stream;


  Future<void> checkAccount()async{
    await Future.delayed(Duration(seconds: 2));
    try {
        final account = await loadCurrentAccount.load();
        _navigateTo.value = account.token == '' ? '/login' : '/surveys';
      
    } catch (e) {
      _navigateTo.value = '/login';
    }
  }

}