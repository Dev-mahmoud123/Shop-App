import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/models/auth/auth_model.dart';
import 'package:shopping/models/faqs/faqs_model.dart';
import 'package:shopping/provider/connectivity_provirder.dart';
import 'package:shopping/provider/counter_provider.dart';
import 'package:shopping/provider/password%20_visibility_provider.dart';
import 'package:shopping/provider/order_screen_provider.dart';
import 'package:shopping/provider/theme_provider.dart';
import 'package:shopping/services/remote/address/get_address_service.dart';
import 'package:shopping/services/remote/address/post_address_service.dart';
import 'package:shopping/services/remote/cart/get_cart_service.dart';
import 'package:shopping/services/remote/cart/post_cart_service.dart';
import 'package:shopping/services/remote/complaints/comaplaints_service.dart';
import 'package:shopping/services/remote/contacts/contacts_service.dart';
import 'package:shopping/services/remote/faqs/faqs_service.dart';
import 'package:shopping/services/remote/favorite/get_favorite_service.dart';
import 'package:shopping/services/remote/favorite/post_ favorite_service.dart';
import 'package:shopping/services/remote/home/home_service.dart';
import 'package:shopping/services/remote/auth/user_service.dart';
import 'package:shopping/services/remote/notification/notification_service.dart';
import 'package:shopping/services/remote/product/produc_details_service.dart';
import 'package:shopping/services/remote/search/search_service.dart';
import 'package:shopping/services/remote/user/change_password_service.dart';
import 'package:shopping/services/remote/user/get_profile_service.dart';
import 'package:shopping/services/remote/user/update_profile_service.dart';
import 'package:shopping/viewModels/address_view_model/get_addresst_view_model.dart';
import 'package:shopping/viewModels/address_view_model/post_address_view_model.dart';
import 'package:shopping/viewModels/cart_view_model/get_cart_view_model.dart';
import 'package:shopping/viewModels/cart_view_model/post_cart_view_model.dart';
import 'package:shopping/viewModels/complaints_view_model/complaints_view_model.dart';
import 'package:shopping/viewModels/contacts_view_model/contacts_view_model.dart';
import 'package:shopping/viewModels/faqs_view_model/faqs_view_model.dart';
import 'package:shopping/viewModels/favorite_view_model/favorite_view_model.dart';
import 'package:shopping/viewModels/notification_view_model/notification_view_model.dart';
import 'package:shopping/viewModels/product_view_model/category_product_view_model.dart';
import 'package:shopping/viewModels/category_view_model/category_view_model.dart';
import 'package:shopping/viewModels/favorite_view_model/get_fav_view_model.dart';
import 'package:shopping/viewModels/product_view_model/product_details_view_model.dart';
import 'package:shopping/viewModels/search_view_model/search_view_model.dart';
import 'package:shopping/viewModels/setting_view_model/setting_view_mode.dart';
import 'package:shopping/viewModels/user_View_model/change_password_view_model.dart';
import 'package:shopping/viewModels/user_View_model/register_view_model.dart';
import 'package:shopping/viewModels/user_View_model/update_profile_view_model.dart';

// User Provider
final userAuth = ChangeNotifierProvider<UserHelper>((ref) => UserHelper());

/// Loading provider
final loadingStateProvider = StateProvider<bool>((_) => false);

// Radio button provider
final radioButtonProvider =
    ChangeNotifierProvider<OrderScreenProvider>((ref) => OrderScreenProvider());

// Switch Value Provider
final switchValueProvider =
    ChangeNotifierProvider<OrderScreenProvider>((ref) => OrderScreenProvider());

/// Connection Provider
final connectionProvider = ChangeNotifierProvider<ConnectivityProvider>(
    (ref) => ConnectivityProvider());

// register provider
final registerHelper =
    ChangeNotifierProvider<RegisterViewModel>((ref) => RegisterViewModel());

// password visibility provider
final passwordVisibility =
    ChangeNotifierProvider<PasswordProvider>((ref) => PasswordProvider());

// home data provider
final homeData = ChangeNotifierProvider<HomeHelper>((ref) => HomeHelper());

// product by category provider
final categoryProduct = ChangeNotifierProvider<CategoryProductsViewModel>(
    (ref) => CategoryProductsViewModel());

