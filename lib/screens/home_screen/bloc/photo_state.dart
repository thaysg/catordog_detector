import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class PhotoState extends Equatable {
  const PhotoState([List props = const []]) : super();
}

class PhotoInitial extends PhotoState {
  @override
  List<Object> get props => this.props;
}

class PhotoSet extends PhotoState {
  final File photo;

  PhotoSet({required this.photo}) : super();

  @override
  List<Object?> get props => [photo];
}
