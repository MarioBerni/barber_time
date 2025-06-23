import 'package:get_it/get_it.dart';

// Home Feature
import '../../features/home/data/datasources/home_mock_datasource.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/get_home_data_usecase.dart';
import '../../features/home/presentation/bloc/home_cubit.dart';

/// Instancia global del ServiceLocator para inyección de dependencias
final sl = GetIt.instance;

/// Inicializa todos los servicios, repositorios y casos de uso necesarios para la aplicación
/// 
/// Esta función debe ser llamada al inicio de la aplicación (en main.dart)
/// antes de que se renderice cualquier widget
Future<void> initServiceLocator() async {
  // ===== Feature: Core =====
  _registerCoreServices();
  
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

// Servicios de autenticación eliminados temporalmente

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
  // Similar structure as other features
  // Will be implemented when we start working on this feature
}

/// Inicialización de servicios asíncronos
Future<void> _initAsyncServices() async {
  // Inicializar servicios que requieran operaciones asíncronas
  // Por ejemplo, inicialización de base de datos local, carga de preferencias, etc.
}
