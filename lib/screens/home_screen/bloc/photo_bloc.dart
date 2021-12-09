import 'package:catordog_detector/screens/home_screen/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotoInitial());

  @override
  Stream<PhotoState> mapEventToState(PhotoEvent event) async* {
    if (event is GetPhoto) {
      final photo = event.photo;
      yield PhotoSet(photo: photo);
    }
  }
}
