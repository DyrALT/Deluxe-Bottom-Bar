part of '../deluxe_bottom_bar.dart';

/// A central action button widget designed for the DeluxeBottomBar.
///
/// This button is typically used for adding new items or performing
/// a main action. It can be customized with different colors and
/// triggers a callback when tapped.
class _ActionButton extends StatelessWidget {
  /// Creates an _ActionButton with optional color and callback settings.
  ///
  /// [onActionButtonTapped] is triggered when the button is tapped.
  /// [backgroundColor] sets the button's background color.
  /// [widget] specifies the icon displayed in the action button.
  /// [boxShadow] applies a shadow effect to the action button.
  const _ActionButton({
    required this.widget,
    this.onActionButtonTapped,
    this.backgroundColor,
    this.boxShadow,
  });

  /// Callback function triggered when the action button is pressed.
  ///
  /// This function allows you to specify what action should be performed
  /// when the central action button is tapped, enabling flexible control.
  final VoidCallback? onActionButtonTapped;

  /// The background color of the action button.
  ///
  /// If not set, this color defaults to the button's standard color.
  final Color? backgroundColor;

  /// The icon displayed in the action button.
  final Widget? widget;

  /// The shadow effect applied to the action button.
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: boxShadow,
        ),
        child: FloatingActionButton(
          onPressed: () => onActionButtonTapped?.call(),
          elevation: 0,
          backgroundColor: backgroundColor,
          child: widget,
        ),
      ),
    );
  }
}
