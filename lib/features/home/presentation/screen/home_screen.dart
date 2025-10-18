import 'package:animals/features/home/presentation/screen/widgets/custom_categories_section.dart';
import 'package:animals/features/home/presentation/screen/widgets/home_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';
import '../cubits/breed_cubit.dart';
import '../cubits/breed_status.dart';
import 'widgets/home_products_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<BreedCubit>().fetchBreeds(isInitialLoad: true);
  }

  Future<void> _onRefresh() async {
    await context.read<BreedCubit>().refreshBreeds();
  }

  bool _onScrollNotification(ScrollNotification notification) {
    final cubit = context.read<BreedCubit>();

    if (notification is ScrollUpdateNotification) {
      final maxScroll = notification.metrics.maxScrollExtent;
      final currentScroll = notification.metrics.pixels;

      if (currentScroll >= maxScroll - 200 && !cubit.hasReachedEnd) {
        cubit.fetchBreeds();
      }
    }

    return false;
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: AppColors.tealColor,
        child: NotificationListener<ScrollNotification>(
          onNotification: _onScrollNotification,
          child: CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              HomeSliverAppBar(
                searchController: _searchController,
                onSearchChanged: (query) =>
                    context.read<BreedCubit>().searchBreeds(query),
              ),
              SliverToBoxAdapter(child: CustomCategoriesSection()),
              BlocConsumer<BreedCubit, BreedState>(
                listener: (context, state) {},
                builder: (context, state) {
                  final cubit = context.read<BreedCubit>();
                  final breeds = cubit.breeds;

                  if (state is BreedLoading && breeds.isEmpty) {
                    return SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.tealColor,
                        ),
                      ),
                    );
                  }

                  if (state is BreedError) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'Error: ${state.message}',
                          style: AppTextStyles.style18Medium(
                            context,
                          ).copyWith(color: AppColors.redColor),
                        ),
                      ),
                    );
                  }

                  if (breeds.isEmpty) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'No breeds available',
                          style: AppTextStyles.style18Medium(context),
                        ),
                      ),
                    );
                  }

                  return HomeProductsSection(
                    pets: breeds,
                    isLoading: state is BreedLoading,
                  );
                },
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
