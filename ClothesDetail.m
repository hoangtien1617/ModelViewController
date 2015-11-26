//
//  ClothesDetail.m
//  Nubee House Shop
//
//  Created by Hoàng Tiến on 11/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "ClothesDetail.h"

@interface ClothesDetail ()
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *information;

@end

@implementation ClothesDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    self.photo.image = self.model.photo;
    self.photo.contentMode = UIViewContentModeScaleAspectFit;
    self.information.text = [NSString stringWithFormat:@"%@ (%@)", self.model.clothes, self.model.price];
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self dismissViewControllerAnimated:true completion:nil];

}

@end
