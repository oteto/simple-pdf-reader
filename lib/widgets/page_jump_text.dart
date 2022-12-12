import 'package:fdpook/constants.dart';
import 'package:fdpook/providers/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageJumpText extends ConsumerStatefulWidget {
  const PageJumpText({
    super.key,
    required this.page,
    required this.maxPage,
  });

  final int page;
  final int maxPage;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageJumpTextState();
}

class _PageJumpTextState extends ConsumerState<PageJumpText> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '${widget.page}');
  }

  @override
  void didUpdateWidget(covariant PageJumpText oldWidget) {
    super.didUpdateWidget(oldWidget);
    final text = '${widget.page}';
    _controller.text = text;
    _controller.selection = TextSelection(
      baseOffset: text.length,
      extentOffset: text.length,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 48,
          child: CupertinoTextField(
            controller: _controller,
            textAlign: TextAlign.end,
            style: const TextStyle(color: CupertinoColors.white),
            padding: const EdgeInsets.all(kSpaceXS),
            onChanged: (value) {
              final page = int.tryParse(value);
              if (page == null || page <= 0 || widget.maxPage <= page) {
                return;
              }
              ref.read(pageProvider.notifier).state = page;
            },
          ),
        ),
        Text(' / ${widget.maxPage}')
      ],
    );
  }
}
