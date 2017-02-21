import 'dart:async';
import 'package:angular2/core.dart';
import 'package:pirate_badge/name_service.dart';

@Component(
    selector: 'pirate-badge',
    templateUrl: 'badge_component.html',
    styleUrls: const ['badge_component.css'],
    providers: const [NameService])
class BadgeComponent implements OnInit {
  final NameService _nameService;
  String badgeName = 'Sergey';
  String buttonText = 'Aye! Gimme a name!';
  bool isButtonEnabled = false;
  bool isInputEnabled = false;

  BadgeComponent(this._nameService);

  void setBadgeName([String newName = '']) {
    if (newName == null) return;
    badgeName = _nameService.getPirateName(newName);
  }

  void generateBadge() {
    setBadgeName();
  }

  void updateBadge(String inputName) {
    setBadgeName(inputName);
    if (inputName.trim().isEmpty) {
      buttonText = 'Arrr! Write yer name!';
      isButtonEnabled = false;
    } else {
      buttonText = 'Aye! Gimme a name!';
      isButtonEnabled = true;
    }
  }

  @override
  Future<Null> ngOnInit() async {
    try {
      await _nameService.readyThePirates();
      // on success, turn the UI on
      isButtonEnabled = true;
      isInputEnabled = true;
    } catch (errr) {
      badgeName = 'Arrrr! an arrrror has occarrred';
      print('Unable to load names');
    }
  }
}
