import 'dart:typed_data';

import 'package:approachable_geek/core/enums/profile_item_type.dart';
import 'package:approachable_geek/core/router/router.dart';
import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/features/profile/domain/entities/profile.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
    required this.user,
  });

  final Profile user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => {
        context.router.push(
          ProfileUpdateRoute(
            profileItemType: ProfileItemType.photo,
            user: user,
          ),
        ),
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: 128,
            width: 128,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: context.colorScheme.primary,
                width: 6,
              ),
              image: DecorationImage(
                image: user.photo != null ? MemoryImage(user.photo ?? Uint8List(0)) : AssetImage('assets/images/user.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 2,
            top: 12,
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.white,
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.black.withAlpha(50),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.edit,
                  color: context.colorScheme.primary,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
