import 'package:bloc/bloc.dart';
import 'package:jad/controller/api_controller.dart';
import 'package:jad/model/product_item.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());
  void fetch() async {
    emit(DetailsLoading());
    final details = await ApiController.getProduct();
    emit(DetailsSuccessed(
        details: details,
        
        ));
  }
}
