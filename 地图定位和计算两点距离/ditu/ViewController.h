//
//  ViewController.h
//  ditu
//
//  Created by 赵宏 on 16/8/24.
//  Copyright © 2016年 赵宏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController <CLLocationManagerDelegate>
 @property (nonatomic, strong,nonnull)CLLocationManager *locationManager;

@end

