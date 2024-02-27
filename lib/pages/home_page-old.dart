// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:movies_tmdb/repository/now_play_http_repository.dart';

// final NowPlayHttpRepository nowPlayHttpRepository = NowPlayHttpRepository();

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Movies"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Container(
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextButton(
//               onPressed: () {
//                 Get.toNamed('/http');
//               },
//               child: const Text(
//                 'HTTP',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 22,
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: const Text(
//                 'DIO',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 22,
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: const Text(
//                 'GET',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 22,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
