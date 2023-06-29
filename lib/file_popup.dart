import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ui_project/model/file_object.dart';
import 'package:ui_project/service/file_picker_service.dart';

class FilePopUp extends StatefulWidget {
  const FilePopUp({super.key});

  @override
  State<FilePopUp> createState() => _FilePopUpState();
}

class _FilePopUpState extends State<FilePopUp> {
  final FilePickerService _filePickerService = FilePickerService.getInstance();
  List<FileObject> files = [];

  fileItem(FileObject file){
    bool isImage = ['jpg', 'jpeg', 'gif', 'png'].contains(file['extension']);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: isImage ? Image.file(File(file['path'] ?? '')):
        Image.asset('assets/images/${getAssetByExtension(file['extension'] ?? '')}.png'),
          ),
          SizedBox(height: 5,),
        Text(file['name'] ?? '', style: TextStyle(fontSize: 13), maxLines: 2, textAlign: TextAlign.center,)
        ],
      )
    );
  }

  String getAssetByExtension(String extension) {
    return FileExtensions[extension] ?? '';
  }

  @override
  initState(){
    super.initState();
    loadFiles();
  }

  loadFiles(){
    setState(() {
      files = _filePickerService.getCachedFiles();
    });
  }

  selectFiles() async {
    await _filePickerService.selectFiles();
    loadFiles();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text('Documents'),
            ),
            InkWell(
              child: Icon(Icons.attach_file, color: Colors.blue),
              onTap: selectFiles,
            ),
            SizedBox(width: 10),
            InkWell(
              child: Icon(
                Icons.close,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        SizedBox(height: 10),
        Flexible(
          child: SizedBox(
            width: double.maxFinite,
            child: (files.length < 1) ? Text('') : GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
              ),
              itemCount: files.length,
              itemBuilder: (BuildContext context, int index) {
                return fileItem(files[index]);
              }),
          ),
        )
      ]),
    );
  }
}
