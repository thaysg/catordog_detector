import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class PhotoEvent extends Equatable {
  PhotoEvent([List props = const []]) : super();
}

class GetPhoto extends PhotoEvent {
  final File photo;

  GetPhoto(this.photo);

  @override
  List<Object> get props => [];
}
