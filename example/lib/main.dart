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
        onPageChanged: (index) {
          debugPrint(index.toString());
        },
        onActionButtonTapped: () {
          debugPrint('Action button tapped');
        },
        buttonStyle: const DeluxeBottomBarButtonStyle(
          iconSize: 20,
          selectedButtonBackgroundColor: Colors.blue,
        ),
        defaultIndex: 1,
        style: const DeluxeBottomBarStyle(
          backgroundColor: Color.fromARGB(255, 219, 219, 219),
        ),
        actionButtonStyle: const DeluxeBottomBarActionButtonStyle(
          backgroundColor: Colors.blue,
          iconColor: Colors.white,
        ),
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
