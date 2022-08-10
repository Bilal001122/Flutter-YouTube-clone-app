import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/data.dart';

class ProviderData extends ChangeNotifier {
  Video? selectedVideo;
  MiniplayerController? miniPlayerController = MiniplayerController();

  void changeVideoSelected(Video? video) {
    selectedVideo = video;
    notifyListeners();
  }

  void animateToHeightWithProvider() {
    miniPlayerController!.animateToHeight(state: PanelState.MAX);
    notifyListeners();
  }

  void animateToHeightWithProviderMin() {
    miniPlayerController!.animateToHeight(state: PanelState.MIN);
    notifyListeners();
  }
}
