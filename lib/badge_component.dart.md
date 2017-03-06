## Key notes from badge_component.dart
- providers:
  - The providers part of @Component tells Angular what objects are available for injection in this component.
  - You can reformat your code by right-clicking in the editor view and selecting Format.
- \_nameService
  - A final variable can be set only once. \_nameService is a final field–an instance variable that’s declared final. Final fields must be set before the constructor body runs.
  - Whenever Angular creates a pirate-badge component, Angular’s dependency injection framework supplies the NameService object that the BadgeComponent constructor needs.
  - The @Injectable annotation on NameService, combined with the providers list containing NameService, lets Angular create the NameService object.
  - If you’ve used Java, you’ve seen this before. You can access local instance variables using this. Dart only uses this when necessary, otherwise Dart style omits it.
  - Note that the BadgeComponent constructor has no body. The this.\_nameService text in the argument list assigns the passed-in parameter to the \_nameService variable. Since the assignment happens in the argument list, and the constructor doesn’t need to do anything else, the body isn’t needed.

  - If \_nameService weren’t a final variable, this code could be replaced with:
  ```
  BadgeComponent(var nameService) {
    _nameService = nameService;
  }
  ```
  - But since \_nameService is final, it has to be initialized when it’s declared, or in the constructor’s argument list.
- setBadgeName
  - [String newName = ''] is an optional positional parameter with a default value of the empty string.
