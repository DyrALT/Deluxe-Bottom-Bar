# Deluxe Bottom Bar

Deluxe Bottom Bar is a Flutter package that provides a customizable bottom navigation bar for your Flutter applications.

## Features

- Customizable icons and labels
- Easy to integrate

![Demo GIF](./assets/demo.gif)

## Getting Started

To use this package, add `deluxe_bottom_bar` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  deluxe_bottom_bar: 
    git:
      url: git://github.com/DyrALT/Deluxe-Bottom-Bar.git
      ref: master
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:deluxe_bottom_bar/deluxe_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: DeluxeBottomBar(
        items: const [
          DeluxeBottomBarItem(
            icon: Icons.home,
            tooltip: 'Home',
          ),
          DeluxeBottomBarItem(
            icon: Icons.search,
            tooltip: 'Search',
          ),
          DeluxeBottomBarItem(
            icon: Icons.notifications,
            tooltip: 'Notifications',
          ),
          DeluxeBottomBarItem(
            icon: Icons.settings,
            tooltip: 'Settings',
          ),
        ],
      ),
        body: Center(child: Text('Hello, world!')),
      ),
    );
  }
}
```

## Example

you can find the example in the [Example](EXAMPLE) folder.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
