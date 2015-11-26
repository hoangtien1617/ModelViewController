//
//  ShoesDetail.m
//  Nubee House Shop
//
//  Created by Hoàng Tiến on 11/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "ShoesDetail.h"

@interface ShoesDetail ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *information;

@end

@implementation ShoesDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    self.imageView.image = self.model.photo;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.information.text = [NSString stringWithFormat:@"%@ (%@)", self.model.shoes, self.model.price];
}

- (IBAction)onTap:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
