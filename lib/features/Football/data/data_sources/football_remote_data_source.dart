// import 'package:arapface1/core/api_services.dart';
// import 'package:arapface1/features/Football/domain/entities/countery_entity.dart';

// abstract class FootballRemoteDataSource {
//   Future<List<CounteryEntity>> getCounteries({Map<String, dynamic>? queryParams,});
// }

// class FootballRemoteDataSourceImple extends FootballRemoteDataSource {
//   final ApiServices apiServices;

//   FootballRemoteDataSourceImple({required this.apiServices});
//   @override
//   Future<List<CounteryEntity>> getCounteries({Map<String, dynamic>? queryParams,}) async {
//     Map<String, dynamic> jsonData = await apiServices.get(
//       endPoint: 'countries',
//       queryParams: queryParams
//     );
//     List<CounteryEntity> counteries = [];
//     for (var element in jsonData["response"]) {
//       counteries.add(CounteryEntity(
//           counteryName: element["name"],
//           counteryCode: element["code"],
//           counteryflag: element["flag"]));
//     }
    
//     return counteries;
//   }
// }
