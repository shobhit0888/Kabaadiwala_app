import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kabaadiwala/pages/home_page.dart';
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
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  bool valueMetal = false;
  bool valuePaper = false;
  bool valueElectronic = false;
  bool valueWooden = false;
  bool valueConstruction = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Capture Image from Camera"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Column(children: [
                Container(
                    height: 600,
                    width: 350,
                    child: controller == null
                        ? Center(child: Text("Loading Camera..."))
                        : !controller!.value.isInitialized
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : CameraPreview(controller!)),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton.icon(
                  //image capture button
                  onPressed: () async {
                    try {
                      if (controller != null) {
                        //check if contrller is not null
                        if (controller!.value.isInitialized) {
                          //check if controller is initialized
                          image =
                              await controller!.takePicture(); //capture image
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
                  label: "Capture".text.xl2.make(),
                ),
                Container(
                  //show captured image
                  padding: EdgeInsets.all(30),
                  child: image == null
                      ? Text("No image captured")
                      : Image.file(
                          File(image!.path),
                          height: 500,
                          width: 300,
                        ),
                  //display captured image
                ),
                SizedBox(
                  height: 10,
                ),
                "What waste do you see?".text.xl2.bold.make(),
                SizedBox(
                  height: 10,
                ),
                CheckboxListTile(
                  secondary: const Icon(Icons.add_box),
                  title: const Text('Paper'),
                  subtitle: Text('Books, Cartons, etc'),
                  value: valuePaper,
                  onChanged: (bool? value) {
                    setState(() {
                      valuePaper = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  secondary: const Icon(Icons.add_box),
                  title: const Text('Metal'),
                  subtitle: Text('Accidental car, plumbing material, etc'),
                  value: valueMetal,
                  onChanged: (bool? value) {
                    setState(() {
                      valueMetal = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  secondary: const Icon(Icons.add_box),
                  title: const Text('Wooden'),
                  subtitle: Text('Furniture, Plywood, etc'),
                  value: valueWooden,
                  onChanged: (bool? value) {
                    setState(() {
                      valueWooden = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  secondary: const Icon(Icons.add_box),
                  title: const Text('Electronic'),
                  subtitle: Text('Batteries, boards, etc'),
                  value: valueElectronic,
                  onChanged: (bool? value) {
                    setState(() {
                      valueElectronic = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  secondary: const Icon(Icons.add_box),
                  title: const Text('Construction'),
                  subtitle: Text('Bricks, Concrete Blocks, etc'),
                  value: valueConstruction,
                  onChanged: (bool? value) {
                    setState(() {
                      valueConstruction = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton.icon(
                  //image capture button
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage())),

                  icon: Icon(Icons.check_box_sharp),
                  label: "Submit".text.xl2.make(),
                ),
                SizedBox(
                  height: 35,
                ),
              ])),
            ),
          ],
        ),
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
