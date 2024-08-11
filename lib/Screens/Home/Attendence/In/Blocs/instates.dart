import '../Models/inmodel.dart';

abstract class InStates{}

class InInitialState extends InStates{}
class InLoadingState extends InStates{}
class InLoadedState extends InStates{
  InModel inModel;
  InLoadedState({required this.inModel});
}
class InErrorState extends InStates{
  String errormsg;
  InErrorState({required this.errormsg});
}