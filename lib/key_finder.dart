import 'package:flutter_driver/flutter_driver.dart';

SerializableFinder appBar = find.byValueKey('APP_BAR');
SerializableFinder appBarTitle = find.byValueKey('APP_BAR_TITLE');
SerializableFinder appBarDetailTitle = find.byValueKey('APP_BAR_FOOD_DETAIL');
SerializableFinder foodScreen = find.byValueKey('FOOD_SCREEN');

SerializableFinder detailBackButton = find.byValueKey('DETAIL_BACK_BUTTON');
SerializableFinder favoriteButton = find.byValueKey('FAVORITE_BUTTON');

SerializableFinder bottomNavbarFoodPageFinder =
    find.byValueKey('BOTTOM_NAVBAR_FOODPAGE');
SerializableFinder bottomNavbarFoodPageDessertFinder =
    find.byValueKey('BOTTOM_NAVBAR_FOODPAGE_DESSERT');
SerializableFinder bottomNavbarFoodPageSeafoodFinder =
    find.byValueKey('BOTTOM_NAVBAR_FOODPAGE_SEAFOOD');
SerializableFinder bottomNavbarFoodPageFavoriteFinder =
    find.byValueKey('BOTTOM_NAVBAR_FOODPAGE_FAVORITE');

SerializableFinder scaffoldDessertPage = find.byValueKey('DESSERT_SCAFFOLD');
SerializableFinder scaffoldSeafoodPage = find.byValueKey('SEAFOOD_SCAFFOLD');

SerializableFinder fabDessertPage = find.byValueKey('FAB_DESSERT_PAGE');
SerializableFinder fabSeafoodPage = find.byValueKey('FAB_SEAFOOD_PAGE');

SerializableFinder gridViewDessertPage =
    find.byValueKey('GRID_VIEW_DESSERT_PAGE');
SerializableFinder gridViewSeafoodPage =
    find.byValueKey('GRID_VIEW_SEAFOOD_PAGE');

SerializableFinder cardDessertPage0 = find.byValueKey('CARD_DESSERT_PAGE_0');
SerializableFinder cardSeafoodPage0 = find.byValueKey('CARD_SEAFOOD_PAGE_0');

SerializableFinder cardImageDessertPage0 =
    find.byValueKey('CARD_IMAGE_DESSERT_PAGE_0');
SerializableFinder cardImageSeafoodPage0 =
    find.byValueKey('CARD_IMAGE_SEAFOOD_PAGE_0');

SerializableFinder cardTextDessertPage0 =
    find.byValueKey('CARD_TEXT_DESSERT_PAGE_0');
SerializableFinder cardTextSeafoodPage0 =
    find.byValueKey('CARD_TEXT_SEAFOOD_PAGE_0');

SerializableFinder scaffoldFoodDetail = find.byValueKey('FOOD_DETAIL_SCAFFOLD');
SerializableFinder imageFoodDetail = find.byValueKey('IMAGE_FOOD_DETAIL');
SerializableFinder textFoodDetail = find.byValueKey('FOOD_DETAIL_TEXT');

SerializableFinder scaffoldFavorite = find.byValueKey('FAVORITE_SCAFFOLD');
SerializableFinder favoriteTabbar = find.byValueKey('FAVORITE_PAGE_TABBAR');
SerializableFinder favoriteDessertTab =
    find.byValueKey('FAVORITE_PAGE_DESSERT_TAB');
SerializableFinder favoriteSeafoodTab =
    find.byValueKey('FAVORITE_PAGE_SEAFOOD_TAB');

SerializableFinder favoriteTabbarView =
    find.byValueKey('FAVORITE_PAGE_TABBAR_VIEW');
SerializableFinder favoriteFutureBuilder =
    find.byValueKey('FAVORITE_FUTURE_BUILDER');

SerializableFinder favoriteGridView = find.byValueKey('FAVORITE_GRID_VIEW');
SerializableFinder favoriteCard0 = find.byValueKey('CARD_FAVORITE_0');
SerializableFinder favoriteCardText0 = find.byValueKey('FAVORITE_CARD_TEXT_0');
