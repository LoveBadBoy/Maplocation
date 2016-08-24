//
//  ViewController.m
//  ditu
//
//  Created by 赵宏 on 16/8/24.
//  Copyright © 2016年 赵宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.locationManager = [[CLLocationManager alloc]init];
    
    self.locationManager.delegate = self;
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if ([CLLocationManager locationServicesEnabled]) {
        
        // 启动位置更新
        
        // 开启位置更新需要与服务器进行轮询所以会比较耗电，在不需要时用stopUpdatingLocation方法关闭;
        
        [self.locationManager startUpdatingLocation];
        
        NSLog(@"开启成功");
        
    } else {
        
        NSLog(@"请开启定位功能！");
        
    }
    if ([[[UIDevice currentDevice]systemVersion] doubleValue] >8.0)
        
    {
        
        // 设置定位权限仅iOS8以上有意义,而且iOS8以上必须添加此行代码
        
        [self.locationManager requestWhenInUseAuthorization];//前台定位
        
        // [self.locationManager requestAlwaysAuthorization];//前后台同时定位
        
    }
}
+ (CLLocation *)constructWithCoordinate:(CLLocationCoordinate2D)coordinate {
    return [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations

{
        CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(39.915352,116.397105);
    CLLocation *newLocation = locations[0];
    
    
    CLLocation * oldLocation = [[CLLocation alloc] initWithLatitude:coords.latitude longitude:coords.longitude];
        CGFloat distance = [newLocation distanceFromLocation:oldLocation];
        NSLog(@"distance = %f", distance);
    // 位置反编码
    
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error){
        
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        
        NSLog(@"详细位置%@", placemark.name);// 详细位置
        
        NSLog(@"%@",
             placemark.country);// 国家
        
        NSLog(@"%@",
             placemark.locality);// 市
        
        NSLog(@"%@",
             placemark.subLocality);// 区
        
        
        NSLog(@"%@",
             placemark.thoroughfare);// 街道
        
        
        NSLog(@"%@",
             placemark.subThoroughfare);// 子街道
        
    }];
    
    [manager stopUpdatingLocation];
    
}


// 定位失误时触发

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error

{
    
    NSLog(@"error:%@",error);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
