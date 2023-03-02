import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../data/network/base.dart';
import '../data/repository/quotes.dart';

@module
abstract class RegisterModule {
  @singleton
  InternetConnectionChecker get connectionChecker;

  @injectable
  ApiGatewayBase get spinFreeMasterApi;

  @injectable
  SpinFreeMasterRepository get spinFreeMasterRepository;
}
