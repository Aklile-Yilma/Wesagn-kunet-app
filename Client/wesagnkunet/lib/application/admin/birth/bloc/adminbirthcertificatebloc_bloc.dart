import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wesagnkunet/infrastructure/core/repositories.dart';

import '../../../../domain/core/marriage_certificate.dart';

part 'adminbirthcertificatebloc_event.dart';
part 'adminbirthcertificatebloc_state.dart';

class AdminBirthCertificateBlocBloc extends Bloc<AdminBirthCertificateBlocEvent,
    AdminBirthCertificateBlocState> {
  MarriageCertificateRepository repository;
  AdminBirthCertificateBlocBloc(this.repository)
      : super(AdminBirthCertificateBlocInitial()) {
    on<FetchBirthCertificatesEvent>(
        (FetchBirthCertificatesEvent event, Emitter emitter) async {
      emitter.call(FetchingBirthCertificatesState());

      try {
        List<MarriageCertificate> marriageCertificates =
            await (await repository).getAll();
        emitter.call(FetchedBirthCertificatesState(
            marriageCertificates: marriageCertificates));
      } catch (error) {
        emitter.call(
            FetchBirthCertificatesErrorsState(exception: error as Exception));
      }
    });

    on<GetSingleBirthCertificateEvent>(
        (GetSingleBirthCertificateEvent event, Emitter emitter) async {
      MarriageCertificate marriageCertificate;

      try {
        marriageCertificate =
            await (await repository).getById(event.certificateId);
        emitter.call(LoadedBirthCertificateState(marriageCertificate));
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

        emitter.call(ApprovedBirthCertificteState(
            marriageCertificate: uprovedcertificate));
      } catch (error) {
        emitter.call(ApprovalError(error as Error));
      }
    });

    on<RejectBirthCertificateEvent>(
        (RejectBirthCertificateEvent event, Emitter emitter) async {
      try {
        final rejectedMarriageCertificate =
            await (await repository).verify(event.certificateId);
        emitter
            .call(RejectedBirthCertificateState(rejectedMarriageCertificate));
      } catch (error) {
        emitter.call(RejectionError(error as Error));
      }
    });

    on<UpdateBirthCertificateEvent>(
        (UpdateBirthCertificateEvent event, Emitter emitter) async {
      try {
        final updatedMarriageCertificate =
            await (await repository).verify(event.certificateId);
        emitter.call(UpdatedBirthCertificateState(
            marriageCertificate: updatedMarriageCertificate));
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

  // Future<MarriageCertificateRepository> get repository async {
  //   return await CoreInfrastractureProvider
  //       .provideMarriageCertificateRepository();
  // }
}
