import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vi_mi/core/injections.dart';
import 'package:vi_mi/domain/usecases/content_generate_usecase.dart';
import 'package:vi_mi/presentation/bloc/content_generate_bloc.dart';
import 'package:vi_mi/presentation/widgets/container_box.dart';
import 'package:vi_mi/presentation/widgets/container_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedImagePath;
  String? contentGenerated;
  void _onImagePath(String path) {
    setState(() {
      selectedImagePath = path;
    });
  }

  void _onContentGenerated(String content) {
    setState(() {
      contentGenerated = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContentGenerateBloc(
          contentGenerateUseCase: sl<ContentGenerateUseCase>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          leading: Transform.scale(
            scale: 3,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/icon/logo.png",
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
          title: Text(widget.title,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: "RobotoMono",
                  color: Colors.black)),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ContainerBox(
                imagePath: _onImagePath,
                contentGenerated: _onContentGenerated,
              ),
              ContainerImage(imagePath: selectedImagePath),
              Center(
                child: BlocBuilder<ContentGenerateBloc, ContentGenerateState>(
                  builder: (context, state) {
                    if (state is InitialGenerateContentState) {
                      return const Spacer();
                    } else if (state is LoadingGenerateContentState) {
                      return const Center(
                          child: SpinKitThreeBounce(
                        color: Colors.black,
                      ));
                    } else if (state is ErrorGenerateContentState) {
                      return const Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Oops! Error",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "RobotoMono",
                                      color: Colors.black)),
                            ],
                          ));
                    } else if (state is SuccessGenerateContentState) {
                      return Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(state.contentGenerated.toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "RobotoMono",
                                      color: Colors.black)),
                            ],
                          ));
                    }
                    return const Spacer();
                  },
                ),
              )
            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
