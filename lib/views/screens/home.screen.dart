import '../../__lib.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final appTheme = ref.watch(appThemeProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HGap(24),
              PopularActivitiesWidget(
                appTheme: appTheme,
              ),
              const HGap(16),
              BrowseByPointsWidget(
                appTheme: appTheme,
              ),
              const HGap(16),
              TrendingTodayWidget(appTheme: appTheme),
            ],
          ),
        ),
      ),
    );
  }
}
