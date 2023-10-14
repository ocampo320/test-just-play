

import 'package:kncha_app/feautures/home/domain/models/court.dart';

abstract class HomeEvent  {
   const HomeEvent([List props = const []]) : super();
   

}
class HomeStarted extends HomeEvent {
  
}
class SaveCourtStarted extends HomeEvent {
  final Court court;

  const SaveCourtStarted(this.court);


}
class DeleteStarted extends HomeEvent {
  final Court court;

  const DeleteStarted(this.court);
  
}