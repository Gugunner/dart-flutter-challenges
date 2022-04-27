import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter extends RouterDelegate with ChangeNotifier, PopNavigatorRouterDelegateMixin {

  @override
  late final GlobalKey<NavigatorState> navigatorKey;

  late final AppStateManager appStateManager;
  late final GroceryManager groceryManager;
  late final ProfileManager profileManager;
  //ADD Listeners
  AppRouter({
    required this.appStateManager,
    required this.groceryManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    groceryManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  //Dispose Listeners
  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    groceryManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      //Add onPopPage
      onPopPage: _handlePopPage,
      pages: [
        //Add SplashScreen
        if (!appStateManager.isInitialized) SplashScreen.page(),
        //Add LoginScreen
        if (appStateManager.isInitialized && !appStateManager.isLoggedIn) LoginScreen.page(),
        //Add OnboardingScreen
        if (appStateManager.isInitialized && appStateManager.isLoggedIn && !appStateManager.isOnboardingComplete) OnboardingScreen.page(),
        //Add Home
        if(appStateManager.isLoggedIn && appStateManager.isOnboardingComplete) Home.page(appStateManager.getSelectedTab),
        //Create new item
        if (groceryManager.isCreatingNewItem) GroceryItemScreen.page(
          onCreate: (item) {
            groceryManager.addItem(item);
          },
          onUpdate: (_, __) {}
        ),
        //Select GroceryItemScreen
        if (groceryManager.selectedIndex != -1) GroceryItemScreen.page(
            item: groceryManager.selectedGroceryItem,
              index: groceryManager.selectedIndex,
              onCreate: (_) {},
              onUpdate: (item, index) {
                groceryManager.updateItem(item, index);
              }
            ),
        //Add Profile Screen
        if (profileManager.didSelectUser) ProfileScreen.page(profileManager.getUser),
        //Add WebView Screen
        if (profileManager.didTapOnRaywenderlich) WebViewScreen.page(),
      ],
    );
  }

  //Add _handlePopPage
  bool _handlePopPage(
    Route<dynamic> route,
    result
  ) {
    if (!route.didPop(result)) {
      return false;
    }

    //Handle Onboarding and splash
    if (route.settings.name == FooderlichPages.onboardingPath) {
      appStateManager.logout();
    }
    //Handle state when user closes grocery item screen
    if (route.settings.name == FooderlichPages.groceryItemDetails) {
      groceryManager.groceryItemTapped(-1);
    }
    //Handle state when user closes profile screen
    if (route.settings.name == FooderlichPages.profilePath) {
      profileManager.tapOnProfile(false);
    }
    //Handle state when user closes WebView screen
    if (route.settings.name == FooderlichPages.raywenderlich) {
      profileManager.tapOnRaywenderlich(false);
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;

}