import '../../../__lib.dart';

class TrendingListView extends ConsumerStatefulWidget {
  const TrendingListView({
    super.key,
    required this.appTheme,
  });

  final BaseTheme appTheme;

  @override
  ConsumerState<TrendingListView> createState() => _TrendingListViewState();
}

class _TrendingListViewState extends ConsumerState<TrendingListView> {
  final _trendingListKey = GlobalKey<AnimatedListState>();

  _loadTrendingList() async {
    final list = ref.read(exerciseProvider);
    for (var i = 1; i < list.length; i++) {
      _trendingListKey.currentState!.insertItem(i,
          duration: const Duration(milliseconds: animationDuration));
      setState(() {});
      await Future.delayed(const Duration(milliseconds: animationDuration));
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadTrendingList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.read(exerciseProvider);
    return AnimatedList(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: context.insetsSymetric(horizontal: 16),
      key: _trendingListKey,
      initialItemCount: 1,
      itemBuilder: (context, index, animation) {
        final item = list[index];
        return SizeTransition(
          axis: Axis.vertical,
          sizeFactor: animation,
          child: ExerciseWidget(appTheme: widget.appTheme, item: item),
        );
      },
    );
  }
}
