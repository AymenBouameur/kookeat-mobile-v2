import 'package:bloc/bloc.dart';

class BottomAppBarCubit extends Cubit<int> {
  BottomAppBarCubit() : super(0);
  int pageIndex = 0;
  void changePageIndex(int index) {
    pageIndex = index;
    emit(index);
  }
}
