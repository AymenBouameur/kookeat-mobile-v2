import 'dart:developer';
import 'dart:io';

import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/router/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoadingOverlay {
  CustomLoadingOverlay._();

  ///
  static Future<void> show({
    required Future<dynamic> Function() asyncFunction,
  }) async {
    await _overlay(
      opacity: 0.45,
      opacityColor: AppColors.backgroundColor,
      asyncFunction: () async {
        try {
          await asyncFunction();
        } catch (error) {
          log('Loding overlay: $error');
          log(StackTrace.current.toString());
        }
      },
      loadingWidget: RepaintBoundary(
        child: Builder(
          builder: (context) {
            if (Platform.isIOS) {
              return Center(
                child: CupertinoActivityIndicator(
                  radius: 20,
                  color: AppColors.primaryColor,
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                  strokeWidth: 3,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  ///
  static Future<T> _overlay<T>({
    required Future<T> Function() asyncFunction,
    Color opacityColor = Colors.white,
    Widget? loadingWidget,
    double opacity = .5,
  }) async {
    final navigatorState = AppRouter.navigatorKey.currentState!;
    final overlayState = navigatorState.overlay!;

    final overlayEntryOpacity = OverlayEntry(
      builder: (context) {
        return Opacity(
          opacity: opacity,
          child: Container(
            color: opacityColor,
          ),
        );
      },
    );
    final overlayEntryLoader = OverlayEntry(
      builder: (context) {
        return loadingWidget ??
            const Center(
              child: SizedBox(
                height: 90,
                width: 90,
                child: Text('Loading...'),
              ),
            );
      },
    );
    overlayState
      ..insert(overlayEntryOpacity)
      ..insert(overlayEntryLoader);

    T data;

    try {
      data = await asyncFunction();
    } on Exception catch (e) {
      overlayEntryLoader.remove();
      overlayEntryOpacity.remove();
      log('Overlay function error: $e');
      rethrow;
    }

    overlayEntryLoader.remove();
    overlayEntryOpacity.remove();
    return data;
  }
}
