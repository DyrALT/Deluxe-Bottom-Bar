import 'package:deluxe_bottom_bar/deluxe_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deluxe Bottom Bar Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Deluxe Bottom Bar Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      debugPrint(pageController.page.toString());
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      bottomNavigationBar: DeluxeBottomBar(
        pageController: pageController,
        style: const DeluxeBottomBarStyle(
          backgroundColor: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(171, 171, 171, .7),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        buttonStyle: const DeluxeBottomBarButtonStyle(
          selectedButtonBackgroundColor: Color(0xff0ebe7e),
          iconSize: 22,
          iconColor: Colors.blue,
          selectedButtonIconColor: Colors.white,
        ),
        actionButtonStyle: const DeluxeBottomBarActionButtonStyle(
          backgroundColor: Color(0xff0ebe7e),
          widget: Icon(
            Icons.accessibility_new_rounded,
            color: Colors.white,
          ),
        ),
        items: const [
          DeluxeBottomBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
          ),
          DeluxeBottomBarItem(
            icon: FlutterLogo(
              size: 20,
            ),
            tooltip: 'Search',
          ),
          DeluxeBottomBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            tooltip: 'Settings',
          ),
          DeluxeBottomBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            tooltip: 'Settings',
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        children: const [
          Center(child: Text('Home')),
          Center(child: Text('Search')),
          Center(child: Text('Notifications')),
          Center(child: Text('Settings')),
          // Center(child: Text('Notifications')),
        ],
      ),
    );
  }
}
