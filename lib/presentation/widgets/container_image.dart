import 'dart:io';
import 'package:flutter/material.dart';

class ContainerImage extends StatefulWidget {
  final String? imagePath;
  const ContainerImage({Key? key, this.imagePath}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ContainerImageState();
}

class _ContainerImageState extends State<ContainerImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(top: 10, left: 30, right: 30),
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
                  Expanded(
                    child: SizedBox(
                      width: 400.0,
                      child: widget.imagePath == "" || widget.imagePath == null
                          ? const Center(child: Text('Nothing is selected!'))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.file(
                                File(widget.imagePath.toString()),
                                height: 300,
                                width: 300,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              )),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
