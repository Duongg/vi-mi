import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vi_mi/presentation/bloc/content_generate_bloc.dart';

class SearchBox extends StatefulWidget {
  final String? imagePath;
  final Function(String) contentGenerated;
  const SearchBox({Key? key, this.imagePath, required this.contentGenerated})
      : super(key: key);
  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final searchTextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 8),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  controller: searchTextController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    hintText: 'Type something ...',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: IconButton(
                  onPressed: () {
                    if (widget.imagePath != null) {
                      context.read<ContentGenerateBloc>().add(
                            OnGenerateContentEvent(searchTextController.text,
                                widget.imagePath.toString()),
                          );
                    }
                  },
                  icon: const Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                    size: 32.0,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
