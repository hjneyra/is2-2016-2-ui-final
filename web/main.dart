library logistic_ui.main;

import 'package:angular2/platform/browser.dart';
import 'package:angular2/router.dart';
import 'package:angular2/core.dart';
import 'package:angular2/platform/common.dart';
import 'package:dartson/dartson.dart';
import 'package:logistic_ui/component/logistic_app.dart';

main() {
  bootstrap(LogisticApp, [ROUTER_PROVIDERS, new Provider(LocationStrategy, useClass: HashLocationStrategy)]);
}
