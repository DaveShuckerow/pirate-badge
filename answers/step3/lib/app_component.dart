import 'package:angular2/core.dart';

import 'badge_component.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    directives: const [BadgeComponent])
class AppComponent {
  var name = 'Angular';
}
