import 'dart:developer';
import 'dart:io';

import 'package:cookeat/config/theme/theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class FilesUtils {
  FilesUtils._();

  ///
  static Future<File?> uploadAvatarFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png'],
      );

      if (result != null) {
        final file = result.files.single;

        final img = await cropAvatar(file.path!);
        return img;
      }
    } catch (e) {
      log('Error picking avatar: $e');
    }
    return null;
  }

  /// Crop Image.
  static Future<File?> cropAvatar(String imagePath) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: imagePath,
      aspectRatio: const CropAspectRatio(ratioX: 500, ratioY: 500),
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '',
          toolbarColor: AppColors.accentColor,
          toolbarWidgetColor: AppColors.backgroundColor,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: '',
          aspectRatioPickerButtonHidden: true,
          resetAspectRatioEnabled: false,
          aspectRatioLockEnabled: true,
        ),
      ],
    );

    if (croppedImage != null) {
      final img = File(croppedImage.path);
      return img;
    }
    return null;
  }
}
