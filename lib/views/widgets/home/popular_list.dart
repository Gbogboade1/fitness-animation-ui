import '../../../__lib.dart';

class PopularList extends StatefulWidget {
  const PopularList({
    super.key,
    required this.popularList,
    required this.appTheme,
  });

  final List<NavItem> popularList;
  final BaseTheme appTheme;

  @override
  State<PopularList> createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
  int get total => widget.popularList.length;
  
  final _popularListKey = GlobalKey<AnimatedListState>();


  _loadPopularList() async {
    for (var i = 1; i < total; i++) {
      _popularListKey.currentState!.insertItem(i,
          duration: const Duration(milliseconds: animationDuration));
      setState(() {});
      await Future.delayed(const Duration(milliseconds: animationDuration));
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadPopularList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _popularListKey,
      initialItemCount: 1,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index, animation) {
        final item = widget.popularList[index];
        bool isLast = index + 1 == total;
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, .3),
            end: const Offset(0, 0),
          ).animate(animation),
          child: PopulartWidget(
              isLast: isLast, item: item, appTheme: widget.appTheme),
        );
      },
    );
  }
}
