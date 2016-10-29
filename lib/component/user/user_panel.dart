import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2_components/angular2_components.dart';

import 'package:logistic_ui/model.dart';
import 'package:logistic_ui/providers.dart';
import 'package:logistic_ui/request.dart';

@Component(
    selector: 'user-panel',
    templateUrl: 'user_panel.html',
    directives: const [materialDirectives],
    providers: materialProviders,
    viewProviders: const [LOGISTIC_SERVICE_PROVIDERS])
class UserPanel implements AfterViewInit {
  User selectedUser;
  List<User> users;
  ApplicationService applicationService;
  final Router _router;

  UserPanel(this.applicationService, this._router);

  void ngAfterViewInit() {
    applicationService.getUsers().then((List<User> users) {
      this.users = users;
    });
  }

  void onSelect(User user) {
    selectedUser = user;
  }

  Future<Null> gotoDetail() => _router.navigate([
    'UserDetail',
    {'id': selectedUser.id.toString()}
  ]);
}
