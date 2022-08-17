import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tutorial_app/feature/model/travel.model.dart';
import 'package:tutorial_app/feature/product/constant/enum.dart';

part 'travel_cubit_dart_state.dart';

class TravelCubitDartCubit extends Cubit<TravelCubitDartState> {
  TravelCubitDartCubit() : super(TravelCubitDartInitial());
   List<TravelModel> allItems=[];
  Future<void> fetcItems() async {
    allItems=TravelModel.mockItems;
   await Future.delayed(const Duration(seconds: 1));
   emit(TravelItemsLoaded(allItems));
  }
  void searchByItems(String data){
    final result=allItems.where((element) => element.title.contains(data)).toList();
       emit(TravelItemsLoaded(result));

  }
  void seeAllItems(){
    
      emit(TravelItemsSeeAll([
        ImageEnums.camp_alt.toPath,
        ImageEnums.camp_alt2.toPath,

      ]
      ));
  }

}
class TravelItemsLoaded extends TravelCubitDartState {
  final List<TravelModel> items;

  TravelItemsLoaded(this.items);
}
class TravelItemsSeeAll extends TravelCubitDartState {
  final List<String> images;

  TravelItemsSeeAll(this.images);

  
}