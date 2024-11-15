import 'package:deluxe_bottom_bar/src/models/deluxe_bottom_bar_action_button_style.dart';
import 'package:deluxe_bottom_bar/src/models/deluxe_bottom_bar_button_style.dart';
import 'package:deluxe_bottom_bar/src/models/deluxe_bottom_bar_item.dart';
import 'package:deluxe_bottom_bar/src/models/deluxe_bottom_bar_style.dart';
import 'package:flutter/material.dart';

part './mixin/deluxe_bottom_bar_mixin.dart';
part './widgets/action_button.dart';
part 'widgets/item_button.dart';

/// A customizable bottom navigation bar widget for Flutter.
///
/// This widget supports multiple items, an optional central action button, and
/// customizable styles for flexible UI design.
class DeluxeBottomBar extends StatefulWidget {
  /// Creates a DeluxeBottomBar with customizable items and styles.
  ///
  /// [items] defines the buttons on the bar and cannot be empty.
  /// [defaultIndex] sets the initial selected button index.
  /// Other parameters allow for page navigation and styles.
  const DeluxeBottomBar({
    required this.items,
    super.key,
    this.pageController,
    this.defaultIndex = 0,
    this.onActionButtonTapped,
    this.onPageChanged,
    this.actionButtonStyle = const DeluxeBottomBarActionButtonStyle(),
    this.buttonStyle = const DeluxeBottomBarButtonStyle(),
    this.style = const DeluxeBottomBarStyle(),
  })  : assert(items.length != 0, 'items cannot be empty'),
        assert(
          defaultIndex >= 0 && defaultIndex < items.length,
          'defaultIndex must be between 0 and items.length - 1',
        );

  /// Controls page navigation when a button is tapped.
  ///
  /// If provided, the controller will jump to the corresponding page when a
  /// button is tapped, enabling smooth navigation within a PageView widget.
  final PageController? pageController;

  /// Sets the initial selected button index.
  ///
  /// The value should be within the valid range of available items.
  final int defaultIndex;

  /// Callback for page changes when a button is tapped.
  ///
  /// Passes the index of the newly selected button, enabling custom logic.
  final void Function(int)? onPageChanged;

  /// Triggered when the central action button is tapped.
  ///
  /// This callback allows performing a specific action unrelated to page
  /// navigation when the central button is pressed.
  final VoidCallback? onActionButtonTapped;

  /// List of items displayed as buttons on the bottom bar.
  ///
  /// Each item includes an icon and optional tooltip, displayed in order.
  final List<DeluxeBottomBarItem> items;

  /// Style for the central action button.
  ///
  /// Defines background and icon colors for a customized appearance.
  final DeluxeBottomBarActionButtonStyle actionButtonStyle;

  /// Style settings for each button on the bottom bar.
  ///
  /// Includes customization options for selected and unselected states.
  final DeluxeBottomBarButtonStyle buttonStyle;

  /// Overall style for the bottom bar container.
  ///
  /// Defines background color and other decorations for the bar.
  final DeluxeBottomBarStyle style;

  @override
  State<DeluxeBottomBar> createState() => _DeluxeBottomBarState();
}

class _DeluxeBottomBarState extends State<DeluxeBottomBar>
    with _DeluxeBottomBarMixin {
  @override
  Widget build(BuildContext context) {
    // Determines the background color of the bar. Defaults to the theme's
    // surface color if not specified in the style parameter.
    final backgroundColor =
        widget.style.backgroundColor ?? Theme.of(context).colorScheme.surface;

    return Padding(
      padding: EdgeInsets.only(bottom: widget.style.bottomPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: _deluxeBottomBarContainer(context, backgroundColor),
          ),
          // Central action button for triggering custom actions.
          _ActionButton(
            onActionButtonTapped: widget.onActionButtonTapped,
            backgroundColor: widget.actionButtonStyle.backgroundColor,
            iconColor: widget.actionButtonStyle.iconColor,
            icon: widget.actionButtonStyle.icon,
            iconSize: widget.buttonStyle.iconSize,
          ),
        ],
      ),
    );
  }

  /// Builds the bottom bar container with buttons.
  ///
  /// The container includes padding, a background color, and a row of buttons.
  /// Each button is styled based on its selection state.
  Container _deluxeBottomBarContainer(
    BuildContext context,
    Color backgroundColor,
  ) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.025,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: ValueListenableBuilder(
        valueListenable: _selectedIndexNotifier,
        builder: (context, value, _) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var index = 0; index < widget.items.length; index++)
              _DeluxeBottomBarItemButton(
                tooltip: widget.items[index].tooltip,
                icon: widget.items[index].icon,
                iconSize: widget.buttonStyle.iconSize,
                backgroundColor: getButtonBackgroundColor(
                  index,
                  value,
                  backgroundColor,
                ),
                iconColor: getIconColor(index, value),
                onItemTapped: () => _onItemTapped(index),
              ),
          ],
        ),
      ),
    );
  }
}
