import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'adminbirthcertificatebloc_event.dart';
part 'adminbirthcertificatebloc_state.dart';

class AdminBirthCertificateBlocBloc extends Bloc<AdminBirthCertificateBlocEvent,
    AdminBirthCertificateBlocState> {
  AdminBirthCertificateBlocBloc() : super(AdminBirthCertificateBlocInitial()) {
    on<AdminBirthCertificateBlocEvent>((  event, emit) {
      // TODO: implement event handler
    });
  }
}
