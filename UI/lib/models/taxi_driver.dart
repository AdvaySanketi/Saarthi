import 'package:equatable/equatable.dart';

class Saarthi extends Equatable {
  final String id;
  final String saarthiName;
  final double saarthiRating;
  final String taxiDetails;
  final String saarthiPic;

  Saarthi(this.id, this.saarthiName, this.saarthiPic, this.saarthiRating,
      this.taxiDetails);

  Saarthi.named(
      {this.id,
      this.saarthiName,
      this.saarthiPic,
      this.saarthiRating,
      this.taxiDetails});

  @override
  List<Object> get props =>
      [id, saarthiName, saarthiPic, saarthiRating, taxiDetails];
}
