library logistic_ui.request_stub;

import 'dart:async';
import 'package:dartson/dartson.dart';
import 'package:angular2/angular2.dart';
import 'package:logistic_ui/model.dart';
import 'package:logistic_ui/request.dart';

@Injectable()
class ApplicationServiceStub extends ApplicationService {
  Future<ApplicationInfo> getApplicationInfo() {
    ApplicationInfo appInfo = new ApplicationInfo(
        name: "App Stub",
        version: "0.0.1.DEV-MODE",
        buildInfo: new ApplicationBuildInfo(
            revision: "000-local", branch: "none", buildTime: new DateTime.now()));
    return (new Completer<ApplicationInfo>()..complete(appInfo)).future;
  }
}
