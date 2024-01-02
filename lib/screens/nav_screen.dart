import 'package:flutter/material.dart';
import 'package:flutter_youtube_ui/data.dart';
import 'package:flutter_youtube_ui/screens/home_screen.dart';
import 'package:flutter_youtube_ui/screens/video_screen.dart';
import 'package:miniplayer/miniplayer.dart';

import '../app_utils.dart';

// final selectedVideoProvider = StateProvider<Video?>((ref) => null);
// final miniPlayerControllerProvider = StateProvider.autoDispose<MiniplayerController>((ref) => MiniplayerController());

///new
ValueNotifier<Video?> selectedVideo2 = ValueNotifier(null);
final MiniplayerController miniController = MiniplayerController();
final ValueNotifier<double> playerExpandProgress = ValueNotifier(playerMinHeight);
final double playerMinHeight = 60.0;

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {

  int _selectedIndex = 0;

  final _screens = [
    HomeScreen(),
    const Scaffold(body: Center(child: Text('Explore'))),
    const Scaffold(body: Center(child: Text('Add'))),
    const Scaffold(body: Center(child: Text('Subscriptions'))),
    const Scaffold(body: Center(child: Text('Library'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Stack(
      //   children: _screens
      //       .asMap()
      //       .map((i, screen) => MapEntry(
      //     i,
      //     Offstage(
      //       offstage: _selectedIndex != i,
      //       child: screen,
      //     ),
      //   ))
      //       .values
      //       .toList()
      //     ..add(
      //       Offstage(
      //         offstage: selectedVideo2.value == null,
      //         child: Miniplayer(
      //           controller: miniController,
      //           minHeight: _playerMinHeight,
      //           maxHeight: MediaQuery.of(context).size.height,
      //           builder: (height, percentage) {
      //             if (selectedVideo2.value == null)
      //               return const SizedBox.shrink();
      //
      //             if (height <= _playerMinHeight + 50.0)
      //               return Container(
      //                 color: Theme.of(context).scaffoldBackgroundColor,
      //                 child: Column(
      //                   children: [
      //                     Row(
      //                       children: [
      //                         Image.network(
      //                           selectedVideo2.value!.thumbnailUrl,
      //                           height: _playerMinHeight - 4.0,
      //                           width: 120.0,
      //                           fit: BoxFit.cover,
      //                         ),
      //                         Expanded(
      //                           child: Padding(
      //                             padding: const EdgeInsets.all(8.0),
      //                             child: Column(
      //                               crossAxisAlignment:
      //                               CrossAxisAlignment.start,
      //                               mainAxisSize: MainAxisSize.min,
      //                               children: [
      //                                 Flexible(
      //                                   child: Text(
      //                                     selectedVideo2.value!.title,
      //                                     overflow:
      //                                     TextOverflow.ellipsis,
      //                                     style: Theme.of(context)
      //                                         .textTheme
      //                                         .caption!
      //                                         .copyWith(
      //                                       color: Colors.white,
      //                                       fontWeight:
      //                                       FontWeight.w500,
      //                                     ),
      //                                   ),
      //                                 ),
      //                                 Flexible(
      //                                   child: Text(
      //                                     selectedVideo2.value!.author.username,
      //                                     overflow:
      //                                     TextOverflow.ellipsis,
      //                                     style: Theme.of(context)
      //                                         .textTheme
      //                                         .caption!
      //                                         .copyWith(
      //                                         fontWeight:
      //                                         FontWeight.w500),
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                         ),
      //                         IconButton(
      //                           icon: const Icon(Icons.play_arrow),
      //                           onPressed: () {},
      //                         ),
      //                         IconButton(
      //                           icon: const Icon(Icons.close),
      //                           onPressed: () {
      //                             context
      //                                 .read(selectedVideoProvider)
      //                                 .state = null;
      //                           },
      //                         ),
      //                       ],
      //                     ),
      //                     const LinearProgressIndicator(
      //                       value: 0.4,
      //                       valueColor: AlwaysStoppedAnimation<Color>(
      //                         Colors.red,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               );
      //             return VideoScreen();
      //           },
      //         ),
      //       ),
      //     ),
      // ),
      body: Stack(
        children: [
          Container(
            child: _screens[_selectedIndex],
          ),
          ValueListenableBuilder(
            valueListenable: selectedVideo2,
            builder: (BuildContext context, Video? video,
                Widget? child) =>
            video != null ? Offstage(
              offstage: selectedVideo2.value == null,
              child: Miniplayer(
                valueNotifier: playerExpandProgress,
                controller: miniController,
                minHeight: playerMinHeight,
                maxHeight: MediaQuery.of(context).size.height,
                builder: (height, percentage) {
                  if ( selectedVideo2.value == null)
                    return const SizedBox.shrink();

                  if (height <= playerMinHeight + 50.0)
                    return Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                selectedVideo2.value!.thumbnailUrl,
                                height: playerMinHeight - 4.0,
                                width: 120.0,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          selectedVideo2.value!.title,
                                          overflow:
                                          TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                            color: Colors.white,
                                            fontWeight:
                                            FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          selectedVideo2.value!.author.username,
                                          overflow:
                                          TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                              fontWeight:
                                              FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.play_arrow),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  selectedVideo2.value = null;
                                  // context.read(selectedVideoProvider).state = null;
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
                        ],
                      ),
                    );
                  return VideoScreen();
                },
              ),
            ) : const SizedBox.shrink(),
          ),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: playerExpandProgress,
        builder: (BuildContext context, double height, Widget? child) {
          final value = percentageFromValueInRange(
              min: playerMinHeight, max: playerMaxHeight(context), value: height);

          var opacity = 1 - value;
          if (opacity < 0) opacity = 0;
          if (opacity > 1) opacity = 1;

          return SizedBox(
            height: kBottomNavigationBarHeight - kBottomNavigationBarHeight * value,
            child: Transform.translate(
              offset: Offset(0.0, kBottomNavigationBarHeight * value * 0.5),
              child: Opacity(
                opacity: opacity,
                child: OverflowBox(
                  maxHeight: kBottomNavigationBarHeight,
                  child: child,
                ),
              ),
            ),
          );
        },
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (i) => setState(() => _selectedIndex = i),
          selectedFontSize: 10.0,
          unselectedFontSize: 10.0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              activeIcon: Icon(Icons.add_circle),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              activeIcon: Icon(Icons.subscriptions),
              label: 'Subscriptions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              activeIcon: Icon(Icons.video_library),
              label: 'Library',
            ),
          ],
        ),
      ),
    );
  }
}
