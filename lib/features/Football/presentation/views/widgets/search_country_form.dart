// import 'package:arapface1/features/Football/presentation/cubits/get_counteries_cubit/get_counteries_cubit.dart';
// import 'package:arapface1/features/Football/presentation/views/widgets/search_country_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SearchCountryForm extends StatefulWidget {
//   const SearchCountryForm({
//     super.key,
//   });

//   @override
//   State<SearchCountryForm> createState() => _SearchCountryFormState();
// }

// class _SearchCountryFormState extends State<SearchCountryForm> {
//   TextEditingController searchController = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey();
//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
//   @override
//   void dispose() {
   
//     searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: CustomTextFormFieldForSeachCountery(
//         autovalidateMode: autovalidateMode,
//         controller: searchController,
//         onSubmitted: (p0) {
//           if (formKey.currentState!.validate()) {
//             BlocProvider.of<GetCounteriesCubit>(context)
//                 .getCounteries(queryParams: {
//               'search': p0,
//             });
//           } else {
//             autovalidateMode = AutovalidateMode.always;
//             setState(() {});
//             BlocProvider.of<GetCounteriesCubit>(context).getCounteries();
//           }
//         },
//       ),
//     );
//   }
// }
