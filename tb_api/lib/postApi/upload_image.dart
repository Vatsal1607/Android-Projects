import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {

  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;
  
  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    
    if(pickedFile != null){
      image = File(pickedFile.path);
      setState(() {
        
      });
    } else {
      print('Image not selected');
    }
  }
  
  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });
    var stream = new http.ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var request = new http.MultipartRequest('post', uri);
    request.fields['title'] = "static title";
    var multiport = new http.MultipartFile('image', stream, length);

    request.files.add(multiport);

    var response = await request.send();

    print(response.stream.toString());
    if(response.statusCode == 200){
      setState(() {
        showSpinner = false;
      });
      print('image uploaded');
    } else {
      setState(() {
        showSpinner = false;
      });
      print('failed');
    }
  }
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Upload image/ Post api'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => getImage(),
              child: Container(
                child: image == null ? const Center(
                  child: Text('Pick image', style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                  ),),
                )
                : Container(
                  child: Center(
                    child: Image.file(
                      File(image!.path).absolute,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  ),
                ),
              ),
            ),
            const SizedBox(height: 150,),
            GestureDetector(
              onTap: () => uploadImage(),
              child: Container(
                height: 50,
                width: 150,
                color: Colors.green,
                child: const Center(child: Text('Upload', style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold
                ),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
