// ignore_for_file: deprecated_member_use

import '../../../__lib.dart';

class TrendingTodayWidget extends ConsumerStatefulWidget {
  const TrendingTodayWidget({
    super.key,
    required this.appTheme,
  });

  final BaseTheme appTheme;

  @override
  ConsumerState<TrendingTodayWidget> createState() =>
      _TrendingTodayWidgetState();
}

class _TrendingTodayWidgetState extends ConsumerState<TrendingTodayWidget> {
  @override
  Widget build(BuildContext context) {
    final appTheme = widget.appTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.insetsOnly(left: 16),
          child: PoppinsText(
            'Trending Today',
            weight: FontWeight.w600,
            color: widget.appTheme.textColor.c600,
            size: 24,
          ),
        ),
        const HGap(6),
        TrendingListView(appTheme: appTheme),
      ],
    );
  }
}

class ExerciseWidget extends StatelessWidget {
  const ExerciseWidget({
    super.key,
    required this.appTheme,
    required this.item,
  });

  final BaseTheme appTheme;
  final Excercise item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.insetsOnly(bottom: 10),
      child: Container(
        padding: context.insetsOnly(top: 8, bottom: 8, right: 8, left: 16),
        decoration: BoxDecoration(
          color: appTheme.neutral.c100!.withOpacity(.15),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HGap(4),
                  PoppinsText(
                    item.name,
                    color: appTheme.textColor.c600,
                    weight: FontWeight.w600,
                    size: 20,
                  ),
                  const HGap(8),
                  Row(
                    children: [
                      InfoWidget(
                        icon: AppAssets.ASSETS_ICONS_LOCATIONMARKER_SVG,
                        label: item.locationTown,
                      ),
                      const WGap(8),
                      Expanded(
                        child: InfoWidget(
                          icon: AppAssets.ASSETS_ICONS_STAR_SVG,
                          label: item.rating.toString(),
                        ),
                      ),
                    ],
                  ),
                  const HGap(8),
                  FilledText(
                    text: item.status,
                    color: Colors.green,
                  ),
                  const HGap(4),
                ],
              ),
            ),
            AssetsImage(
              item.image,
              both: 120,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(16),
            ),
          ],
        ),
      ),
    );
  }
}

class FilledText extends StatelessWidget {
  const FilledText({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.insetsSymetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: PoppinsText(
        text,
        color: color,
        weight: FontWeight.w600,
        size: 16,
      ),
    );
  }
}

class InfoWidget extends ConsumerWidget {
  final String icon, label;

  const InfoWidget({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context, ref) {
    final appTheme = ref.watch(appThemeProvider);
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          color: appTheme.iconColor.c100,
          height: 16,
        ),
        const WGap(4),
        PoppinsText(
          label,
          color: appTheme.textColor.c100,
          weight: FontWeight.w600,
          size: 16,
        ),
      ],
    );
  }
}
