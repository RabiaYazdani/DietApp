import 'dart:io';
import 'package:camera/camera.dart';
import 'package:diet_app/Screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../app_color.dart';
import '../constants.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      ConstantParameters.camera.first,
      // Define the resolution to use.
      ResolutionPreset.high,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        // You must wait until the controller is initialized before displaying the
        // camera preview. Use a FutureBuilder to display a loading spinner until the
        // controller has finished initializing.
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the Future is complete, display the preview.
                    return CameraPreview(_controller);
                  } else {
                    // Otherwise, display a loading indicator.
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 40,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    child: TextButton(
                      onPressed: () async {
                        // Take the Picture in a try / catch block. If anything goes wrong,
                        // catch the error.
                        try {
                          // Ensure that the camera is initialized.
                          await _initializeControllerFuture;

                          // Attempt to take a picture and get the file `image`
                          // where it was saved.
                          final image = await _controller.takePicture();

                          if (!mounted) return;
                          // If the picture was taken, display it on a new screen.
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DisplayPictureScreen(
                                // Pass the automatically generated path to
                                // the DisplayPictureScreen widget.
                                imagePath: image.path,
                              ),
                            ),
                          );
                        } catch (e) {
                          // If an error occurs, log the error to the console.
                          if (kDebugMode) {
                            print(e);
                          }
                        }
                      },
                      child: const Text(''),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.file(File(imagePath), fit: BoxFit.fill)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: AppColor.blackShade,
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CameraScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: AppColor.red,
                      size: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeScreen(imagePath: imagePath),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
