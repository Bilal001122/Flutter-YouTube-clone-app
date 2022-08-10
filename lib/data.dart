class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User({
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });
}

const User currentUser = User(
  username: 'Arab Bilal',
  profileImageUrl: 'https://avatars.githubusercontent.com/u/101145194?v=4',
  subscribers: '200M',
);

const User HBO = User(
  username: 'HBO Max',
  profileImageUrl:
      'https://yt3.ggpht.com/TcXFMFkDeUN8pDqZ-2WShXiG6lXtpoRG2kfRMg3Nd9g947mESyRYqlWtwcoy9FyjiiLVLaTd=s48-c-k-c0x00ffffff-no-rj',
  subscribers: '1.48M',
);

const User PNL = User(
  username: 'PNL',
  profileImageUrl:
      'https://yt3.ggpht.com/ytc/AMLnZu-uO3upzsTeiJ_VRQnIXc7OD5sByOdJI32zlPOr2A=s48-c-k-c0x00ffffff-no-rj-mo',
  subscribers: '5.73M',
);

const User Bilal = User(
  username: 'Arab Bilal',
  profileImageUrl: 'https://avatars.githubusercontent.com/u/101145194?v=4',
  subscribers: '100M',
);

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;

  const Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
  });
}

final List<Video> videos = [
  Video(
    id: 'ilX5hnH8XoI',
    author: Bilal,
    title: 'Youtube UI using Flutter',
    thumbnailUrl:
        'https://ui4free.com/storage/public/images/figma-youtube-ui-clone-design_1636342529.jpg',
    duration: '10:53',
    timestamp: DateTime(2022, 8, 10),
    viewCount: '200M',
    likes: '200M',
    dislikes: '200M',
  ),
  Video(
    id: 'x606y4QWrxo',
    author: HBO,
    title: 'House of the Dragon | Official Trailer | HBO Max',
    thumbnailUrl: 'https://i.ytimg.com/vi/DotnJ7tTA34/mqdefault.jpg',
    duration: '2:49',
    timestamp: DateTime(2022, 7, 20),
    viewCount: '17M',
    likes: '199K',
    dislikes: '2K',
  ),
  Video(
    author: PNL,
    id: 'vrPk6LB9bjo',
    title: 'PNL - Tahia',
    thumbnailUrl:
        'https://i.ytimg.com/vi/CpXPUMEhDNU/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBQleL4vQ6qGLIc5rzHrXkYlV7RTQ',
    duration: '03:06',
    timestamp: DateTime(2019, 7, 19),
    viewCount: '12M',
    likes: '337K',
    dislikes: '3K',
  ),
];

final List<Video> suggestedVideos = [
  Video(
    id: 'ilX5hnH8XoI',
    author: Bilal,
    title: 'Youtube UI using Flutter',
    thumbnailUrl:
        'https://ui4free.com/storage/public/images/figma-youtube-ui-clone-design_1636342529.jpg',
    duration: '10:53',
    timestamp: DateTime(2022, 8, 10),
    viewCount: '200M',
    likes: '200M',
    dislikes: '200M',
  ),
  Video(
    id: 'x606y4QWrxo',
    author: HBO,
    title: 'House of the Dragon | Official Trailer | HBO Max',
    thumbnailUrl: 'https://i.ytimg.com/vi/DotnJ7tTA34/mqdefault.jpg',
    duration: '2:49',
    timestamp: DateTime(2022, 7, 20),
    viewCount: '17M',
    likes: '199K',
    dislikes: '2K',
  ),
  Video(
    author: PNL,
    id: 'vrPk6LB9bjo',
    title: 'PNL - Tahia',
    thumbnailUrl:
        'https://i.ytimg.com/vi/CpXPUMEhDNU/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBQleL4vQ6qGLIc5rzHrXkYlV7RTQ',
    duration: '03:06',
    timestamp: DateTime(2019, 7, 19),
    viewCount: '12M',
    likes: '337K',
    dislikes: '3K',
  ),
];
