import 'package:discover_ethiopia/controllers/auth/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthState {
  late bool isLoading;
  late User? user;
  late String? error;

  AuthState({this.isLoading = false, this.user, this.error});

  AuthState copyWith({bool? isLoading, User? user, String? error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}

final authController = AuthController();

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier({User? user}) : super(AuthState(user: user));

  void login() async {
    state = state.copyWith(isLoading: true);
    try {
      await authController.signInWithGoogle();
      state = state.copyWith(isLoading: false, user: authController.user);
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  void logout() async {
    authController.signOut();
    state = state.copyWith(isLoading: false, user: null, error: null);
  }
}

final userChangeProvider = StreamProvider((ref) => authController.userChanged);
final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  var user = ref.watch(userChangeProvider);
  return user.when(
    data: (data) => AuthStateNotifier(user: data),
    error: (error, stacktrace) => AuthStateNotifier(),
    loading: () => AuthStateNotifier(),
  );
});
