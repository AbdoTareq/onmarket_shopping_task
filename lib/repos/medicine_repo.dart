// import 'package:flutter_template/export.dart';
// import 'package:flutter_template/models/medicine.dart';
// import 'package:get/get.dart';

// abstract class MedicineRepository {
//   List<Medicine> getAll();
//   List<Medicine> getAntibiotics();
//   List<Medicine> getAntipyretics();
//   List<Medicine> getInjections();
//   List<Medicine> getMedicineTypeList(MedicineType medicineType);
// }

// class MedicineManager implements MedicineRepository {
//   MedicineManager._privateConstructor();

//   static final MedicineManager _instance = MedicineManager._privateConstructor();

//   factory MedicineManager() {
//     return _instance;
//   }

//   @override
//   List<Medicine> getAll() => [
//         ...getAntibiotics(),
//         ...getAntipyretics(),
//         ...getInjections(),
//       ];

//   @override
//   List<Medicine> getAntibiotics() => [
//         Medicine(
//             dosePerKg: 90,
//             concentration: 228.5,
//             doseNumber: 3,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_amoxicillin228,
//             cautions: ar_amoxicilin_war),
//         Medicine(
//             dosePerKg: 90,
//             concentration: 312,
//             doseNumber: 3,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_amoxicillin312,
//             cautions: ar_amoxicilin_war),
//         Medicine(
//             dosePerKg: 90,
//             concentration: 457,
//             doseNumber: 3,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_amoxicillin457,
//             cautions: ar_amoxicilin_war),
//         Medicine(
//             dosePerKg: 90,
//             concentration: 600,
//             doseNumber: 3,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_amoxicillin600,
//             cautions: ar_amoxicilin_war),
//         //
//         Medicine(
//             dosePerKg: 10,
//             concentration: 100,
//             doseNumber: 1,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_azithromycin100),
//         Medicine(
//             dosePerKg: 10,
//             concentration: 200,
//             doseNumber: 1,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_azithromycin200),
//         //
//         Medicine(
//             dosePerKg: 20,
//             concentration: 125,
//             doseNumber: 2,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_cafaclor125),
//         Medicine(
//             dosePerKg: 20,
//             concentration: 250,
//             doseNumber: 2,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_cafaclor250),
//         //
//         Medicine(
//             dosePerKg: 20,
//             concentration: 125,
//             doseNumber: 2,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_Cafprozil125),
//         Medicine(
//             dosePerKg: 20,
//             concentration: 250,
//             doseNumber: 2,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_Cafprozil250),
//         //
//         Medicine(
//             dosePerKg: 50,
//             concentration: 500,
//             doseNumber: 2,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_Cefadroxill125),
//         Medicine(
//             dosePerKg: 50,
//             concentration: 250,
//             doseNumber: 2,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_Cefadroxill250),
//         Medicine(
//             dosePerKg: 50,
//             concentration: 500,
//             doseNumber: 2,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_Cefadroxill500),
//         //
//         Medicine(
//             dosePerKg: 50,
//             concentration: 125,
//             doseNumber: 3,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_Cefalexin125),
//         Medicine(
//             dosePerKg: 50,
//             concentration: 250,
//             doseNumber: 3,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_Cefalexin125),
//         //
//         Medicine(
//             dosePerKg: 8,
//             concentration: 100,
//             doseNumber: 1,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_Cefiximel100),
//         //
//         Medicine(
//             dosePerKg: 14,
//             concentration: 125,
//             doseNumber: 1,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_Cefdinir125),
//         Medicine(
//             dosePerKg: 14,
//             concentration: 250,
//             doseNumber: 1,
//             medicineType: MedicineType.Antibiotic,
//             name: ar_Cefdinir250),
//       ];

//   @override
//   List<Medicine> getAntipyretics() => [
//         Medicine(
//           dosePerKg: 30,
//           concentration: 100,
//           doseNumber: 3,
//           medicineType: MedicineType.Antipyretic,
//           name: ar_Ibuprofen100,
//           cautions: ar_ibuprofen_war,
//         ),
//         Medicine(
//           dosePerKg: 30,
//           concentration: 250,
//           doseNumber: 3,
//           medicineType: MedicineType.Antipyretic,
//           name: ar_Paracetamol250,
//         ),
//         Medicine(
//           dosePerKg: 3,
//           concentration: 10,
//           doseNumber: 3,
//           medicineType: MedicineType.Antipyretic,
//           name: ar_Declophenac2,
//           cautions: ar_declophanic_war,
//         ),
//       ];

//   @override
//   List<Medicine> getInjections() => [
//         Medicine(
//           dosePerKg: 150,
//           concentration: 0,
//           doseNumber: 2,
//           medicineType: MedicineType.Injection,
//           name: ar_Ampicillin,
//         ),
//         Medicine(
//           dosePerKg: 50,
//           concentration: 0,
//           doseNumber: 1,
//           medicineType: MedicineType.Injection,
//           name: ar_Ceftriaxone,
//         ),
//         Medicine(
//           dosePerKg: 100,
//           concentration: 0,
//           doseNumber: 2,
//           medicineType: MedicineType.Injection,
//           name: ar_Cefotaxime,
//         ),
//         Medicine(
//           dosePerKg: 100,
//           concentration: 0,
//           doseNumber: 2,
//           medicineType: MedicineType.Injection,
//           name: ar_Cefoperazone,
//         ),
//       ];

//   @override
//   List<Medicine> getMedicineTypeList(MedicineType medicineType) =>
//       getAll().where((element) => element.medicineType == medicineType).toList();

//   RxList<Medicine> searchMedicine(String medicineWord) => getAll()
//       .where((medicine) {
//         return medicine.name.tr.toLowerCase().contains(medicineWord.toLowerCase());
//       })
//       .toList()
//       .obs;
// }
