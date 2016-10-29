library logistic_ui.logistic_app;

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2_components/angular2_components.dart';

import 'package:logistic_ui/providers.dart';
import 'package:logistic_ui/component/header_panel.dart';
import 'package:logistic_ui/component/footer_panel.dart';
import 'package:logistic_ui/component/user/user_panel.dart';
import 'package:logistic_ui/component/user/user_detail.dart';

@Component(
    selector: 'logistic-app',
    templateUrl: 'logistic_app.html',
    directives: const [ROUTER_DIRECTIVES, materialDirectives, HeaderPanel, FooterPanel],
    providers: materialProviders,
    viewProviders: const [LOGISTIC_SERVICE_PROVIDERS])
@RouteConfig(const [
  const Route(path: '/', component: HomeComp, name: 'Home'),
  const Route(path: '/about', component: About, name: 'About'),
  const Route(path: '/user', component: UserPanel, name: 'Users'),
  const Route(path: '/user/:id', component: UserDetail, name: 'UserDetail'),
])
class LogisticApp implements AfterViewInit {
  @ViewChild(HeaderPanel)
  HeaderPanel headerPanel;
  bool isLoading = true;

  @ViewChild(FooterPanel)
  FooterPanel footerPanel;

  Router router;

  LogisticApp(Router this.router) {}

  void ngAfterViewInit() {
    isLoading = false;
  }

  void goAbout() {
    router.navigate(['About']);
  }
}

@Component(selector: 'd')
@View(template: '<div>Welcome {{name}}!</div>')
class HomeComp {
  String name = "App";
  HomeComp() : name = 'Logistic Application' {}
}

@Component(selector: 'about-h')
@View(template: '<div>&copy;  2016 - Logistic App</div>')
class About {}
