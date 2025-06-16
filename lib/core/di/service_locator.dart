import 'package:get_it/get_it.dart';

// Auth Feature
import '../../features/auth/data/datasources/auth_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/presentation/bloc/auth_cubit.dart';

/// Instancia global del ServiceLocator para inyección de dependencias
final sl = GetIt.instance;

/// Inicializa todos los servicios, repositorios y casos de uso necesarios para la aplicación
/// 
/// Esta función debe ser llamada al inicio de la aplicación (en main.dart)
/// antes de que se renderice cualquier widget
Future<void> initServiceLocator() async {
  // ===== Feature: Core =====
  _registerCoreServices();
  
  // ===== Feature: Auth =====
  _registerAuthServices();
  
  // ===== Feature: Home =====
  _registerHomeServices();
  
  // ===== Feature: Profile =====
  _registerProfileServices();
  
  // Inicialización asíncrona (si es necesaria)
  await _initAsyncServices();
}

/// Registra servicios del core compartidos en toda la app
void _registerCoreServices() {
  // Servicios de almacenamiento local
  // Inicialmente todos serán implementaciones mock
  // sl.registerSingleton<LocalStorageService>(MockLocalStorageService());
  
  // Servicios de navegación
  // sl.registerSingleton<NavigationService>(NavigationServiceImpl());
  
  // Servicios de conexión a redes
  // sl.registerSingleton<NetworkService>(MockNetworkService());
}

/// Registra servicios relacionados con autenticación
void _registerAuthServices() {
  // DATASOURCES - Mock implementations for now
  sl.registerLazySingleton<AuthDataSource>(() => MockAuthDataSource());
  
  // REPOSITORIES
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(dataSource: sl<AuthDataSource>()),
  );
  
  // USECASES
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => RegisterUseCase(sl<AuthRepository>()));
  
  // CUBITS
  sl.registerFactory(() => AuthCubit(
    loginUseCase: sl<LoginUseCase>(),
    registerUseCase: sl<RegisterUseCase>(),
  ));
}

/// Registra servicios relacionados con la home page
void _registerHomeServices() {
  // DATASOURCES
  // sl.registerLazySingleton<HomeDataSource>(() => MockHomeDataSource());
  
  // REPOSITORIES
  // sl.registerLazySingleton<HomeRepository>(
  //   () => HomeRepositoryImpl(dataSource: sl<HomeDataSource>()),
  // );
  
  // USECASES
  // sl.registerLazySingleton(() => GetTrendingBarbersUseCase(sl<HomeRepository>()));
  
  // BLOCS
  // sl.registerFactory(() => HomeBloc(
  //   getTrendingBarbersUseCase: sl<GetTrendingBarbersUseCase>(),
  // ));
}

/// Registra servicios relacionados con el perfil de usuario
void _registerProfileServices() {
  // Similar structure as other features
  // Will be implemented when we start working on this feature
}

/// Inicialización de servicios asíncronos
Future<void> _initAsyncServices() async {
  // Inicializar servicios que requieran operaciones asíncronas
  // Por ejemplo, inicialización de base de datos local, carga de preferencias, etc.
}
