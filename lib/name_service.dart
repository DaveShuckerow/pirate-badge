import 'dart:math' show Random;

import 'package:angular2/core.dart';

@Injectable()
class NameService {
  static final Random _indexGen = new Random();

  final _names = <String>[
    'Anne',
    'Mary',
    'Jack',
    'Morgan',
    'Roger',
    'Bill',
    'Ragnar',
    'Ed',
    'John',
    'Jane',
  ];
  final _appellations = <String>[
    'Jackal',
    'King',
    'Red',
    'Stalwart',
    'Axe',
    'Young',
    'Brave',
    'Eager',
    'Wily',
    'Zesty',
  ];

  String _getRandomFirstName() => _names[_indexGen.nextInt(_names.length)];

  String _getRandomAppellation() =>
      _appellations[_indexGen.nextInt(_appellations.length)];

  String getPirateName(String firstName) {
    if (firstName == null || firstName.trim().isEmpty) {
      firstName = _getRandomFirstName();
    }

    return '$firstName the ${_getRandomAppellation()}';
  }
}
