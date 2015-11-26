//
//  BagDetail.m
//  Nubee House Shop
//
//  Created by Hoàng Tiến on 11/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "BagDetail.h"

@interface BagDetail ()
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *information;

@end

@implementation BagDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photo.image = self.model.photo;
    self.photo.contentMode = UIViewContentModeScaleAspectFit;
    self.information.text = [NSString stringWithFormat:@"%@ (%@)", self.model.bag, self.model.price];
}

- (IBAction)onTapBack:(UITapGestureRecognizer *)sender {
    [self dismissViewControllerAnimated:true completion:nil];

}


@end
