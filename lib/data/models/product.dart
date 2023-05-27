import 'package:equatable/equatable.dart';

import '../../__lib.dart';

class Excercise extends Equatable {
  final String image;
  final String name;
  final String location;
  final String locationTown;
  final String status;
  final double rating;
  final int totalBooking;
  final bool isFavorite;
  final Key key;

  const Excercise({
    this.locationTown = 'MidTown',
    this.status = 'Excellent',
    this.totalBooking = 0,
    this.location = 'Shirt',
    this.name = "Essential Men's Short-Sleeve Crewnect T-Shirt",
    this.rating = 4.9,
    this.isFavorite = false,
    required this.image,
    required this.key,
  });

  @override
  List<Object?> get props => [key];
}
