//
//  ShoesDataManager.h
//  Nubee House Shop
//
//  Created by Hoàng Tiến on 11/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoesDataManager : NSObject
@property (nonatomic, strong) NSArray* data;
+ (instancetype)getSingleton;


@end
