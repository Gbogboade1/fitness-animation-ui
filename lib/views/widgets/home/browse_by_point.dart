import '../../../__lib.dart';

class BrowseByPointsWidget extends StatefulWidget {
  const BrowseByPointsWidget({
    super.key,
    required this.appTheme,
  });

  final BaseTheme appTheme;

  @override
  State<BrowseByPointsWidget> createState() => _BrowseByPointsWidgetState();
}

class _BrowseByPointsWidgetState extends State<BrowseByPointsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.insetsOnly(left: 16),
          child: PoppinsText(
            'Browse by points',
            weight: FontWeight.w600,
            color: widget.appTheme.textColor.c600,
            size: 24,
          ),
        ),
        const HGap(6),
        SizedBox(
          height: context.scaleH(90),
          child: PointListWidget(
            appTheme: widget.appTheme,
          ),
        ),
      ],
    );
  }
}


class PointWidget extends ConsumerWidget {
  const PointWidget({
    super.key,
    required this.isLast,
    required this.bgColor,
    required this.label,
  });

  final bool isLast;
  final Color bgColor;
  final String label;

  @override
  Widget build(BuildContext context, ref) {
    final appTheme = ref.watch(appThemeProvider);
    return Padding(
      padding: context.insetsOnly(left: 16, right: isLast ? 16 : 0),
      child: Container(
        width: context.scaleW(100),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.ASSETS_ICONS_LIGHTNINGBOLT_SVG,
              // ignore: deprecated_member_use
              color: appTheme.white,
              height: 32,
            ),
            PoppinsText(
              label,
              color: appTheme.white,
              weight: FontWeight.w600,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
