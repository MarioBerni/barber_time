import 'package:get_it/get_it.dart';

// Auth Feature
import '../../features/auth/data/datasources/auth_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/presentation/bloc/auth_cubit.dart';

// Home Feature
import '../../features/home/data/datasources/home_mock_datasource.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/get_home_data_usecase.dart';
import '../../features/home/presentation/bloc/home_cubit.dart';

// Profile Feature
import '../../features/profile/presentation/bloc/profile_cubit.dart';

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
  sl.registerLazySingleton(() => HomeMockDatasource());
  
  // REPOSITORIES
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(sl()),
  );
  
  // USECASES
  sl.registerLazySingleton(() => GetHomeDataUsecase(sl()));
  
  // CUBITS
  sl.registerFactory(() => HomeCubit(sl()));
}

/// Registra servicios relacionados con el perfil de usuario
void _registerProfileServices() {
  // Registramos el Cubit para el perfil
  // Actualmente utiliza datos mock dentro del mismo Cubit
  sl.registerFactory(() => ProfileCubit());
  
  // En futuras implementaciones, aquí se registrarían:
  // - Repositorios de perfil
  // - Fuentes de datos
  // - Casos de uso
}

/// Inicialización de servicios asíncronos
Future<void> _initAsyncServices() async {
  // Inicializar servicios que requieran operaciones asíncronas
  // Por ejemplo, inicialización de base de datos local, carga de preferencias, etc.
}
