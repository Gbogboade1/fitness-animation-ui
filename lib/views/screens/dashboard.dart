// ignore_for_file: deprecated_member_use

import '../../__lib.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  late ValueNotifier<int> _index;
  final List<String> navItems = [
    AppAssets.ASSETS_ICONS_HOME_SVG,
    AppAssets.ASSETS_ICONS_SEARCH_SVG,
    AppAssets.ASSETS_ICONS_LIGHTNINGBOLT_SVG,
    AppAssets.ASSETS_ICONS_CALENDAR_SVG,
    AppAssets.ASSETS_ICONS_USER_SVG,
  ];

  @override
  void initState() {
    super.initState();

    _index = ValueNotifier(0);
  }

  @override
  void dispose() {
    _index.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = ref.watch(appThemeProvider);

    return Scaffold(
      body: Stack(
        children: [
          const HomeScreen(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ValueListenableBuilder(
              valueListenable: _index,
              builder: (BuildContext context, value, Widget? child) => SafeArea(
                child: Container(
                  padding: context.insetsAll(8),
                  margin: context.insetsOnly(left: 16, right: 16, bottom: 16),
                  // height: context.scaleH(80),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: appTheme.primary.c400,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      navItems.length,
                      (index) {
                        final item = navItems[index];
                        bool isSelected = index == value;
                        return GestureDetector(
                          onTap: () {
                            _index.value = index;
                          },
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            // height: context.scaleH(80),
                            padding: context.insetsAll(8),
                            duration:
                                const Duration(milliseconds: animationDuration),
                            decoration: isSelected
                                ? BoxDecoration(
                                    color: appTheme.white.withOpacity(.4),
                                    shape: BoxShape.circle)
                                : null,
                            child: SvgPicture.asset(
                              item,
                              color: isSelected
                                  ? appTheme.primaryColor
                                  : appTheme.white,
                              alignment: Alignment.center,
                              fit: BoxFit.fill,
                              height: 36,
                              width: 36,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
