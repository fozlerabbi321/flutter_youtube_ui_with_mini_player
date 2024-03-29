import 'package:flutter/material.dart';
import 'package:flutter_youtube_ui/data.dart';
import 'package:flutter_youtube_ui/screens/nav_screen.dart';
import 'package:flutter_youtube_ui/widgets/widgets.dart';
import 'package:miniplayer/miniplayer.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.read(miniPlayerControllerProvider).state.animateToHeight(state: PanelState.MAX);
        miniController.animateToHeight(state: PanelState.MAX);
      },
      child: Scaffold(
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: ValueListenableBuilder(
              valueListenable: selectedVideo2,
              builder: (BuildContext context, Video? video, Widget? child) {
                final selectedVideo = video;
                return SafeArea(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            selectedVideo!.thumbnailUrl,
                            height: 220.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          IconButton(
                            iconSize: 30.0,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            onPressed: () {
                              miniController.animateToHeight(state: PanelState.MIN);
                              // context.read(miniPlayerControllerProvider).state.animateToHeight(state: PanelState.MIN);
                            },
                          ),
                        ],
                      ),
                      const LinearProgressIndicator(
                        value: 0.4,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.red,
                        ),
                      ),
                      VideoInfo(video: selectedVideo),
                    ],
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
