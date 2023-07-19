import 'dart:io';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

class DownloadImageService{
  static DownloadImageService _instance = DownloadImageService();

  static DownloadImageService getInstance(){
    return _instance;
  }

  String getExtensionFromResponse(Response response){
    String? contentType = response.headers["content-type"];
    if(contentType == null ){
      return "jpeg";
    }
    return {
      "image/jpeg" : "jpeg",
      "image/jpg" : "jpg",
      "image/png" : "png",
      "image/gif" : "gif",
    }[contentType] ?? "jpeg";
  }

  Future<File?> downloadNetworkImage(String fileName, String url) async{
    final Directory? downloadDir = await DownloadsPathProvider.downloadsDirectory;
    if(downloadDir == null ){
      throw Exception("Download folder not found");
    }
    
    Response response = await http.get(Uri.parse(url));
    
    if(response.statusCode != 200){
      throw Exception("File cannot be downloaded, file-url: $url ");
    }

    fileName += ".${getExtensionFromResponse(response)}";

    final localPath = path.join(downloadDir.path, fileName);
    final file = File(localPath);
    await file.writeAsBytes(response.bodyBytes);
    return file;
  } 
}