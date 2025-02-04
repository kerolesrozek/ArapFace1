// import 'package:arapface1/features/Football/presentation/cubits/get_counteries_cubit/get_counteries_cubit.dart';
// import 'package:arapface1/features/Football/presentation/views/widgets/counteries_gridview.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CounteriesGridViewBuilder extends StatefulWidget {
//   const CounteriesGridViewBuilder({
//     super.key,
//   });

//   @override
//   State<CounteriesGridViewBuilder> createState() =>
//       _CounteriesGridViewBuilderState();
// }

// class _CounteriesGridViewBuilderState extends State<CounteriesGridViewBuilder> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<GetCounteriesCubit>(context).getCounteries();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetCounteriesCubit, GetCounteriesState>(
//       builder: (context, state) {
//         if (state is GetCounteriesSuccess) {
//           return CounteriesGridView(
//             counteries: state.counteries,
//           );
//         } else if (state is GetCounteriesFailure) {
          
//           return SliverToBoxAdapter(child: Text(state.errorMessage));
//         } else {
//           return const SliverToBoxAdapter(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }
