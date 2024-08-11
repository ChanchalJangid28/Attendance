import '../OutModel/outmodel.dart';

abstract class OutStates{}

class OutInitialState extends OutStates{}
class OutLoadingState extends OutStates{}
class OutLoadedState extends OutStates{
  OutModel outModel;
  OutLoadedState({required this.outModel});
}
class OutErrorState extends OutStates{
  String errormsg;
  OutErrorState({required this.errormsg});
}