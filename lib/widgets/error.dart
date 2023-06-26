import 'dart:io';

import 'package:flutter/material.dart';

import 'progress.dart';

class ErrorPlaceholderSliver extends StatelessWidget {
  const ErrorPlaceholderSliver({
    Key? key,
    this.error,
    this.onRetryPress,
  }) : super(key: key);

  final Object? error;
  final VoidCallback? onRetryPress;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: ErrorPlaceholder(
        exception: error,
        onRetryPress: onRetryPress,
      ),
    );
  }
}

const _somethingWentWrongMessage = 'Oh no!\nSomething went wrong';
const _unableToConnectMessage = 'Unable to connect with services';

class ErrorPlaceholder extends StatelessWidget {
  const ErrorPlaceholder({
    Key? key,
    this.exception,
    this.message,
    this.onRetryPress,
    this.icon,
    this.isRetrying = false,
  }) : super(key: key);

  final Object? exception;
  final String? message;
  final VoidCallback? onRetryPress;
  final Widget? icon;
  final bool isRetrying;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final isConnectivityIssue =
        exception is HttpException || exception is SocketException;

    final message = this.message ??
        (isConnectivityIssue
            ? _unableToConnectMessage
            : _somethingWentWrongMessage);

    Widget? errorIcon = icon;
    if (errorIcon == null) {
      if (isConnectivityIssue) {
        errorIcon = const Icon(Icons.cloud_off_rounded);
      } else {
        errorIcon = const Icon(Icons.warning_rounded);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              errorIcon,
            ],
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall,
          ),
          if (onRetryPress != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 45),
                    ),
                    onPressed: isRetrying ? null : onRetryPress,
                    child: isRetrying
                        ? const AppProgressIndicator()
                        : const Text('Try again'),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class UnauthenticatedErrorPlaceholder extends StatelessWidget {
  const UnauthenticatedErrorPlaceholder({
    super.key,
    required this.message,
    required this.onSignInPressed,
  });
  final String message;
  final VoidCallback? onSignInPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.login_rounded),
            ],
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall,
          ),
          if (onSignInPressed != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 45),
                    ),
                    onPressed: onSignInPressed,
                    child: const Text('Sign in'),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
