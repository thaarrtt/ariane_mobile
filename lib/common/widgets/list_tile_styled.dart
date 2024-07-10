import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ariane_mobile/common/utils/hooks_side_effect.dart';
import 'package:ariane_mobile/common/widgets/loading_spinner.dart';

class ListTileStyled extends HookWidget {
  const ListTileStyled({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    this.width,
    this.backgroundColor,
  });

  final AsyncCallback onTap;
  final Widget title;
  final Icon icon;
  final double? width;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final (clear: _, :mutate, :snapshot) = useSideEffect<void>();
    Future<void> tapTile() async {
      final future = onTap();
      mutate(future);
      try {
        await future;
      } catch (exception) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Something went wrong $exception')),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: InkWell(
        onTap: snapshot.connectionState == ConnectionState.waiting
            ? null
            : tapTile,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundColor ?? Colors.white,
          ),
          height: 0.06.sh,
          width: width ?? 0.9.sw,
          child: Padding(
              padding: EdgeInsets.only(left: 0.02.sw, right: 0.02.sw),
              child: Center(
                child: snapshot.connectionState == ConnectionState.waiting
                    ? const LoadingSpinner()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          title,
                          icon,
                        ],
                      ),
              )),
        ),
      ),
    );
  }
}
