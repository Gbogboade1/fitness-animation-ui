import '../__lib.dart';

final exerciseProvider =
    StateNotifierProvider<ProductsProvider, List<Excercise>>(
  (ref) => ProductsProvider([]),
);

class ProductsProvider extends StateNotifier<List<Excercise>> {
  ProductsProvider(super.state) {
    generateProducts();
  }

  generateProducts() {
    final items = List.generate(
      20,
      (index) => Excercise(
          image: 'assets/yoga/${index % 4}.jpg',
          key: UniqueKey(),
          name: 'Sonic Yoga'),
    );

    items.shuffle();
    state = items;
  }

  toggleFavorite(Excercise product) {
    final updateItems = state.map((Excercise e) {
      if (e == product) {
        e = Excercise(image: e.image, key: e.key, isFavorite: !e.isFavorite);
      }
      return e;
    }).toList();

    state = updateItems;
  }
}
