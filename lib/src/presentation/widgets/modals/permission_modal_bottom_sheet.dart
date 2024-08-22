import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';

const double _defaultScrollControlDisabledMaxHeightRatio = 9.0 / 16.0;

Future<T?> showPermissionModalBottomSheet<T>({
  required BuildContext context,
  Color? backgroundColor,
  String? barrierLabel,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  BoxConstraints? constraints,
  Color? barrierColor,
  bool isScrollControlled = false,
  double scrollControlDisabledMaxHeightRatio =
      _defaultScrollControlDisabledMaxHeightRatio,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  bool? showDragHandle,
  bool useSafeArea = false,
  RouteSettings? routeSettings,
  AnimationController? transitionAnimationController,
  Offset? anchorPoint,
  Widget? header,
  required String title,
  required String description,
  required String actionTitle,
  required void Function()? onPressed,
}) {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));

  final NavigatorState navigator =
      Navigator.of(context, rootNavigator: useRootNavigator);
  final MaterialLocalizations localizations = MaterialLocalizations.of(context);
  return navigator.push(
    ModalBottomSheetRoute<T>(
      builder: (BuildContext context) {
        return Wrap(
          children: [
            if (header != null) ...[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    bottom: 30,
                  ),
                  child: header,
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: context.textTheme.titleLarge?.fontSize,
                      fontFamily: context.textTheme.titleLarge?.fontFamily,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 20,
                right: 20,
                bottom: 30,
              ),
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(45),
                ),
                child: Text(actionTitle),
              ),
            ),
          ],
        );
      },
      capturedThemes:
          InheritedTheme.capture(from: context, to: navigator.context),
      isScrollControlled: isScrollControlled,
      scrollControlDisabledMaxHeightRatio: scrollControlDisabledMaxHeightRatio,
      barrierLabel: barrierLabel ?? localizations.scrimLabel,
      barrierOnTapHint:
          localizations.scrimOnTapHint(localizations.bottomSheetLabel),
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      isDismissible: isDismissible,
      modalBarrierColor:
          barrierColor ?? Theme.of(context).bottomSheetTheme.modalBarrierColor,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      settings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint,
      useSafeArea: useSafeArea,
    ),
  );
}
