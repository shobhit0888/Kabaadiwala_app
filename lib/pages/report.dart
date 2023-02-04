import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

class Report extends StatefulWidget {
   Report({
    super.key,
    
  });
  
  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; 
  
  // late CameraController _controller;
  // late Future<void> _initializeControllerFuture;
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
      cameras = await availableCameras();
      if(cameras != null){
        controller = CameraController(cameras![0], ResolutionPreset.max);
                    //cameras[0] = first camera, change to 1 to another camera
                    
        controller!.initialize().then((_) {
            if (!mounted) {
              return;
            }
            setState(() {});
        });
      }else{
        print("NO any camera found");
      }
  }

  @override
 Widget build(BuildContext context) {
    
    return  Scaffold(
          appBar: AppBar( 
              title: Text("Capture Image from Camera"),
              backgroundColor: Colors.redAccent,
          ),
          body: Container( 
            child: Column(
              children:[
                  Container(
                      height:300,
                      width:400,
                      child: controller == null?
                          Center(child:Text("Loading Camera...")):
                                !controller!.value.isInitialized?
                                  Center(
                                    child: CircularProgressIndicator(),
                                  ):
                                  CameraPreview(controller!)
                  ),
ElevatedButton.icon( //image capture button
                    onPressed: () async{
                        try {
                          if(controller != null){ //check if contrller is not null
                              if(controller!.value.isInitialized){ //check if controller is initialized
                                  image = await controller!.takePicture(); //capture image
                                  setState(() {
                                    //update UI
                                  });
                              }
                          }
                        } catch (e) {
                            print(e); //show error
                        }
                    },
                    icon: Icon(Icons.camera),
                    label: Text("Capture"),
                  ),
                  Container( //show captured image
                     padding: EdgeInsets.all(30),
                     child: image == null?
                           Text("No image captured"):
                           Image.file(File(image!.path), height: 300,), 
                           //display captured image
                  )
              ]
            )
          ),
           
       );
  }
}

// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;

//   const DisplayPictureScreen({super.key, required this.imagePath});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Display the Picture')),
//       // The image is stored as a file on the device. Use the `Image.file`
//       // constructor with the given path to display the image.
//       body: Image.file(File(imagePath)),
//     );
//   }
// }
