import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:ui_project/player.dart';

class AudioFileSelector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AudioFileSelectorState();
  }
}

class AudioFileSelectorState extends State<AudioFileSelector> {
  List<XFile> audioFiles = [];

  Future MultiFilePicker() async {
    audioFiles.clear();

    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.audio);
    if (result != null) {
      var _imageFileList = result.files;

      _imageFileList.forEach((image) {
        audioFiles.add(XFile(image.path.toString()));
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () async {
                  await MultiFilePicker();
                  setState(() {});
                },
                child: const Center(child: Text("Select Audio Files"))),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: audioFiles.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text("File: ${audioFiles[index].name}"),
                      InkWell(
                          child: Icon(Icons.play_arrow_outlined),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Player(filePath: audioFiles[index].path)),
                            );
                          }),
                     
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
