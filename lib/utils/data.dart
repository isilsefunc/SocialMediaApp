import 'dart:math';

Random random = Random();
List names = [
  "Ling Waldner",
  "Gricelda Barrera",
  "Lenard Milton",
  "Bryant Marley",
  "Rosalva Sadberry",
  "Guadalupe Ratledge",
  "Brandy Gazda",
  "Kurt Toms",
  "Rosario Gathright",
  "Kim Delph",
  "Stacy Christensen",
];




List notifs = [
  "${names[random.nextInt(10)]} and ${random.nextInt(100)} others liked your post",
  "${names[random.nextInt(10)]} mentioned you in a comment",
  "${names[random.nextInt(10)]} shared your post",
  "${names[random.nextInt(10)]} commented on your post",
  "${names[random.nextInt(10)]} replied to your comment",
  "${names[random.nextInt(10)]} reacted to your comment",
  "${names[random.nextInt(10)]} asked you to join a Group️",
  "${names[random.nextInt(10)]} asked you to like a page",
  "You have memories with ${names[random.nextInt(10)]}",
  "${names[random.nextInt(10)]} Tagged you and ${random.nextInt(100)} others in a post",
  "${names[random.nextInt(10)]} Sent you a friend request",
];

List notifications = List.generate(
    13,
        (index) => {
      "name": names[random.nextInt(10)],
      "dp": "assets/images/friends_${random.nextInt(7)}.jpg",
      "time": "${random.nextInt(50)} min ago",
      "notif": notifs[random.nextInt(10)]
    });

List users = List.generate(
    13,
        (index) => {
       "name": names[random.nextInt(10)],
        "dp": "assets/images/friends_${random.nextInt(7)}.jpg",
        "posts": "${random.nextInt(1000)}",
        "follower": "${random.nextInt(500)} ",
        "bio": "bio",
        "following": notifs[random.nextInt(100)],
    });

List posts = List.generate(
    13,
        (index) => {
      "name": names[random.nextInt(10)],
      "dp": "assets/images/friends_${random.nextInt(7)}.jpg",
      "time": "${random.nextInt(50)} min ago",
      "img": "assets/images/photo_${random.nextInt(10)}.jpg"
    });






List friends = List.generate(
    13,
        (index) => {
      "name": names[random.nextInt(10)],
      "dp": "assets/images/cm${random.nextInt(10)}.jpg",
      "status": "Anything could be here",
      "isAccept": random.nextBool(),
    });