// banner provider
final bannerHelper = ChangeNotifierProvider<HomeHelper>((ref) => HomeHelper());

// category provider
final categoryHelper =
    ChangeNotifierProvider<CategoryViewModel>((ref) => CategoryViewModel());

// post favorites provider
final postFavServiceProvider =
    Provider<PostFavProductService>((ref) => PostFavProductService());
final postFavViewModelProvider = ChangeNotifierProvider<FavoriteViewModel>(
    (ref) => FavoriteViewModel(ref.read));

// product details provider
final productDetailsProvider =
    Provider<ProductDetailsService>((ref) => ProductDetailsService());
final productDetailsViewModelProvider =
    ChangeNotifierProvider<ProductDetailsViewModel>(
        (ref) => ProductDetailsViewModel(ref.read));

//  get favorite data provider
final favouriteServiceProvider =
    Provider<GetFavProductService>((ref) => GetFavProductService());
final favouriteViewModelProvider =
    ChangeNotifierProvider<GetFavViewModel>((ref) => GetFavViewModel(ref.read));

// counter provider
final counter = ChangeNotifierProvider<Counter>((ref) => Counter());

// settings provider
final settingHelper =
    ChangeNotifierProvider<SettingViewModel>((ref) => SettingViewModel());

// get cart data provider
final cartServiceProvider = Provider<GetCartService>((ref) => GetCartService());
final cartViewModelProvider = ChangeNotifierProvider<GetCartViewModel>(
    (ref) => GetCartViewModel(ref.read));

// post cart provider
final postCartServiceProvider =
    Provider<PostCartService>((ref) => PostCartService());
final postCartViewModel = ChangeNotifierProvider<PostCartViewModel>(
    (ref) => PostCartViewModel(ref.read));

// profile provider
final profileHelper =
    ChangeNotifierProvider<GetProfileService>((ref) => GetProfileService());
final updateProfileServiceProvider =
    Provider<UpdateUserProfile>((ref) => UpdateUserProfile());
final updateProfileViewModel = ChangeNotifierProvider<UpdateProfileViewModel>(
    (ref) => UpdateProfileViewModel(ref.read));

// notification provider
final notificationServiceProvider =
    Provider<NotificationService>((ref) => NotificationService());
final notificationViewModel =
    Provider<NotificationViewModel>((ref) => NotificationViewModel(ref.read));

// Search Provider
final searchProvider = Provider<SearchService>((ref) => SearchService());
final searchViewModelProvider =
    ChangeNotifierProvider<SearchViewModel>((ref) => SearchViewModel(ref.read));

// theme provider
final theme = ChangeNotifierProvider<ThemeProvider>((ref) => ThemeProvider());

// change password provider
final changePassProvider =
    Provider<ChangePasswordService>((ref) => ChangePasswordService());
final changePassViewModelProvider =
    ChangeNotifierProvider<ChangePasswordViewModel>(
        (ref) => ChangePasswordViewModel(ref.read));

//  Contacts provider
final contactProvider = Provider<ContactService>((ref) => ContactService());
final contactViewModelProvider = ChangeNotifierProvider<ContactsViewModel>(
    (ref) => ContactsViewModel(ref.read));

// FAQs Provider
final faqsProvider = Provider<FAQsService>((ref) => FAQsService());
final faqsViewModelProvider =
    ChangeNotifierProvider<FAQsViewModel>((ref) => FAQsViewModel(ref.read));

// Complaints Provider
final complaintsProvider =
    Provider<ComplaintsService>((ref) => ComplaintsService());
final complaintsViewModelProvider = ChangeNotifierProvider<ComplaintsViewModel>(
    (ref) => ComplaintsViewModel(ref.read));

// get Address data provider
final addressServiceProvider =
    Provider<GetAddressService>((ref) => GetAddressService());
final addressViewModelProvider = ChangeNotifierProvider<GetAddressViewModel>(
    (ref) => GetAddressViewModel(ref.read));

// post Address provider
final postAddressServiceProvider =
    Provider<PostAddressService>((ref) => PostAddressService());
final postAddressViewModel = ChangeNotifierProvider<PostAddressViewModel>(
    (ref) => PostAddressViewModel(ref.read));
