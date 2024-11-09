import 'package:flutter/material.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/feature/detail/widgets/upload__image.dart';
import 'package:inthon_front/app/feature/home/tabs/mypage/widget/mypage_profile.dart';
import 'package:inthon_front/app/widget/e_cached_image.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UploadSheet extends StatelessWidget {
  final String side;
  final int index;
  const UploadSheet({super.key, required this.side, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadSheet(
      constraints: side == ShadSheetSide.left || side == ShadSheetSide.right
          ? const BoxConstraints(maxWidth: 512)
          : null,
      title: Text('작품 업로드 및 선택하기'),
      description: Text("${index + 1}번째 영역 이미지"),
      actions: const [
        ShadButton(child: Text('저장')),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "작품 업로드",
                style: ShadTheme.of(context).textTheme.p,
              ),
              UploadImage(
                isEditable: true,
              ),
              // SizedBox(
              //   width: 100,
              //   height: 100,
              //   child: ECachedImage(
              //     imageUrl:
              //         "https://avatars.githubusercontent.com/u/80742780?v=4&size=64",
              //     placeHolderRadius: 200,
              //     imageBuilder: (_, imageProvider) {
              //       return Container(
              //         padding: const EdgeInsets.all(2.0),
              //         decoration: BoxDecoration(
              //           shape: BoxShape.rectangle,
              //           border: Border.all(
              //             color: context.getColorScheme.primary,
              //             width: 2,
              //           ),
              //         ),
              //         child: Container(
              //           decoration: BoxDecoration(
              //             shape: BoxShape.rectangle,
              //             image: DecorationImage(
              //               image: imageProvider,
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
