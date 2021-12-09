/* import 'dart:io';

import 'package:catordog_detector/screens/home_screen/bloc/photo_bloc.dart';
import 'package:catordog_detector/screens/home_screen/bloc/photo_evente.dart';
import 'package:catordog_detector/screens/home_screen/bloc/photo_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

class PhotoBlocMock extends MockBloc<PhotoEvent, PhotoState>
    implements PhotoBloc {}

class PhotoEventFake extends Fake implements PhotoEvent {}

void main() {
  setUpAll(() {
    registerFallbackValue<PhotoEvent>(
      PhotoEventFake(),
    );
    registerFallbackValue<PhotoState>(
      PhotoSet(
        photo: File('image'),
      ),
    );
  });

  group('ProfileBloc', () {
    blocTest(
      'defines properly state for UpdateName',
      build: () => PhotoBloc(),
      act: (PhotoBloc bloc) {
        bloc.add(
          GetPhoto(),
        );
      },
      verify: (PhotoBloc bloc) {
        verify(() => bloc.add(PhotoSet())).called(1);
      },
    );
  });
}
 */