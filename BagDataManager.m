//
//  BagDataManager.m
//  Nubee House Shop
//
//  Created by Hoàng Tiến on 11/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "BagDataManager.h"
#import "NBHBModel.h"
@implementation BagDataManager
+ (instancetype)getSingleton {
    static BagDataManager  *dataManager = nil;
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce, ^{
        dataManager = [self new];  // settings = [[self alloc] init]
        NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Bag"
                                                             ofType:@"plist"];
        
        NSArray* raw = [NSArray arrayWithContentsOfFile:filePath];
        NSLog(@"%@", raw);
        NSMutableArray* temp = [[NSMutableArray alloc] initWithCapacity:[raw count]];
        for (NSDictionary* item in raw) {
            
            NBHBModel* model = [[NBHBModel alloc] init:[item valueForKey:@"bag"]
                                             withPrice:[item valueForKey:@"price"]
                                              andPhoto:[item valueForKey:@"photo"]];
            [temp addObject:model];
        }
        dataManager.data = [NSArray arrayWithArray:temp];
    });
    return dataManager;
}

@end
