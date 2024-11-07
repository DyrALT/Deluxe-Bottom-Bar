import 'package:deluxe_bottom_bar/src/models/deluxe_bottom_bar_action_button_style.dart';
import 'package:deluxe_bottom_bar/src/models/deluxe_bottom_bar_button_style.dart';
import 'package:deluxe_bottom_bar/src/models/deluxe_bottom_bar_item.dart';
import 'package:deluxe_bottom_bar/src/models/deluxe_bottom_bar_style.dart';
import 'package:flutter/material.dart';

part '../utils/context_extension.dart';
part './action_button.dart';

/// A customizable bottom navigation bar widget for Flutter applications.
///
/// This widget supports multiple items, an optional central action button,
/// and customizable styles for flexible UI design.
class DeluxeBottomBar extends StatefulWidget {
  /// Creates a DeluxeBottomBar with specified items and customizable styles.
  ///
  /// [items] defines the buttons on the bottom bar and cannot be empty.
  /// [defaultIndex] sets the initially selected button index.
  /// Optional parameters allow page navigation and custom styles.
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

  /// Manages page navigation when an item is tapped in the bottom bar.
  ///
  /// If provided, this controller will jump to the page corresponding to
  /// the tapped item, enabling page transitions within a PageView widget.
  final PageController? pageController;

  /// Sets the initial selected item index in the bottom bar.
  ///
  /// This value should be within the range of available items.
  final int defaultIndex;

  /// Callback for page changes when a different item is selected.
  ///
  /// Passes the newly selected index, allowing custom page change logic.
  final void Function(int)? onPageChanged;

  /// Callback function triggered when the action button is tapped.
  ///
  /// This function can be used to perform a specific action independently
  /// of page navigation when the central action button is pressed.
  final VoidCallback? onActionButtonTapped;

  /// A list of items displayed as buttons in the bottom bar.
  ///
  /// Each item includes an icon and an optional tooltip. Displayed in order.
  final List<DeluxeBottomBarItem> items;

  /// Custom style for the central action button.
  ///
  /// Includes background and icon color options for custom appearance.
  final DeluxeBottomBarActionButtonStyle actionButtonStyle;

  /// Style settings for each individual item button in the bottom bar.
  ///
  /// Allows customization of colors for both selected and unselected states.
  final DeluxeBottomBarButtonStyle buttonStyle;

  /// Overall style for the bottom bar container.
  ///
  /// Sets background color and other decorations for the entire bottom bar.
  final DeluxeBottomBarStyle style;

  @override
  State<DeluxeBottomBar> createState() => _DeluxeBottomBarState();
}

class _DeluxeBottomBarState extends State<DeluxeBottomBar> {
  /// Tracks the currently selected item index in the bottom bar.
  ///
  /// This value is updated whenever an item is tapped, and it notifies
  /// listeners to re-render the selected button's style.
  final _selectedIndexNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    // Set the initial selected index based on the defaultIndex value.
    _selectedIndexNotifier.value = widget.defaultIndex;

    // Jumps to the default page if the page controller is provided.
    if (widget.defaultIndex != 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (widget.pageController != null &&
            widget.pageController!.hasClients) {
          widget.pageController!.jumpToPage(widget.defaultIndex);
        }
      });
    }
  }

  /// Handles item selection changes and triggers relevant callbacks.
  ///
  /// Updates the selected index and optionally jumps to the page
  /// associated with the selected item. Calls `onPageChanged` if set.
  void _onItemTapped(int index) {
    _selectedIndexNotifier.value = index;
    widget.onPageChanged?.call(index);
    if (widget.pageController != null && widget.pageController!.hasClients) {
      widget.pageController!.jumpToPage(index);
    }
  }

  @override
  void dispose() {
    // Disposes of the selected index notifier to free resources.
    _selectedIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Sets the background color of the bottom bar, defaulting to the
    // theme's surface color if not provided in the style parameter.
    final backgroundColor =
        widget.style.backgroundColor ?? Theme.of(context).colorScheme.surface;

    // Sets the background color of the selected button, using the
    // primary color from the theme if not provided.
    final selectedButtonBackgroundColor =
        widget.buttonStyle.selectedButtonBackgroundColor ??
            Theme.of(context).colorScheme.primary;

    // Sets the icon color for the selected button, defaulting to white.
    final selectedButtonIconColor =
        widget.buttonStyle.selectedButtonIconColor ?? Colors.white;

    // Sets the icon color for unselected buttons, defaulting to black.
    final iconColor = widget.buttonStyle.iconColor ?? Colors.black;

    return Padding(
      padding: EdgeInsets.only(bottom: widget.style.bottomPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              // Sets the horizontal margin for the bottom bar container.
              margin: EdgeInsets.only(
                left: context.width(0.025),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: ValueListenableBuilder(
                valueListenable: _selectedIndexNotifier,
                builder: (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (var index = 0; index < widget.items.length; index++)
                      Flexible(
                        child: Tooltip(
                          message: widget.items[index].tooltip,
                          child: OutlinedButton(
                            onPressed: () => _onItemTapped(index),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: backgroundColor,
                              ),
                              backgroundColor: value == index
                                  ? selectedButtonBackgroundColor
                                  : backgroundColor,
                            ),
                            child: Icon(
                              widget.items[index].icon,
                              size: widget.buttonStyle.iconSize,
                              color: value == index
                                  ? selectedButtonIconColor
                                  : iconColor,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          // Central action button for additional functionality.
          _ActionButton(
            onActionButtonTapped: widget.onActionButtonTapped,
            backgroundColor: widget.actionButtonStyle.backgroundColor,
            iconColor: widget.actionButtonStyle.iconColor,
            iconSize: widget.buttonStyle.iconSize,
          ),
        ],
      ),
    );
  }
}
