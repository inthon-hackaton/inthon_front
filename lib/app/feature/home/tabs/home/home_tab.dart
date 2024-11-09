import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:inthon_front/app/data/extension/build_context_x.dart';
import 'package:inthon_front/app/data/service/storage_service.dart';
import 'package:inthon_front/app/feature/home/widget/home_list_filter.dart';
import 'package:inthon_front/app/feature/home/widget/list_card.dart';
import 'package:inthon_front/app/feature/home/tabs/gallery/widget/gallery_item.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = false;

    if (isLoading) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (c, i) => ListCard.loading(),
          separatorBuilder: (c, i) => SizedBox(height: 15),
          itemCount: 10,
        ),
      );
    }
    final fruits = {
      'popular': '인기순',
      'latest': '최신순',
      'like': '좋아요순',
    };

    return AnimationLimiter(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "함께 만들어가는 작품",
                          style: context.getTextTheme.h3,
                        ),
                      ),
                      ShadSelect<String>(
                        maxWidth: 100,
                        minWidth: 100,
                        placeholder: Text(
                          '정렬',
                          style: context.getTextTheme.muted,
                        ),
                        optionsPadding: EdgeInsets.zero,
                        options: [
                          ...fruits.entries.map(
                            (e) => ShadOption(
                              value: e.key,
                              selectedIcon: Icon(
                                Icons.check,
                                size: 20,
                                color: context.getColorScheme.primary,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 3.0),
                                child: Text(e.value),
                              ),
                            ),
                          ),
                        ],
                        selectedOptionBuilder: (context, value) =>
                            Text(fruits[value]!),
                        onChanged: print,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 2,
                    left: 2,
                    child: Container(
                      width: 36,
                      height: 8,
                      decoration: BoxDecoration(
                        color: context.getColorScheme.primary.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // HomeListFilter(),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(17, 10, 17, 90),
            sliver: SliverList.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 1200),
                    child: FadeInAnimation(
                      child: ListCard(
                        imageUrl:
                            "https://cdn-icons-png.freepik.com/256/5074/5074433.png?ga=GA1.1.2040043038.1719550100&semt=sph",
                        name: "그림의 주제",
                        people: 3,
                      ),
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
