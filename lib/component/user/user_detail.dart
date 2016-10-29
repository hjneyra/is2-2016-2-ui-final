import 'dart:async';
import 'dart:html';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2_components/angular2_components.dart';

import 'package:logistic_ui/model.dart';
import 'package:logistic_ui/providers.dart';
import 'package:logistic_ui/request.dart';

@Component(
    selector: 'user-detail',
    templateUrl: 'user_detail.html',
    directives: const [materialDirectives],
    providers: materialProviders,
    viewProviders: const [LOGISTIC_SERVICE_PROVIDERS])
class UserDetail implements OnInit {
  User user;
  ApplicationService applicationService;

  final RouteParams _routeParams;

  UserDetail(this.applicationService, this._routeParams);

  Future<Null> ngOnInit() async {
    var idString = _routeParams.get('id');
    var id = int.parse(idString, onError: (_) => null);
    if (id != null) user = await (applicationService.getUser(id));
  }

  Future<Null> save() async {
    print("user: $user");
    await applicationService.update(user);
    goBack();
  }

  void goBack() {
    window.history.back();
  }
}
