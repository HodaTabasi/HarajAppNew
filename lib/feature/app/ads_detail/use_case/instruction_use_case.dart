import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/instruction/instruction_model.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';

class InstructionUseCase {
  AdsRepository repository;

  InstructionUseCase({required this.repository});

  Future<Either<Failure, InstructionModel>> call() async {
    return await repository.getInstruction();
  }
}
