//
//  NBHCModel.h
//  Nubee House Shop
//
//  Created by Hoàng Tiến on 11/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NBHCModel : NSObject
@property (nonatomic, strong) NSString* clothes;
@property (nonatomic, strong) NSString* price;
@property (nonatomic, strong) UIImage* photo;
@property (nonatomic, strong) UIImage* icon;

- (instancetype) init: (NSString*) clothes
            withPrice: (NSString*) price
             andPhoto: (NSString*) photo;


@end
