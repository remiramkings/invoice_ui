import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:video_compress_plus/video_compress_plus.dart';
import 'package:path/path.dart' as path;

class MediaCompressService {
  static MediaCompressService _instance = MediaCompressService();
  static MediaCompressService getInstance() {
    return _instance;
  }

  static Future<MediaInfo?> compressVideo(String path, VideoQuality quality) async {
    return await VideoCompress.compressVideo(path,
        quality: quality, deleteOrigin: false);
  }

  static void subscribe(){
  }

  static Future<String> generateFileName(String extension) async {
    Directory? directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();
    
    String fileName = 'IMG_${DateFormat('yyyyMMdd_hhmmss').format(DateTime.now())}.$extension';
    
    return '${directory!.path}/${fileName}';
  }

  static Future<XFile?> imageCompressAndGetFile(File file, {String? targetPath}) async {
    if(targetPath == null){
      String extension = path.extension(file.path);
      targetPath = await generateFileName(extension);
    }
    var result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path, targetPath,
        quality: 88,
        rotate: 0,
      );

  //  print(file.lengthSync());
    //print(result.lengthSync());

    return result;
  }
}
