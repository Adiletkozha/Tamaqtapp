// Generated by Apple Swift version 2.2 (swiftlang-703.0.18.1 clang-703.0.29)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import MapKit;
@import CoreLocation;
@import GoogleMaps;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;

SWIFT_CLASS("_TtC8AJMapKit11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;
@class NSIndexPath;
@class UITableViewCell;
@class UISegmentedControl;
@class UIImageView;
@class UILabel;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC8AJMapKit8CafeView")
@interface CafeView : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UISegmentedControl * _Null_unspecified SegmentedControl;
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified myTableView;
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull ComplexMenu;
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull Menu;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified FoodPhoto;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified FoodName;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified FoodPrice;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified FoodDescription;
- (void)viewDidLoad;
- (IBAction)SegmentedControlAction:(id _Nonnull)sender;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIImage;
@class UIImagePickerController;
@class UIPickerView;
@class UITextField;

SWIFT_CLASS("_TtC8AJMapKit8Checking")
@interface Checking : UIViewController <CLLocationManagerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified FoodImage;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified FoodName;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified FoodPrice;
@property (nonatomic, weak) IBOutlet UIPickerView * _Null_unspecified FoodType;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified FoodDescription;
@property (nonatomic, strong) UIImage * _Null_unspecified foodsImage;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull pickerDataSource;
@property (nonatomic, copy) NSString * _Nonnull FoodTypeText;
- (void)viewDidLoad;
- (void)imageTapped:(id _Nonnull)img;
- (void)imagePickerControllerDidCancel:(UIImagePickerController * _Nonnull)picker;
- (void)imagePickerController:(UIImagePickerController * _Nonnull)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *, id> * _Nonnull)info;
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView * _Nonnull)pickerView;
- (NSInteger)pickerView:(UIPickerView * _Nonnull)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString * _Null_unspecified)pickerView:(UIPickerView * _Nonnull)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView * _Nonnull)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
- (IBAction)Cancel:(id _Nonnull)sender;
- (IBAction)Done:(id _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8AJMapKit20CompleteRegisterView")
@interface CompleteRegisterView : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
- (void)viewDidLoad;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSArray;
@class NSMutableArray;
@class UIRefreshControl;
@class NSNotification;

SWIFT_CLASS("_TtC8AJMapKit9FoodsView")
@interface FoodsView : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified myTableView;
@property (nonatomic, strong) NSArray * _Null_unspecified foods;
@property (nonatomic, strong) NSMutableArray * _Nonnull dataParse;
@property (nonatomic, strong) UIRefreshControl * _Null_unspecified refreshControl;
- (void)viewDidLoad;
- (void)refreshtable:(NSNotification * _Nonnull)notification;
- (void)loadfoods;
- (void)viewDidAppear:(BOOL)animated;
- (void)tableView:(UITableView * _Null_unspecified)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath * _Null_unspecified)indexPath;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (IBAction)AddFood:(id _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSString;
@class CLLocationManager;
@class GMSMapView;
@class GMSMarker;
@class UIView;
@class CLLocation;

SWIFT_CLASS("_TtC8AJMapKit10GmsMapView")
@interface GmsMapView : UIViewController <CLLocationManagerDelegate, GMSMapViewDelegate>
@property (nonatomic) BOOL seenError;
@property (nonatomic) BOOL locationFixAchieved;
@property (nonatomic, strong) NSString * _Nonnull locationStatus;
@property (nonatomic) NSInteger locationisselected;
@property (nonatomic, strong) CLLocationManager * _Null_unspecified locationManager;
@property (nonatomic, strong) NSArray * _Null_unspecified markerlocations;
- (void)viewDidLoad;
- (void)mapView:(GMSMapView * _Null_unspecified)mapView didTapInfoWindowOfMarker:(GMSMarker * _Null_unspecified)marker;
- (UIView * _Null_unspecified)mapView:(GMSMapView * _Null_unspecified)mapView markerInfoWindow:(GMSMarker * _Null_unspecified)marker;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didUpdateLocations:(NSArray<CLLocation *> * _Nonnull)locations;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class PFGeoPoint;
@class UIButton;

SWIFT_CLASS("_TtC8AJMapKit20RegisterLocationView")
@interface RegisterLocationView : UIViewController <CLLocationManagerDelegate, GMSMapViewDelegate>
@property (nonatomic) BOOL seenError;
@property (nonatomic) BOOL locationFixAchieved;
@property (nonatomic, strong) NSString * _Nonnull locationStatus;
@property (nonatomic) NSInteger locationisselected;
@property (nonatomic, strong) CLLocationManager * _Null_unspecified locationManager;
@property (nonatomic, strong) NSArray * _Null_unspecified markerlocations;
@property (nonatomic, strong) PFGeoPoint * _Null_unspecified myGeoPoint;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified ReadyShow;
- (IBAction)ReadyButton:(id _Nonnull)sender;
- (void)viewDidLoad;
- (void)userAssign;
- (void)mapView:(GMSMapView * _Nonnull)mapView didBeginDraggingMarker:(GMSMarker * _Nonnull)marker;
- (void)mapView:(GMSMapView * _Nonnull)mapView didEndDraggingMarker:(GMSMarker * _Nonnull)marker;
- (void)mapView:(GMSMapView * _Nonnull)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didUpdateLocations:(NSArray<CLLocation *> * _Nonnull)locations;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8AJMapKit12RegisterView")
@interface RegisterView : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified loginText;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified passwordText;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified nameText;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified typeText;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified administratorText;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified phoneText;
@property (nonatomic) NSInteger noerror;
- (void)viewDidLoad;
- (BOOL)shouldPerformSegueWithIdentifier:(NSString * _Null_unspecified)identifier sender:(id _Null_unspecified)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class CLPlacemark;
@class NSError;
@class MKMapView;

SWIFT_CLASS("_TtC8AJMapKit14ViewController")
@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
@property (nonatomic, weak) IBOutlet MKMapView * _Null_unspecified mapView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified myAddressView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified myLocationVIew;
@property (nonatomic, strong) CLLocationManager * _Null_unspecified locationManager;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didUpdateLocations:(NSArray<CLLocation *> * _Nonnull)locations;
- (void)displayLocationInfo:(CLPlacemark * _Nonnull)placemark;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didFailWithError:(NSError * _Nonnull)error;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8AJMapKit6myRoom")
@interface myRoom : UIViewController <CLLocationManagerDelegate>
- (void)viewDidLoad;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
