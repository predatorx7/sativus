import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(const Size.square(12)),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(
          color ?? Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
