import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SignInLoading());
    var result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold((Failure) => emit(SignInFailure(message: Failure.message)),
        (UserEntity) => emit(SignInSuccess(userEntity: UserEntity)));
  }

  // ------------------- google cubit --------------------- //

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (Failure) => emit(
        SignInFailure(message: Failure.message),
      ),
      (UserEntity) => emit(
        SignInSuccess(userEntity: UserEntity),
      ),
    );
  }

  //------------------- facebook cubit --------------------- //

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold(
      (Failure) => emit(
        SignInFailure(message: Failure.message),
      ),
      (UserEntity) => emit(
        SignInSuccess(userEntity: UserEntity),
      ),
    );
  }

  //------------------- apple cubit --------------------- //

  Future<void> signInWithApple() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithApple();
    result.fold(
      (Failure) => emit(
        SignInFailure(message: Failure.message),
      ),
      (UserEntity) => emit(
        SignInSuccess(userEntity: UserEntity),
      ),
    );
  }

  // ---------------------- sign in with twitter --------------------- //

  Future<void> signInWithTwitter() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithTwitter();
    result.fold(
      (Failure) => emit(
        SignInFailure(message: Failure.message),
      ),
      (UserEntity) => emit(
        SignInSuccess(userEntity: UserEntity),
      ),
    );
  }
}
