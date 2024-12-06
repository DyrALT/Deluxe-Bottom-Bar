part of '../deluxe_bottom_bar.dart';

/// A widget representing a single button in the DeluxeBottomBar.
///
/// This button displays an icon with customizable size, colors, and optional
/// tooltip. It reacts to user taps by triggering the provided callback.
class _DeluxeBottomBarItemButton extends StatelessWidget {
  /// Creates a `_DeluxeBottomBarItemButton` widget.
  ///
  /// - [tooltip]: An optional message displayed when the button is long-pressed
  /// - [icon]: The icon displayed on the button
  /// - [iconSize]: The size of the displayed icon
  /// - [backgroundColor]: The background color of the button
  /// - [iconColor]: The color of the displayed icon
  /// - [onItemTapped]: The callback triggered when the button is tapped
  const _DeluxeBottomBarItemButton({
    required this.tooltip,
    required this.icon,
    required this.iconSize,
    required this.backgroundColor,
    required this.iconColor,
    required this.onItemTapped,
  });

  /// Tooltip message displayed when the button is long-pressed.
  ///
  /// If null, no tooltip is displayed.
  final String? tooltip;

  /// The icon displayed within the button.
  final IconData icon;

  /// The size of the icon displayed within the button.
  final double iconSize;

  /// The background color of the button.
  final Color backgroundColor;

  /// The color of the icon displayed within the button.
  final Color iconColor;

  /// The callback triggered when the button is tapped.
  final VoidCallback onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: tooltip != null
          ? Tooltip(
              message: tooltip,
              child: buildButton(),
            )
          : buildButton(),
    );
  }

  /// Builds the button widget.
  OutlinedButton buildButton() {
    return OutlinedButton(
      onPressed: onItemTapped,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: backgroundColor,
        ),
        backgroundColor: backgroundColor,
      ),
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}
