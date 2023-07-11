import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:ui_project/model/file_object.dart';
import 'package:ui_project/service/file_picker_service.dart';
import 'package:ui_project/service/media_compress_service.dart';
import 'package:video_compress_plus/video_compress_plus.dart';

class FileCompressor extends StatefulWidget {
  const FileCompressor({super.key});

  @override
  State<FileCompressor> createState() => _FileCompressorState();
}

class _FileCompressorState extends State<FileCompressor> {
  FileObject? file;
  Future<MediaInfo?>? videoInfoFuture;
  Future<XFile?>? imageInfoFuture;
  int compressedImageFIleLength = 0;
  showImage(){
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Image.file(File(file!['path'] ?? ''))),

          Text('Size: ${((int.parse(file!['size'] ?? '')/1024)).round()} Kb'),
        ElevatedButton(onPressed: (){
          setState(() {
            imageInfoFuture = MediaCompressService.imageCompressAndGetFile(File(file!['path'] ?? ''));
          });
        }, child: Text('Compress image')),
          FutureBuilder<XFile?>(
            future: imageInfoFuture,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator.adaptive();
              }
              if(snapshot.data!=null){
                getCompressedImageLength(snapshot.data!);
              }
              return snapshot.data != null ? 
                Column(
                  children: [
                    Text('Compression finished, compressed to ${((compressedImageFIleLength)/1024).round()} Kb'),
                    SizedBox(height: 250,
                    child: Image.file(File(snapshot.data!.path)),)
                  ],
                )
                : Text('Not done');
            },
          )
      ],
    );
  }

  getCompressedImageLength(XFile file) async {
    int len = await file.length();
    setState(() {
      compressedImageFIleLength = len;
    });
  }

  showVideo(){
    return Column(
      children: [
        Image.asset('assets/images/video.png'),
        Text('Size: ${((int.parse(file!['size'] ?? '')/1024)).round()} Kb'),
         ElevatedButton(onPressed: ()  {
            setState((){
              videoInfoFuture = MediaCompressService.compressVideo(file!['path'] ?? '', VideoQuality.LowQuality);
            });
         }, child: Text('Compress video')),
          FutureBuilder<MediaInfo?>(
            future: videoInfoFuture,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator.adaptive();
              }
              return snapshot.data!=null ? Text('Compression finished, compressed to ${((snapshot.data!.filesize ?? 0)/1024).round()} Kb'): Text('Not done');
            },
          )
      ],
    );
  }

  showMedia() {
    switch(FileExtensions[file!['extension']]){
      case 'video':
        return showVideo();
      case 'image':
        return showImage();
      default:
        return Text('${file!['extension']} is not a media');
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File compressor'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(onPressed: ()async{
                  if(await FilePickerService.getInstance().selectFiles(multiple: false)==true){
                      setState(() {
                        file = FilePickerService.getInstance().getCachedFiles().first;
                      });
                  };                 
                }, child: Text('Select Image / Video')),
                file != null ?  showMedia()
                  : Text(''),
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}