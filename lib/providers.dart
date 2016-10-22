library logistic_ui.providers;

import 'package:angular2/angular2.dart';

import 'package:logistic_ui/request.dart';
import 'package:logistic_ui/stub/request_stub.dart';

const List<dynamic> LOGISTIC_SERVICE_PROVIDERS = const [
  const Provider(ApplicationService, useClass: ApplicationServiceStub),
];
