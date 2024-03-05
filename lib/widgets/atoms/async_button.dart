import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AsyncButton extends HookWidget {
  final String text;
  final bool? active;
  final Future<void> Function() onPressed;
  final double height;
  final double width;
  final Color? buttonColor;
  final Widget child;

  const AsyncButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.height = 70,
      this.width = double.infinity,
      this.active = true,
      this.buttonColor,
      required this.child});

  @override
  Widget build(BuildContext context) {
    final asyncOperation = useState<Future<void>?>(null);

    return SizedBox(
      width: width,
      height: height,
      child: FutureBuilder<void>(
        future: asyncOperation.value,
        builder: (context, snapshot) {
          final isLoading = snapshot.connectionState == ConnectionState.waiting;
          return TextButton(
            onPressed: active! && !isLoading
                ? () {
                    asyncOperation.value = onPressed();
                  }
                : null,
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: buttonColor?.withOpacity(active! ? 1 : 0.5) ??
                  Theme.of(context)
                      .colorScheme
                      .secondary
                      .withOpacity(active! ? 1 : 0.5),
              padding: EdgeInsets.zero,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isLoading
                  // loading indicator
                  ? SizedBox(
                      width: height * 0.6,
                      height: height * 0.6,
                      child: CircularProgressIndicator(
                        strokeWidth: 3.0,
                        valueColor: AlwaysStoppedAnimation(
                            Theme.of(context).colorScheme.primary),
                      ),
                    )
                  : child,
            ),
          );
        },
      ),
    );
  }
}
