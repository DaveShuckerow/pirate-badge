import 'package:angular2/core.dart';

@Component(
    selector: 'pirate-badge',
    templateUrl: 'badge_component.html',
    styleUrls: const ['badge_component.css'])
class BadgeComponent {
  String badgeName = 'Sergey';
  String buttonText = 'Aye! Gimme a name!';
  bool isButtonEnabled = true;

  void generateBadge() {
    badgeName = "Davy Jones";
  }

  void updateBadge(String inputName) {
    badgeName = inputName;
    if (inputName.trim().isEmpty) {
      buttonText = 'Arrr! Write yer name!';
      isButtonEnabled = false;
    } else {
      buttonText = 'Aye! Gimme a name!';
      isButtonEnabled = true;
    }
  }
}
