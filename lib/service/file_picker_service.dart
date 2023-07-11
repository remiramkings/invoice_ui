
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:ui_project/model/file_object.dart';

class FilePickerService {

  static FilePickerService _instance = FilePickerService();

  static FilePickerService getInstance() {
    return _instance;
  }

  List<FileObject> filesCached = [];

  bool hasAnyFilesCached() {
    return filesCached.isNotEmpty;
  }

  Future<bool> selectFiles({bool multiple = true}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: multiple,
      type: FileType.custom,
      allowedExtensions: FileExtensions.keys.toList(),
      
    );

    if(result == null || result.files.isEmpty){
      return false;
    }

    if(!multiple){
      clearCached();
    }

    result.files
      .forEach((file) => (!isPathExists(file.path)) ? filesCached.add({
        'name': file.name,
        'path': file.path ?? '',
        'extension': file.extension ?? '',
        'size': '${file.size}'
        }): null
      );
      
     return true;
  }

  bool isPathExists(String? path){
    if(path == null) {
      return true;
    }
    return filesCached
      .any((element) => element['path'] == path);
  }

  List<FileObject> getCachedFiles(){
    return filesCached;
  }
  clearCached(){
    filesCached.clear();
  }
}