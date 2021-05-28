part of 'models.dart';

class Clothes extends Equatable {
  final String clothesId;
  final String clothesName;
  final String clothesDesc;
  final String clothesImage;
  final String clothesCloset;
  final String clothesAddBy;
  final String clothesAge;
  final String clothesTag;
  final String clothesStatus;
  final String clothesLaundry;
  final String createdAt;
  final String updatedAt;

  Clothes(
    this.clothesId,
    this.clothesName,
    this.clothesDesc,
    this.clothesImage,
    this.clothesCloset,
    this.clothesAddBy,
    this.clothesAge,
    this.clothesTag,
    this.clothesStatus,
    this.clothesLaundry,
    this.createdAt,
    this.updatedAt,
  );

  @override
  // TODO: implement props
  List<Object> get props => [
    clothesId,
    clothesName,
    clothesDesc,
    clothesImage,
    clothesCloset,
    clothesAddBy,
    clothesAge,
    clothesTag,
    clothesStatus,
    clothesLaundry,
    createdAt,
    updatedAt,
  ];
}
