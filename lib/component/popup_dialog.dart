library logistic_ui.footer_panel;

import 'package:angular2/angular2.dart';

import 'package:logistic_ui/request.dart';
import 'package:logistic_ui/providers.dart';
import 'package:logistic_ui/model.dart';

@Component(selector: 'popup-dialog')
@View(templateUrl: 'popup_dialog.html', directives: const[NgIf, NgFor])
class PopupDialog implements AfterViewInit {
  void ngAfterViewInit() {
  }
}
