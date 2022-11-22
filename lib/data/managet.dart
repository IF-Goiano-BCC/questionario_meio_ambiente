import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';


Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false; 
  }

const jsonPaht = 'data.json';
Future<String> get _localPath async {
  if (await _requestPermission(Permission.storage) && await  _requestPermission(Permission.manageExternalStorage)) {
    var directory = await getExternalStorageDirectory();
    String newPath = "";
    List<String> paths = directory!.path.split("/");
    for (int x = 1; x < paths.length; x++) {
      String folder = paths[x];
      if (folder != "Android") {
        newPath += "/$folder";
      } else {
        break;
      }
    }
    newPath = "$newPath/MapUrb";
    directory = Directory(newPath);
    return directory.path;
  }
  throw("File error");
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/$jsonPaht');
}

Future<String> get _localFilePath async {
  final path = await _localPath;
  return '$path/$jsonPaht';
}

updateLocaldata(Map<String, dynamic> newRegistry) async{
  File f = await _localFile;
  if(! f.existsSync()){
    f.createSync(recursive: true);
    await f.writeAsString('{"data":[]}');
  }
  final contents = await f.readAsString();

  var jsonResult = jsonDecode(contents);
  // do te json update here kek
  print(contents);
  jsonResult["data"].add(newRegistry);
  final updatedjson = jsonEncode(jsonResult);
  return f.writeAsString(updatedjson);
}

exportJson(){
}