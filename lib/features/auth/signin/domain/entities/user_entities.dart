import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserEntities extends Equatable {
  final String token;

  UserEntities({required this.token});
  
  @override
  // TODO: implement props
  List<Object?> get props => [token];
}
