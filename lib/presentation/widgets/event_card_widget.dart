import 'package:bitlyca_app/core/colors.dart';
import 'package:bitlyca_app/core/consts.dart';
import 'package:bitlyca_app/data/models/user_model.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Container(
      width: mq.width,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(
        color: lightGray,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.date_range,
                      color: purple,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text("Dinner"),
                ],
              ),
              InkWell(onTap: () {}, child: const Icon(Icons.menu)),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: blue,
                        image: DecorationImage(
                            image: NetworkImage(user.picture.medium))),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${user.name.title} ${user.name.first} ${user.name.last}",
                        style: const TextStyle(fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Text(
                        "3km from you",
                        style: TextStyle(fontSize: 12, color: darkGray),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.chat_rounded,
                      color: purple,
                    ),
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.phone,
                      color: purple,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: mq.width * .4,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: purple,
                        ),
                        SizedBox(width: 8),
                        Text("Date"),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Sun, July 07 2025",
                      style: TextStyle(fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: mq.width * .4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: purple,
                        ),
                        SizedBox(width: 8),
                        Text("Location"),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "${user.location.street.name} ${user.location.city}",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              SizedBox(width: 4),
              Text("07:00 Pm", style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}
