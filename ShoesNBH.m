//
//  ShoesNBH.m
//  Nubee House Shop
//
//  Created by Hoàng Tiến on 11/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "ShoesNBH.h"
#import "NBHSModel.h"
#import "ShoesDataManager.h"

@interface ShoesNBH ()
@property (weak, nonatomic) IBOutlet UIScrollView *shoesScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *shoesPageControl;
@property (weak, nonatomic) IBOutlet UILabel *shoesLabel;

@end

@implementation ShoesNBH
{
    ShoesDataManager *dataManager;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    dataManager = [ShoesDataManager getSingleton];
    self.shoesPageControl.numberOfPages = dataManager.data.count;
    CGSize scrollViewSize = self.shoesScrollView.bounds.size;
    self.shoesScrollView.contentSize = CGSizeMake(scrollViewSize.width * dataManager.data.count, scrollViewSize.height);
    self.shoesScrollView.pagingEnabled   = true;
    int i = 0 ;
    for (NBHSModel *model in dataManager.data) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:model.photo];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake(i*scrollViewSize.width, 0, scrollViewSize.width, scrollViewSize.height);
        [self.shoesScrollView addSubview:imageView];
        i++;
    }
    
    [self updateLabelAt:0];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.shoesPageControl.currentPage = self.shoesScrollView.contentOffset.x / self.shoesScrollView.bounds.size.width;
    [self updateLabelAt:(int)self.shoesPageControl.currentPage];
}
- (void) updateLabelAt: (int) index {
    NBHSModel* model = dataManager.data[index];
    self.shoesLabel.text = [NSString stringWithFormat:@"%@ - %@", model.shoes, model.price];
    // CGSize labelSize = [self.modelLabel.text sizeWithAttributes:@{NSFontAttributeName:self.modelLabel.font}];
    //self.modelLabel.frame = CGRectMake(
    //                                self.modelLabel.frame.origin.x, self.modelLabel.frame.origin.y,
    //                                  self.modelLabel.frame.size.width, labelSize.height);
    
}
- (IBAction)valueChange:(UIPageControl *)sender {
    self.shoesScrollView.contentOffset = CGPointMake(self.shoesPageControl.currentPage * self.shoesScrollView.bounds.size.width, 0);

}

@end
