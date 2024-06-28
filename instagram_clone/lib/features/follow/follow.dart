import 'package:flutter/material.dart';
import 'package:instagram_clone/features/follow/followers/followers.dart';
import 'package:instagram_clone/features/follow/following/following.dart';
import 'package:instagram_clone/features/follow/subscriptions/subscription.dart';

class Follow extends StatelessWidget {
  const Follow({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black87,
          title: const Text(
            'ajaz',
            style: TextStyle(color: Colors.white),
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            dividerColor: Colors.grey,
            tabs: [
              Text('Followers'),
              Text('Following'),
              Text('Subscriptions'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Followers(),
            Followings(),
            Subscriptions(),
          ],
        ),
      ),
    );
  }
}
