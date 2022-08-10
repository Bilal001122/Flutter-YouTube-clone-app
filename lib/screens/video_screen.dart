import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/data.dart';
import 'package:youtube_clone/provider_data_class.dart';
import 'package:youtube_clone/widgets/widgets.dart';

class VideoScreen extends StatefulWidget {
  @override
  State<VideoScreen> createState() => _VideoScreenState();
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
    super.dispose();
    _scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Provider.of<ProviderData>(context).animateToHeightWithProvider(),
      child: Scaffold(
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: CustomScrollView(
            controller: _scrollController,
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: Consumer<ProviderData>(
                  builder: (context, providerData, child) {
                    return SafeArea(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                providerData.selectedVideo!.thumbnailUrl,
                                height: 220,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              IconButton(
                                onPressed: () {
                                  providerData.animateToHeightWithProviderMin();
                                },
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                              ),
                            ],
                          ),
                          const LinearProgressIndicator(
                            value: 0.4,
                            color: Colors.red,
                          ),
                          VideoInfo(video: providerData.selectedVideo!),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final video = suggestedVideos[index];
                    return VideoCard(
                      video: video,
                      hasPadding: true,
                      onTap: () => _scrollController!.animateTo(0,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn),
                    );
                  },
                  childCount: suggestedVideos.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
