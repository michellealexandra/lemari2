part of 'models.dart';

class Closets extends Equatable {
  final String closetId;
  final String closetName;
  final String closetDesc;
  final String closetImage;
  final String closetAddBy;
  final String createdAt;
  final String updatedAt;

  Closets(
    this.closetId,
    this.closetName,
    this.closetDesc,
    this.closetImage,
    this.closetAddBy,
    this.createdAt,
    this.updatedAt,
  );

  @override
  // TODO: implement props
  List<Object> get props => [
    closetId,
    closetName,
    closetDesc,
    closetImage,
    closetAddBy,
    createdAt,
    updatedAt,
  ];
}
