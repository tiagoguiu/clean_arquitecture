import 'package:get/get.dart';

mixin SessionManager on GetxController{
  final _session = false.obs;
  Stream<bool> get isSessionExpiredStream => _session.stream;
  set isSessionExpired(bool value) => _session.value = value;
}