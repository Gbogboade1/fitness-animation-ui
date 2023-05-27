import '__lib.dart';

const animationDuration = 3 * 200;
void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();

    WidgetsFlutterBinding.ensureInitialized();
  }

  final Map<ThemeMode, ThemeData> appThemes = {
    ThemeMode.light: ThemeData(
      primarySwatch: AppInfo.appPrimarySwatch,
      brightness: Brightness.light,
      textTheme: AppInfo.appTextTheme,
    ),
    ThemeMode.dark: ThemeData(
      primarySwatch: AppInfo.appPrimarySwatch,
      brightness: Brightness.dark,
      textTheme: AppInfo.appTextTheme,
    )
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScaleAware(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final themeMode = ref.watch(appThemeModeProvider);
            ref.watch(appThemeProvider);
            return MaterialApp(
              title: AppInfo.appTitle,
              themeMode: themeMode,
              highContrastTheme: ThemeData(
                textTheme: AppInfo.appTextTheme,
              ),
              theme: appThemes[ThemeMode.light],
              darkTheme: appThemes[ThemeMode.dark],
              home: const DashboardScreen(),
              builder: (context, child) {
                final mediaQueryData = MediaQuery.of(context);
                final scale = mediaQueryData.textScaleFactor.clamp(0.7, .9);
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
                  child: child ?? const SizedBox.shrink(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
