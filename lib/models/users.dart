part of 'models.dart';

class Users extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String password;
  final String pic;
  final String createdAt;
  final String updatedAt;

  Users(
    this.uid,
    this.name,
    this.email,
    this.password,
    this.pic,
    this.createdAt,
    this.updatedAt,
  );

  @override
  // TODO: implement props
  List<Object> get props => [
    uid,
    name,
    email,
    password,
    pic,
    createdAt,
    updatedAt,
  ];
}
