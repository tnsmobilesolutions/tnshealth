part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileTextchanged extends ProfileEvent {
  String? name;
  String? phoneNo;
  String? email;
  String? bloodGroup;
  String? gender;
  String? height;
  String? weight;
  String? country;
  ProfileTextchanged({
    this.name,
    this.phoneNo,
    this.email,
    this.bloodGroup,
    this.gender,
    this.height,
    this.weight,
    this.country,
  });
}

class ProfileUpdateButton extends ProfileEvent {}
