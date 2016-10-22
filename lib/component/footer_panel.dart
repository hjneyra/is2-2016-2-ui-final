library logistic_ui.footer_panel;

import 'package:angular2/angular2.dart';

import 'package:logistic_ui/request.dart';
import 'package:logistic_ui/providers.dart';
import 'package:logistic_ui/model.dart';
import 'package:logistic_ui/component/popup_dialog.dart';

@Component(selector: 'footer-panel', viewProviders: const [LOGISTIC_SERVICE_PROVIDERS])
@View(templateUrl: 'footer_panel.html', directives: const[NgIf, NgFor, PopupDialog])
class FooterPanel implements AfterViewInit {
  ApplicationService applicationService;
  ApplicationInfo applicationInfo;
  User user;

  FooterPanel(ApplicationService this.applicationService);

  void ngAfterViewInit() {
    applicationService.getApplicationInfo().then((ApplicationInfo appInfo) {
      applicationInfo = appInfo;
    });
    applicationService.getUser(1).then((User _user) {
      print("USER: $_user");
      this.user = _user;
    });
  }

  void openAppInfoDialog(var event) {

  }
}
