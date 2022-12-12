import 'package:fdpook/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TitleInputDialog extends HookConsumerWidget {
  const TitleInputDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    final update = useValueListenable(controller);
    final ok = useState(false);

    useEffect(() {
      focusNode.requestFocus();
      return null;
    }, []);

    useEffect(() {
      ok.value = update.text.isNotEmpty;
      return null;
    }, [update]);

    return CupertinoAlertDialog(
      title: const Text(
        '本のタイトルを入力',
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: kSpaceSM),
        child: SizedBox(
          height: 40,
          child: CupertinoTextField(
            controller: controller,
            focusNode: focusNode,
            padding: const EdgeInsets.all(kSpaceSM),
            placeholder: 'タイトル',
          ),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('キャンセル'),
        ),
        CupertinoDialogAction(
          onPressed: ok.value
              ? () => Navigator.of(context).pop<String>(controller.text)
              : null,
          child: const Text('決定'),
        ),
      ],
    );
  }
}
