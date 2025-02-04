
// import 'package:arapface1/features/Football/domain/entities/countery_entity.dart';
// import 'package:arapface1/features/Football/presentation/views/widgets/countery_widget.dart';
// import 'package:flutter/material.dart';

// class CounteriesGridView extends StatelessWidget {
//   const CounteriesGridView({
//     super.key,
//     required this.counteries,
//   });
//   final List<CounteryEntity> counteries;
//   @override
//   Widget build(BuildContext context) {
//     return SliverGrid(
//       delegate: SliverChildBuilderDelegate(
//         (context, index) => CounteryWidget(counteryEntity: counteries[index]),
//         childCount: counteries.length, // عدد العناصر
//       ),
//       gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2, // عدد الأعمدة
//         crossAxisSpacing: 20,
//         mainAxisSpacing: 15,
//         childAspectRatio: 1,
//       ),
//     );
//   }
// }
