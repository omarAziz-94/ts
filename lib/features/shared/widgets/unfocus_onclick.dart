import 'package:flutter/material.dart';

/// A widget used to remove focus from the current focused widget when the user
/// clicks on it. typically used on an entire page.
class UnFocusOnClicked extends StatelessWidget {
  final Widget child;
  const UnFocusOnClicked({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
