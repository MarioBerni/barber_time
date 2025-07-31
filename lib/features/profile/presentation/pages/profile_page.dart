import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/routes/route_transitions.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/icons/styled_icon.dart';
import '../../../../core/widgets/navigation/bottom_navigation_bar.dart';
import '../../../../core/widgets/spacers/spacers.dart';
import '../../../home/presentation/widgets/home_header.dart';
import '../bloc/profile_cubit.dart';
import '../bloc/profile_state.dart';
import '../widgets/business_registration_form.dart';
import '../widgets/client_registration_form.dart';
import '../widgets/profile_info_view.dart';
import '../widgets/unauthenticated_view.dart';

/// Página principal del perfil de usuario
///
/// Muestra la información del perfil y permite al usuario
/// gestionar sus datos personales según su tipo (Cliente o Administrador)
class ProfilePage extends StatefulWidget {
  /// Constructor
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // Cargar el perfil al inicializar
    context.read<ProfileCubit>().loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return RouteTransitions.animatedStateSwitcher(
            child: _buildStateWidget(state),
            stateKey: _getStateKey(state),
            transitionType: TransitionType.fade,
            duration: const Duration(milliseconds: 350),
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  /// Obtiene la clave única para el estado actual
  String _getStateKey(ProfileState state) {
    if (state is ProfileInitial) return 'initial';
    if (state is ProfileLoading) return 'loading';
    if (state is ProfileUnauthenticated) return 'unauthenticated';
    if (state is ProfileClientRegistration) return 'client_registration';
    if (state is ProfileBusinessRegistration) return 'business_registration';
    if (state is ProfileLoaded) return 'loaded';
    if (state is ProfileError) return 'error';
    return 'unknown';
  }

  /// Construye el widget correspondiente al estado actual
  Widget _buildStateWidget(ProfileState state) {
    if (state is ProfileInitial || state is ProfileLoading) {
      return _buildLoadingView();
    } else if (state is ProfileUnauthenticated) {
      return const UnauthenticatedView(key: ValueKey('unauthenticated'));
    } else if (state is ProfileClientRegistration) {
      return ClientRegistrationForm(
        key: const ValueKey('client_registration'),
        state: state,
      );
    } else if (state is ProfileBusinessRegistration) {
      return const BusinessRegistrationForm(
        key: ValueKey('business_registration'),
      );
    } else if (state is ProfileLoaded) {
      return _buildProfileView(state);
    } else if (state is ProfileError) {
      return _buildErrorView(state);
    } else {
      return const SizedBox.shrink();
    }
  }

  /// Construye la vista de carga
  Widget _buildLoadingView() {
    return const Center(child: CircularProgressIndicator());
  }

  /// Construye la vista principal del perfil para usuarios autenticados
  Widget _buildProfileView(ProfileLoaded state) {
    return Column(
      children: [
        // Reutilizar el HomeHeader para mantener la coherencia
        // visual en toda la app
        HomeHeader(
          userName: state.profile.name,
          avatarUrl: state.profile.imageUrl,
          showSearchBar: false, // Ocultar barra de búsqueda en perfil
          style: HomeHeaderStyle.gray,
          onUserAvatarPressed: () {
            // Implementar cambio de avatar
          },
          customTopActions: [
            // Botón de editar perfil
            StyledIcon(
              icon: Icons.edit_outlined,
              iconColor: context.deepBlue,
              backgroundColor: Colors.white.withAlpha((0.3 * 255).round()),
              onTap: () {
                // Implementar navegación a edición de perfil
              },
            ),
            AppSpacers.hSm,
            // Botón de configuración
            StyledIcon(
              icon: Icons.settings_outlined,
              iconColor: context.deepBlue,
              backgroundColor: Colors.white.withAlpha((0.3 * 255).round()),
              onTap: () {
                // Implementar navegación a configuraciones
              },
            ),
          ],
        ),

        // Contenido principal del perfil
        Expanded(
          child: SingleChildScrollView(
            child: ProfileInfoView(profile: state.profile),
          ),
        ),
      ],
    );
  }

  /// Construye la vista en caso de error
  Widget _buildErrorView(ProfileError state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          AppSpacers.md,
          Text(
            'Error al cargar el perfil',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            state.message,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          AppSpacers.lg,
          ElevatedButton(
            onPressed: () {
              context.read<ProfileCubit>().loadProfile();
            },
            child: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }

  /// Construye la barra de navegación inferior
  Widget _buildBottomNavigationBar() {
    return AppBottomNavigationBar.main(
      currentIndex: 3, // Índice 3 corresponde a Perfil
      onTap: (index) {
        // Navegar a la página correspondiente según el índice seleccionado
        switch (index) {
          case 0: // Inicio
            context.go(AppRoutes.home);
            break;
          case 1: // Citas
            context.go(AppRoutes.appointments);
            break;
          case 2: // Favoritos
            // Podría ser una ruta específica para favoritos en el futuro
            break;
          case 3: // Perfil
            // Ya estamos en la página de perfil, no es necesario navegar
            break;
        }
      },
    );
  }
}
