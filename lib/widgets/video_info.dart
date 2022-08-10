import 'package:flutter/material.dart';
import '../data.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoInfo extends StatelessWidget {
  final Video video;

  VideoInfo({required this.video});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '${video.viewCount} views - ${timeago.format(video.timestamp)}',
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 14,
                ),
          ),
          Divider(),
          _ActionsRow(video: video),
          Divider(),
          _AuthorInfo(
            user: video.author,
          ),
        ],
      ),
    );
  }
}

class _ActionsRow extends StatelessWidget {
  final Video video;

  _ActionsRow({required this.video});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildAction(context, Icons.thumb_up_outlined, video.likes),
        _buildAction(context, Icons.thumb_down_outlined, video.dislikes),
        _buildAction(context, Icons.reply_outlined, 'Share'),
        _buildAction(context, Icons.download_outlined, 'Download'),
        _buildAction(context, Icons.library_add_outlined, 'Save'),
      ],
    );
  }

  Widget _buildAction(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          SizedBox(
            height: 6,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}

class _AuthorInfo extends StatelessWidget {
  final User user;

  _AuthorInfo({required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // navigate to the profile.
      },
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(
              user.profileImageUrl,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    user.username,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15,
                        ),
                  ),
                ),
                Flexible(
                  child: Text(
                    '${user.subscribers} subscribers',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'SUBSCRIBE',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.red,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
