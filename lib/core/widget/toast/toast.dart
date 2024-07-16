import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

ToastFuture toastForFailureMessage({
  required BuildContext context,
  required String msg,
  double? bottomPadding,
  Duration duration = const Duration(seconds: 4)
}) {
  return showToastWidget(
      duration: duration,
      Container(
        padding:  const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        margin:  EdgeInsets.fromLTRB(20, 0, 20, bottomPadding ?? 40),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        width: double.maxFinite,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline_outlined,color:Color.fromRGBO(154, 13, 0, 1),size: 22),
            const SizedBox(width: 5,),
            Expanded(child: Text(msg, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.error),))
          ],
        ),
      ),
      position: ToastPosition.bottom
  );
}