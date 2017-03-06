# Darrrt
Pirate badge app written with Angular Dart.

Walking through an introduction codelab to development with Angular and Dart.

# Pirate names
A pirate name is a normal first name (such as John, Francesca, or Xiaozhou)
and appending an appellation to this name.  Some sample pirate names:
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
   - IntelliJ Idea also has a very good Dart plugin that you install.

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
In this step we will get started on our badge.  We'll start by defining an HTML template.

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
Adding the BadgeComponent, which declares its selector as `pirate-badge`
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

Note that we've created two additional event bindings, one to a boolean field
and one to a badge generator method.  Let's add these two to our BadgeComponent
class in `lib/badge_component.dart`:
```
  bool isButtonEnabled = true;
```

And then the badge generator:
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
Additionally, we've pulled in Angular2's dependency injection framework.
More on that later.

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
