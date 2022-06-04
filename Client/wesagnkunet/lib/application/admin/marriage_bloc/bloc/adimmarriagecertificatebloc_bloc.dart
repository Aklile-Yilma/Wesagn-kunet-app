import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/core/providers.dart';
import 'package:wesagnkunet/infrastructure/core/repositories.dart';
part 'adimmarriagecertificatebloc_event.dart';
part 'adimmarriagecertificatebloc_state.dart';

class AdminMarriageCertificateBloc extends Bloc<
    AdminMarriageCertificateBlocEvent, AdminMarriageCertificateBlocState> {
  AdminMarriageCertificateBloc() : super(AdimMarriageCertificateBlocInit()) {
  

    on<FetchMarriageCertificatesEvent>(
        (FetchMarriageCertificatesEvent event, Emitter emitter) async {
      emitter.call(FetchingMarriageCertificatesState());

      try {
        //TODO fetching
        List<MarriageCertificate> marriageCertificates =
            await (await repository).getAll();
        emitter.call(FetchedMarriageCertificatesState(
            marriageCertificates: marriageCertificates));
      } catch (error) {
        emitter.call(FetchMarriageCertificatesErrorsState(
            exception: error as Exception));
      }
    });

    on<GetSingleMarriageCertificateEvent>(
        (GetSingleMarriageCertificateEvent event, Emitter emitter) async {
      MarriageCertificate marriageCertificate;

      try {
        // marriageCertificate =
        // await (await repository).get(); //TODO the get method
        // emitter.call(LoadedMarriageCertificateState(marriageCertificate));
      } catch (error) {
        emitter.call(
            LoadMarriageCertificateErrorState(exception: error as Exception));
      }
    });

    on<ApproveMarriageCertificateEvent>(
        (ApproveMarriageCertificateEvent event, Emitter emitter) async {
      try {
        //  final uprovedcertificate=await MarriageCertificateRepository.update(event.marriageCertificate, event.status)

        // emitter.call(ApprovedMarriageCertificteState(
        //     marriageCertificate: uprovedcertificate));
      } catch (error) {
        emitter.call(ApprovalError(error as Error));
      }
    });
    on<RejectMarriageCertificateEvent>(
        (RejectMarriageCertificateEvent event, Emitter emitter) async {
      try {
        emitter.call(RejectedMarriageCertificateState(event.marriageCertificate));
      } catch (error) {
        emitter.call(RejectionError(error as Error));
      }
    });

    on<UpdateMarriageCertificateEvent>(
        (UpdateMarriageCertificateEvent event, Emitter emit) async {
      try {
        // final updatedMarriageCertificate=await MarriageCertificateRepository.update(event.marriageCertificate, event.issuedTime, event.status);
      } catch (error) {
        emit.call(UpdateError(error as Error));
      }
    });

    on<DeleteMarriageCertificateEvent>(
        (DeleteMarriageCertificateEvent event, Emitter emitter) async {
      try {
        // final marriageCertificate =
        //     await MarriageCertificateRepository.delete(event.marriageCertificate);

        emitter.call(DeletedMarriageCertificateState());
      } catch (error) {
        emitter.call(DeletionError(exception: error as Exception));
      }
    });
  }

  Future<MarriageCertificateRepository> get repository async {
    return await CoreInfrastractureProvider
        .provideMarriageCertificateRepository();
  }

 

  

  

 

  
}
