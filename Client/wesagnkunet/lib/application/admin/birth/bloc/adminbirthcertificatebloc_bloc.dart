import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wesagnkunet/domain/core/birth_certificate.dart';
import 'package:wesagnkunet/infrastructure/core/repositories.dart';

import '../../../../domain/core/marriage_certificate.dart';
import '../../../../infrastructure/core/providers.dart';

part 'adminbirthcertificatebloc_event.dart';
part 'adminbirthcertificatebloc_state.dart';

class AdminBirthCertificateBlocBloc extends Bloc<AdminBirthCertificateBlocEvent,
    AdminBirthCertificateBlocState> {
  AdminBirthCertificateBlocBloc() : super(AdminBirthCertificateBlocInitial()) {
    on<FetchBirthCertificatesEvent>(
        (FetchBirthCertificatesEvent event, Emitter emitter) async {
      emitter.call(FetchingBirthCertificatesState());

      try {
        List<BirthCertificate>? birthCertificates =
            await (await repository).getAll();
        emitter.call(FetchedBirthCertificatesState(
            birthCertificates: birthCertificates!));
      } catch (error) {
        emitter.call(
            FetchBirthCertificatesErrorsState(exception: error as Exception));
      }
    });

    on<GetSingleBirthCertificateEvent>(
        (GetSingleBirthCertificateEvent event, Emitter emitter) async {
      BirthCertificate birthCertificate;

      try {
        birthCertificate =
            await (await repository).getById(event.certificateId);
        emitter.call(LoadedBirthCertificateState(birthCertificate));
      } catch (error) {
        emitter.call(
            LoadBirthCertificateErrorState(exception: error as Exception));
      }
    });

    on<ApproveBirthCertificateEvent>(
        (ApproveBirthCertificateEvent event, Emitter emitter) async {
      try {
        final uprovedcertificate =
            await (await repository).verify(event.certificateId);

        emitter.call(
            ApprovedBirthCertificteState(birthCertificate: uprovedcertificate));
      } catch (error) {
        emitter.call(ApprovalError(error as Error));
      }
    });

    on<RejectBirthCertificateEvent>(
        (RejectBirthCertificateEvent event, Emitter emitter) async {
      try {
        final rejectedBirthCertificate =
            await (await repository).verify(event.certificateId);
        emitter.call(RejectedBirthCertificateState(rejectedBirthCertificate));
      } catch (error) {
        emitter.call(RejectionError(error as Error));
      }
    });

    on<UpdateBirthCertificateEvent>(
        (UpdateBirthCertificateEvent event, Emitter emitter) async {
      try {
        final updatedBirthCertificate =
            await (await repository).verify(event.certificateId);
        emitter.call(UpdatedBirthCertificateState(
            birthCertificate: updatedBirthCertificate));
      } catch (error) {
        emitter.call(UpdateError(error as Error));
      }
    });

    on<DeleteBirthCertificateEvent>(
        (DeleteBirthCertificateEvent event, Emitter emitter) async {
      try {
        await (await repository).delete(event.certificateId);

        emitter.call(DeletedBirthCertificateState());
      } catch (error) {
        emitter.call(DeletionError(exception: error as Exception));
      }
    });
  }

  Future<BirthCertificateRepository> get repository async {
    return await CoreInfrastractureProvider.provideBirthCertificateRepository();
  }
}
