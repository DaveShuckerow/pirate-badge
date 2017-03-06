# Darrrt
Pirate badge app written with Angular Dart.

In this repo, we'll walk through an introductory codelab to development with
Angular and Dart.

# Pirate names
A pirate name is made by taking a normal first name (such as John, Francesca,
or Xiaozhou) and appending an appellation to this name.  Some sample pirate
names:
```
Anne the Young
Roger the Axe
Morgan the Zesty
```

# Guide
## Step 0
You'll need the following tools to build this codelab on your own:
 - [Dart SDK](https://www.dartlang.org/install)
 - A code editor
   - I recommend [Atom](https://atom.io) and the Atom dart plugin
   - IntelliJ Idea also has a very good Dart plugin that you can install.

Bring up a command line and move into the directory that contains this README
file.  We'll do the whole codelab from this directory.

If you get lost at any step, the `answers/` directory contains the correct
resulting `lib/` and `web/` directories for each step of this process.  You
can read code from there or copy them into the top level if you need to.

## Step 1
The code for step 1 is already in place at the top level of this repository.
We have a template Angular app set up that you will be modifying into a pirate
name badge generator over the course of this tutorial.

We'll start by running the following commands:

`pub get`

This will get all of the dependencies that this code will need to run in your
browser.

Now run

`pub serve`

This will compile your app to javascript and run it at http://localhost:8080.

## Step 2
In this step we will get started on our badge.  We'll start by defining an HTML
template.

Create a new file `lib/badge_component.html`, and add in the following to it:
```
<div class="badge">
  <div class="greeting">Arrr! Me name be</div>
  <div class="name">{{badgeName}}</div>
</div>
```

Notice that we've provided a file `lib/badge_component.css`.  Angular will use
this CSS file to style the HTML you've just written.

Now let's create the component that will tie it all together.  Create another
file, and name it `lib/badge_component.dart`.  Add the following contents to
the file:
```
import 'package:angular2/core.dart';

@Component(
    selector: 'pirate-badge',
    templateUrl: 'badge_component.html',
    styleUrls: const ['badge_component.css'])
class BadgeComponent {
  String badgeName = 'Sergey';
}
```

This creates a new component that loads its template and styling from external
resources.  This is a good application of the principle of **separation of
concerns** and allows us to
 - only focus on application logic in `lib/badge_component.dart`
 - only focus on layout in `lib/badge_component.html`
 - only focus on styling in `lib/badge_component.css`

The variable we declare here is referenced inside the HTML template as
`{{badgeName}}`.  As you update this variable, the rendered HTML will that shows
this name will update too.

To use this new component, we need to add it to our AppComponent's template.
Let's start by applying separation of concerns to our AppComponent.  Create
a new file, `lib/app_component.html`, and let's write this new template:
```
<h1>Avast, Ye Pirates</h1>
<pirate-badge></pirate-badge>
```

Now let's make the changes we need to `lib/app_component.dart`.  Let's update
the file by adding an import to find BadgeComponent:

`import 'badge_component.dart';`

Now we will update the @Component annotation to tell AppComponent about its
new template:
```
@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    directives: const [BadgeComponent])
```

We replaced the `template` field with `templateUrl`, and added a reference to
the new template file we created for AppComponent.  We also added a
`directives` field, which expects a constant list of other components.
Adding the BadgeComponent, which declares its selector as `pirate-badge`,
allows Angular to understand the `<pirate-badge>` selector in the template as
a reference to the BadgeComponent that we previously defined.

If you still have `pub serve` running, refreshing your page should recompile
your code and show your new changes.  If not, try running `pub serve` again and
see what happens.

## Step 3
Now that we have a badge with a sample name on it, we'll update it to allow you
to enter your own name.

We'll start by adding to the top of the template for the BadgeComponent,
`lib/badge_component.html`:
```
<div class="widgets">
  <input (input)="updateBadge($event.target.value)"
          type="text" maxlength="15">
</div>
```

This adds an HTML5 input to our page.  Notice the event binding
`(input)="updateBadge(...)"`.  We will need to go into our dart code and add
an event handler with the same name.  Make this addition to the BadgeComponent
class in `lib/badge_component.dart`:
```
void updateBadge(String inputName) {
  badgeName = inputName;
}
```

Now load and look at your changes.  You should be able to change your name by
filling in the input box at the top of the page.

## Step 4
It's time to start generating pirate names.  Add a button to the bottom of
the div field where `class = "widgets"` inside of `lib/badge_component.html`:
```
<div class="widgets">
  ...
  <button [disabled]="!isButtonEnabled" (click)="generateBadge()">
    {{buttonText}}
  </button>
</div>
```

Note that we've created three additional event bindings, one to a boolean field,
one to a badge generator method, and one to text to show in the button.
Let's add these to our BadgeComponent:
class in `lib/badge_component.dart`:
```
  String buttonText = 'Aye! Gimme a name!';
  bool isButtonEnabled = true;
```

And then the badge generator:
```
  void generateBadge() {
    badgeName = "Davy Jones";
  }
```

Now, we'll modify updateBadge to interact with the button as well.
```
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
```

Go ahead and try this out.

## Step 5
Now, we're going to add in some real name generation.  To do this, we are going
to explore the concept of a service.

A service is a utility class that is responsible for performing a task
other than just being a UI component.  We are going to create a NameService,
which will be responsible for turning names into pirate names.

Start by making a file, `name_service.dart`.  Fill it with this stub:

```
import 'dart:math' show Random;

import 'package:angular2/core.dart';

@Injectable()
class NameService {}
```

We've imported just the Random class from the dart built-in math package.
Additionally, we've pulled in the @Injectable annotation from Angular2's
dependency injection framework.  More on that later.

For now, let's fill in our name service.  We want to be able to randomly
generate a pirate name from any first name.  If we don't have a first name
to generate a pirate name for, then we want to randomly generate a complete
pirate name.

We'll start by setting up a default list of pirate names inside of the
NameService class:
```
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
    'Queen',
    'Red',
    'Stalwart',
    'Axe',
    'Young',
    'Brave',
    'Eager',
    'Wily',
    'Zesty',
  ];
```

Then, we'll give the NameService a Random number generator and some private
helper methods to generate names from:
```
  static final Random _indexGen = new Random();

  String _getRandomFirstName() => _names[_indexGen.nextInt(_names.length)];

  String _getRandomAppellation() =>
      _appellations[_indexGen.nextInt(_appellations.length)];
```

Note the leading underscore on all the names, as well as the `=>` notation.
The syntax `_foo` indicates that this variable is private to a class.  It has
roughly the same meaning as a `private` declaration does in Java.
Meanwhile, The `=>` operator in Dart is just a shorthand for a one-line method
that returns the result of the one line.

For example, the two methods
```
String doFoo() {
  return 'foo';
}

String doFooAgain() => 'foo';
```
are identical.


Now that we have our helper methods set up, we'll add in the public method
that we need to generate a pirate name:
```
  String getPirateName(String firstName) {
    if (firstName == null || firstName.trim().isEmpty) {
      firstName = _getRandomFirstName();
    }

    return '$firstName the ${_getRandomAppellation()}';
  }
```

Now that the NameService is complete, we'll look at using it from inside of
the BadgeComponent.  We'll start by opening `lib/badge_component.dart` and
adding an import for our new NameService's file:
```
import 'name_service.dart';
```

Now, we'll add a NameService field to our BadgeComponent.  We don't want to
access the NameService from the HTML template, and we don't want it to change
over the lifetime of our BadgeComponent, so we'll use two engineering
best-practices at once and declare it as both final and private:
```
final NameService _nameService;
```

Declare a constructor that takes the \_nameService as a parameter:
```
BadgeComponent(this._nameService);
```

Prefixing the parameter with `this.` is a shorthand in Dart constructors
that directly assigns that parameter to the corresponding field in the class.
This saves the trouble of having to do this on your own in the initialization
step of the constructor like you would in many Java.  Also note that with this
syntax, you don't need to declare the type; Dart is able to infer and require
that this parameter have the same type as the field that it is assigning to.

Now, let's add a new method, setBadgeName, that uses the \_nameService:
```
void setBadgeName([String newName = '']) {
  if (newName == null) return;
  badgeName = _nameService.getPirateName(newName);
}
```

The [] surrounding the parameter declares that parameter as optional.  If you
call setBadgeName() without providing a parameter, the parameter newName will
be assigned a default value (in this case, the empty string).

We'll update the generateBadge method to use this functionality:
```
void generateBadge() {
  setBadgeName();
}
```

Let's also modify our updateBadge method to use the new setBadgeName
instead of directly assigning to the badgeName field:
```
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
```

Now that our behavior is complete, we can talk about how to properly give
the BadgeComponent a NameService to use.  We will use dependency injection
(also known as DI) to do this.  DI is a complicated topic, but simply put,
it's a way to swap out different implementations of an interface inside of a
large software system more easily than explicitly providing those
dependencies.  In Angular, we can inject components with services that we've
annotated as being @Injectable.  This is the easiest way to test and maintain
both the components and the services.

We tell BadgeComponent how to inject NameService by adding a providers field to
the @Component annotation:
```
@Component(
    selector: 'pirate-badge',
    templateUrl: 'badge_component.html',
    styleUrls: const ['badge_component.css'],
    providers: const [NameService])
```

Now that we've done this, Angular should be able to build your new page.
Go ahead and try it out!

## Step 6
Generating our own names is nice, but the hardcoded lists are a bit limited.
Real web apps can talk to remote servers to get lots more data.

Now, we're going to try doing just that.  Start by opening up
`lib/name_service.dart` and adding these new imports:
```
import 'dart:async';
import 'dart:convert';
import 'dart:html';
```

These Dart built-in libraries will help us bring data down from a remote server.

We need to bring our data down from somewhere.  We've provided a collection of
JSON-formatted names at https://www.dartlang.org/f/piratenames.json which we
will add as a private constant:
```
const _namesPath = 'https://www.dartlang.org/f/piratenames.json';
```

Let's take out the hardcoded values for \_names and \_appelations inside the
NameService class:
```
  final _names = <String>[];
  final _appellations = <String>[];
```

Now that we have our methods, we'll add an initialization method to the
NameService class to have it go fetch
the pirate name data:
```
  Future readyThePirates() async {
    if (_names.isNotEmpty && _appellations.isNotEmpty) return;

    var jsonString = await HttpRequest.getString(_namesPath);
    var pirateNames = JSON.decode(jsonString);
    _names.addAll(pirateNames['names']);
    _appellations.addAll(pirateNames['appellations']);
  }
```

This initializer is a good introduction to asynchronous programming in Dart.
The `async` keyword indicates that this method is asynchronous.
When readyThePirates is called, it will return an object known as a Future
immediately.  This is similar to a Promise or a Pipeline in other languages.
Code that calls readyThePirates will keep executing with the Future it returned
in memory.  readyThePirates will continue executing, and make an async call of
its own to HttpRequest.getString.  The `await` keyword tells this method to
stop executing until the future returned by HttpRequest.getString completes.
Because of this, the variable jsonString will be a String, and not a Future.
After readyThePirates completes, its Future will complete as well, and if the
calling code was `await`ing it, then that code will continue its execution.

Now that the NameService is asynchronously loading data, our BadgeComponent has
a new state where it could try to create a pirate name, but fail because the
names haven't been initialized yet.  We'll handle this by blocking user input
while the names are loading.

Start by modifying the input element in `lib/badge_component.html`:
```
<input [disabled]="!isInputEnabled" (input)="updateBadge($event.target.value)"
       type="text" maxlength="15">
```

The field isInputEnabled doesn't exist yet.  Let's add it in to our
BadgeComponent class in `lib/badge_component.dart`.  While we're doing this,
we'll also disable the button by default so that the user can't try to generate
a random name while names are loading.
```
bool isButtonEnabled = false;
bool isInputEnabled = false;
```

We also need to set BadgeComponent up to properly initialize the NameService.
To do this, we will implement a part of the Angular lifecycle, the OnInit event.
This will be called when the component is first initialized.

First, we want to initialize this class asynchronously, so make the appropriate
import at the beginning of the file:
```
import 'dart:async';
```

Now, modify the definition of BadgeComponent so that it implements the
OnInit interface:
```
class BadgeComponent implements OnInit {
```

Now, we just need to implement the ngOnInit method:
```
  @override
  Future ngOnInit() async {
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
```

Go ahead and try your changes out; you should now have a complete Angular2 app
that can even make API requests of remote servers!
