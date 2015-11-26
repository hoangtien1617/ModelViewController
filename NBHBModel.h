//
//  NBHBModel.h
//  Nubee House Shop
//
//  Created by Hoàng Tiến on 11/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NBHBModel : NSObject
@property (nonatomic, strong) NSString* bag;
@property (nonatomic, strong) NSString* price;
@property (nonatomic, strong) UIImage* photo;
@property (nonatomic, strong) UIImage* icon;

- (instancetype) init: (NSString*) bag
            withPrice: (NSString*) price
             andPhoto: (NSString*) photo;



@end
