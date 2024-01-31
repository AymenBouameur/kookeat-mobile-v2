import 'dart:io';

import 'package:bloc/bloc.dart';

class AvatarCubit extends Cubit<File?> {
  AvatarCubit() : super(null);

  File? image;
  void changeAvatar(File? imageFile) {
    image = imageFile;
    emit(imageFile);
  }
}
