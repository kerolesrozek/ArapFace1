// import 'package:arapface1/features/Football/domain/entities/countery_entity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class CounteryWidget extends StatelessWidget {
//   const CounteryWidget({
//     super.key,
//     required this.counteryEntity,
//   });
//   final CounteryEntity counteryEntity;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: SvgPicture.network(
//             counteryEntity.counteryflag ?? '',
//             fit: BoxFit.cover,
           
//             placeholderBuilder: (context) =>
//                 const CircularProgressIndicator(), // لودينج أثناء التحميل
//           ),
//         ),
//         SizedBox(
//             width: MediaQuery.sizeOf(context).width * 0.50,
//             child: Text(
//               counteryEntity.counteryName ?? 'Countery Name',
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ))
//       ],
//     );
//   }
// }
