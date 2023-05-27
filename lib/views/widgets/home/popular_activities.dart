import '../../../__lib.dart';

class PopularActivitiesWidget extends StatefulWidget {
  const PopularActivitiesWidget({
    super.key,
    required this.appTheme,
  });

  final BaseTheme appTheme;

  @override
  State<PopularActivitiesWidget> createState() =>
      _PopularActivitiesWidgetState();
}

class _PopularActivitiesWidgetState extends State<PopularActivitiesWidget> {
  final List<NavItem> popularList = [
    NavItem(
      imagePath: AppAssets.ASSETS_ACTIVITIES_1_PNG,
      title: 'Yoga',
      color: Colors.green,
    ),
    NavItem(
      imagePath: AppAssets.ASSETS_ACTIVITIES_2_JPG,
      title: 'Squat',
      color: Colors.pink,
    ),
    NavItem(
      imagePath: AppAssets.ASSETS_ACTIVITIES_3_JPG,
      color: Colors.brown,
      title: 'Relax',
    ),
    NavItem(
      imagePath: AppAssets.ASSETS_ACTIVITIES_4_JPG,
      title: 'Run',
      color: Colors.orange[500],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = widget.appTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.insetsOnly(left: 16),
          child: PoppinsText(
            'Popular activities',
            weight: FontWeight.w600,
            color: widget.appTheme.textColor.c600,
            size: 24,
          ),
        ),
        const HGap(6),
        SizedBox(
          height: context.scaleH(120),
          child: PopularList(popularList: popularList, appTheme: appTheme),
        ),
      ],
    );
  }
}

class PopulartWidget extends StatelessWidget {
  const PopulartWidget({
    super.key,
    required this.isLast,
    required this.item,
    required this.appTheme,
  });

  final bool isLast;
  final NavItem item;
  final BaseTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.insetsOnly(left: 16, right: isLast ? 16 : 0),
      child: Container(
        width: context.scaleW(90),
        decoration: BoxDecoration(
          color: item.color!.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssetsImage(
              item.imagePath,
              both: 48,
              shape: BoxShape.circle,
              fit: BoxFit.cover,
            ),
            const HGap(16),
            PoppinsText(
              item.title,
              color: appTheme.textColor.c600,
              weight: FontWeight.w600,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
