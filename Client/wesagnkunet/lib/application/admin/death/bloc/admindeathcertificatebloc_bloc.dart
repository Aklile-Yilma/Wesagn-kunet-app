import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admindeathcertificatebloc_event.dart';
part 'admindeathcertificatebloc_state.dart';

class AdmindeathcertificateblocBloc extends Bloc<AdmindeathcertificateblocEvent, AdmindeathcertificateblocState> {
  AdmindeathcertificateblocBloc() : super(AdmindeathcertificateblocInitial()) {
    on<AdmindeathcertificateblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
