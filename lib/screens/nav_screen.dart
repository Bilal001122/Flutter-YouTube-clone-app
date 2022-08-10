import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/screens/video_screen.dart';
import 'home_screen.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/provider_data_class.dart';

class NavScreen extends StatefulWidget {
  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  final _screens = [
    HomeScreen(),
    Scaffold(
      body: Center(
        child: Text('Explore'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('Add'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('Subscriptions'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('Library'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _screens
            .asMap()
            .map(
              (i, screen) => MapEntry(
                i,
                Offstage(
                  offstage: _selectedIndex != i,
                  child: screen,
                ),
              ),
            )
            .values
            .toList()
          ..add(
            Offstage(
              offstage:
                  Provider.of<ProviderData>(context).selectedVideo == null,
              child: Miniplayer(
                controller:
                    Provider.of<ProviderData>(context).miniPlayerController,
                minHeight: 60,
                maxHeight: MediaQuery.of(context).size.height,
                builder: (height, percentage) {
                  if (Provider.of<ProviderData>(context).selectedVideo ==
                      null) {
                    return SizedBox.shrink();
                  }

                  if (height <= 60 + 50) {
                    return Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                Provider.of<ProviderData>(context)
                                    .selectedVideo!
                                    .thumbnailUrl,
                                height: 60 - 4,
                                width: 120,
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
                                          Provider.of<ProviderData>(context)
                                              .selectedVideo!
                                              .title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          Provider.of<ProviderData>(context)
                                              .selectedVideo!
                                              .author
                                              .username,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.play_arrow),
                              ),
                              IconButton(
                                onPressed: () {
                                  Provider.of<ProviderData>(context,
                                          listen: false)
                                      .changeVideoSelected(null);
                                },
                                icon: Icon(Icons.close),
                              ),
                            ],
                          ),
                          const LinearProgressIndicator(
                            value: 0.4,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    );
                  }
                  return VideoScreen();
                },
              ),
            ),
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (i) {
          setState(
            () {
              _selectedIndex = i;
            },
          );
        },
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
    );
  }
}
