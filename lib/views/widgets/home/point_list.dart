import '../../../__lib.dart';

class PointListWidget extends StatefulWidget {
  const PointListWidget({super.key, required this.appTheme});

  final BaseTheme appTheme;

  @override
  State<PointListWidget> createState() => _PointListWidgetState();
}

class _PointListWidgetState extends State<PointListWidget> {
  final _browseListKey = GlobalKey<AnimatedListState>();
  final int total = 6;

  _loadBrowseList() async {
    for (var i = 1; i < total; i++) {
      _browseListKey.currentState!.insertItem(i,
          duration: const Duration(milliseconds: animationDuration));
      setState(() {});
      await Future.delayed(const Duration(milliseconds: animationDuration));
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadBrowseList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _browseListKey,
      initialItemCount: 1,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.2, 0),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
                reverseCurve: Curves.ease),
          ),
          child: PointWidget(
            isLast: index + 1 == total,
            bgColor: widget.appTheme.primary.c600!
                .withOpacity(((index + 1) * .4).clamp(.1, 1)),
            label: '<${(index + 1) * 5} points',
          ),
        );
      },
    );
  }
}
