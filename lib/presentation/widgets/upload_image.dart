import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  final Function(String) onImageSelected;
  const UploadImage({Key? key, required this.onImageSelected})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final picker = ImagePicker();
  String? selectedImage;
  dynamic pickImageError;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        onPressed: () {
          _onImageButtonPressed(ImageSource.gallery, context: context);
        },
        child: const Wrap(
          children: <Widget>[
            Icon(
              Icons.image_outlined,
              color: Colors.white,
              size: 24.0,
            ),
            SizedBox(
              width: 8,
            ),
            Text('Upload Image',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "RobotoMono",
                    color: Colors.white))
          ],
        ),
      ),
    ]);
  }

  Future<void> _onImageButtonPressed(
    ImageSource source, {
    required BuildContext context,
  }) async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: source,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 100,
      );

      setState(() {
        if (pickedFile != null) {
          selectedImage = pickedFile.path;
        } else {
          selectedImage = "";
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      });
      widget.onImageSelected(selectedImage.toString());
    } catch (e) {
      setState(() {
        pickImageError = e;
      });
    }
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality, int? limit);
