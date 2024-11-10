import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/data/model/draft.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'package:inthon_front/app/feature/detail/logic/detail_controller.dart';
import 'package:inthon_front/app/feature/detail/widgets/upload_sheet.dart';
import 'package:inthon_front/app/feature/detail/user_card.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.draft});

  final Draft draft;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    Get.put(DetailController(draft: widget.draft));
  }

  @override
  void dispose() {
    Get.delete<DetailController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(widget.draft.description, style: context.getTextTheme.h4),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            widget.draft.draft_link,
                            fit: BoxFit.cover,
                          ),
                        ),
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(0),
                          children: List.generate(4, (index) {
                            return Obx(() {
                              final item = DetailController.to.imageList
                                  .elementAt(index);
                              final child = () {
                                if (item.$1 != null) {
                                  return Opacity(
                                    opacity: 0.7,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: item.$1 == null
                                              ? AssetImage(
                                                  'assets/images/empty_image.png')
                                              : FileImage(File(item.$1!.path)),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (item.$5 != 0) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(item.$2),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black26,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                    ),
                                  );
                                }
                              }();

                              return GestureDetector(
                                onTap: () {
                                  showShadSheet(
                                    side: ShadSheetSide.bottom,
                                    context: context,
                                    builder: (context) => UploadSheet(
                                      index: index,
                                    ),
                                  );
                                },
                                child: child,
                              );
                            });
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 17),
                    for (int i = 0; i < 4; i++) UserCard(index: i),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShadButton(
                  onPressed: () async {
                    final res = await RouterService.to.openDialog(
                      builder: (context) {
                        return ShadDialog.alert(
                          title: const Text('이대로 저장하시겠습니까?'),
                          description: const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                              '저장 후 완성된 그림은 수정할 수 없습니다.',
                            ),
                          ),
                          actions: [
                            ShadButton.outline(
                              child: const Text('취소'),
                              onPressed: () => context.pop(false),
                            ),
                            ShadButton(
                              child: const Text('저장'),
                              onPressed: () => context.pop(true),
                            ),
                          ],
                        );
                      },
                    );
                    if (res == true) {
                      DetailController.to.saveCompletion();
                      RouterService.to.goRouter.pop();
                    }
                  },
                  child: Text('작품 저장하기'),
                ),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
