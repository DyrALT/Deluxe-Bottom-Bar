part of '../deluxe_bottom_bar.dart';

/// A mixin class that provides state management and helper methods
/// for the `DeluxeBottomBar` widget.
///
/// This mixin manages the selected index and provides utility functions
/// to customize the button and icon colors based on the selected state.
mixin _DeluxeBottomBarMixin on State<DeluxeBottomBar> {
  /// A [ValueNotifier] that tracks the currently selected item index
  /// in the bottom bar.
  ///
  /// This notifier updates whenever an item is tapped, and it notifies
  /// listeners to re-render the selected button's style in the bottom bar.
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

  /// Handles item selection changes when a button is tapped.
  ///
  /// Updates the [_selectedIndexNotifier] with the new index, optionally
  /// jumps to the corresponding page in the [PageView] (if a
  /// [PageController] is provided), and calls the onPageChanged callback
  /// with the new index.
  ///
  /// This method is used to update the UI and trigger relevant actions
  /// whenever an item in the bottom bar is selected.
  ///
  /// - Parameter [index]: The index of the tapped item in the bottom bar.
  void _onItemTapped(int index) {
    _selectedIndexNotifier.value = index;
    widget.onPageChanged?.call(index);
    if (widget.pageController != null && widget.pageController!.hasClients) {
      widget.pageController!.jumpToPage(index);
    }
  }

  /// Retrieves the background color for a bottom bar button based on
  /// its selection state.
  ///
  /// This helper method checks if the button at [index] is currently
  /// selected. If selected, it returns the color specified in
  /// [widget.buttonStyle.selectedButtonBackgroundColor]; otherwise, it returns
  /// [defaultColor].
  ///
  /// - Parameters:
  ///   - [index]: The index of the button whose background color is
  ///     being determined.
  ///   - [selectedIndex]: The index of the currently selected button.
  ///   - [defaultColor]: The fallback color if the button is not
  ///     selected or no specific color is defined for the selected
  ///     state.
  ///
  /// - Returns: A [Color] for the background of the specified button.
  Color getButtonBackgroundColor(
    int index,
    int selectedIndex,
    Color defaultColor,
  ) {
    return index == selectedIndex
        ? widget.buttonStyle.selectedButtonBackgroundColor ?? defaultColor
        : defaultColor;
  }

  /// Retrieves the icon color for a bottom bar button based on its
  /// selection state.
  ///
  /// This helper method checks if the button at [index] is currently
  /// selected. If selected, it returns the color specified in
  /// [widget.buttonStyle.selectedButtonIconColor]; otherwise, it returns the
  /// color specified in [widget.buttonStyle.iconColor].
  ///
  /// - Parameters:
  ///   - [index]: The index of the button whose icon color is being
  ///     determined.
  ///   - [selectedIndex]: The index of the currently selected button.
  ///
  /// - Returns: A [Color] for the icon of the specified button.
  Color getIconColor(int index, int selectedIndex) {
    return index == selectedIndex
        ? widget.buttonStyle.selectedButtonIconColor
        : widget.buttonStyle.iconColor;
  }

  @override
  void dispose() {
    // Disposes of the selected index notifier to free resources.
    _selectedIndexNotifier.dispose();
    super.dispose();
  }
}
