import '../__lib.dart';

final appThemeModeProvider =
    StateNotifierProvider<AppThemeModeProvider, ThemeMode>(
  (ref) => AppThemeModeProvider(ThemeMode.system),
);
final appThemeProvider = StateNotifierProvider<AppThemeDataProvider, BaseTheme>(
  (ref) => AppThemeDataProvider(ref: ref, state: AppBaseThemeValues.lightTheme),
);

class AppThemeDataProvider extends StateNotifier<BaseTheme>
    with WidgetsBindingObserver {
  final StateNotifierProviderRef ref;

  AppThemeDataProvider({required this.ref, required BaseTheme state})
      : super(state) {
    _init();
  }

  _init() {
    final mode = ref.watch(appThemeModeProvider);
    state = getTheme(mode);
  }

  BaseTheme getTheme(ThemeMode mode) {
    switch (ref.read(appThemeModeProvider)) {
      case ThemeMode.light:
        return AppBaseThemeValues.lightTheme;
      case ThemeMode.dark:
        return AppBaseThemeValues.darkTheme;
      default:
        if (WidgetsBinding.instance.window.platformBrightness ==
            Brightness.light) {
          return AppBaseThemeValues.lightTheme;
        } else {
          return AppBaseThemeValues.darkTheme;
        }
    }
  }

  Color get primaryColor => state.primaryColor;

  @override
  void didChangePlatformBrightness() {
    _updateThemeData();
    super.didChangePlatformBrightness();
  }

  _updateThemeData() {
    if (ref.read(appThemeModeProvider) == ThemeMode.system) {
      if (WidgetsBinding.instance.window.platformBrightness ==
          Brightness.light) {
        state = AppBaseThemeValues.lightTheme;
      } else {
        state = AppBaseThemeValues.darkTheme;
      }
    }
  }
}

class AppThemeModeProvider extends StateNotifier<ThemeMode>
    with WidgetsBindingObserver {
  AppThemeModeProvider(ThemeMode state) : super(state) {
    _init();
  }

  _init() async {
    state = await themeRepo.getTheme();
  }

  update(ThemeMode newMode) {
    state = newMode;

    themeRepo.setThemeMode(mode: state);
  }
}
