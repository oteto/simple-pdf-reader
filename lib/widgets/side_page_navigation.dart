import 'package:fdpook/constants.dart';
import 'package:flutter/cupertino.dart';

class SidePageNavigation extends StatelessWidget {
  const SidePageNavigation({
    super.key,
    required this.onTap,
    required this.icon,
    required this.enabled,
  });

  final VoidCallback onTap;
  final IconData icon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: enabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          width: kSideNavWidth,
          height: double.infinity,
          child: Center(
            child: Icon(
              icon,
              size: 32,
              color: enabled ? null : CupertinoColors.systemGrey,
            ),
          ),
        ),
      ),
    );
  }
}
