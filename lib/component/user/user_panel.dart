import 'package:angular2/angular2.dart';

import 'package:logistic_ui/model.dart';
import 'package:logistic_ui/providers.dart';
import 'package:logistic_ui/request.dart';

@Component(selector: 'user-panel', templateUrl: 'user_panel.html', viewProviders: const [LOGISTIC_SERVICE_PROVIDERS])
class UserPanel implements AfterViewInit {
  List<User> users;
  User selectedUser;
  ApplicationService applicationService;

  UserPanel(this.applicationService);

  void ngAfterViewInit() {
    applicationService.getUsers().then((List<User> users) {
      this.users = users;
    });
  }

  void set data(List<User> users) {
    this.users = users;
  }

  void onSelect(User user) {
    this.selectedUser = user;
  }
}
