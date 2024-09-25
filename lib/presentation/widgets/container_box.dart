import 'package:flutter/material.dart';
import 'package:vi_mi/presentation/widgets/search_bar.dart';
import 'package:vi_mi/presentation/widgets/upload_image.dart';

class ContainerBox extends StatefulWidget {
  final Function(String) imagePath;
  final Function(String) contentGenerated;
  const ContainerBox(
      {Key? key, required this.imagePath, required this.contentGenerated})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _ContainerBoxState();
}

class _ContainerBoxState extends State<ContainerBox> {
  String? selectedImagePath;
  String? contentGenerated;

  void _onImageSelected(String path) {
    setState(() {
      selectedImagePath = path;
    });
    widget.imagePath(path);
  }

  void _onContentGenerated(String content) {
    setState(() {
      contentGenerated = content;
    });
    widget.contentGenerated(content);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Container(
              margin: const EdgeInsets.all(30),
              height: 200,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30), //border corner radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    spreadRadius: 5, //spread radius
                    blurRadius: 7, // blur radius
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Find somethings by image',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: "RobotoMono",
                          color: Colors.black)),
                  SearchBox(
                      imagePath: selectedImagePath,
                      contentGenerated: _onContentGenerated),
                  UploadImage(onImageSelected: _onImageSelected),
                ],
              )),
        ],
      ),
    );
  }
}
