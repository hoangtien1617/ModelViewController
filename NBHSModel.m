//
//  NBHSModel.m
//  Nubee House Shop
//
//  Created by Hoàng Tiến on 11/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "NBHSModel.h"

@implementation NBHSModel
-(instancetype) init: (NSString*) shoes
           withPrice: (NSString*) price
            andPhoto: (NSString*) photo{
    if (self= [super init]) {
        self.shoes = shoes;
        self.price = price;
        NSString *photoFile = [NSString stringWithFormat:@"%@.jpg",photo];
        self.photo = [UIImage imageNamed:photoFile];
        NSString *iconFile = [NSString stringWithFormat:@"%@0.jpg",photo];
        self.icon = [UIImage imageNamed:iconFile];
        
    }
    return self;
}

@end
