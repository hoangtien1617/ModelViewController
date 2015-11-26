//
//  ClothesNBH.m
//  Nubee House Shop
//
//  Created by Hoàng Tiến on 11/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "ClothesNBH.h"
#import "NBHCModel.h"
#import "ClothesDataManager.h"
@interface ClothesNBH ()
@property (weak, nonatomic) IBOutlet UIScrollView *ClothesScrollView;
@property (weak, nonatomic) IBOutlet UILabel *ClothesLabel;
@property (weak, nonatomic) IBOutlet UIPageControl *ClothesPageControl;

@end

@implementation ClothesNBH

{
    ClothesDataManager *dataManager;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    dataManager = [ClothesDataManager getSingleton];
    self.ClothesPageControl.numberOfPages = dataManager.data.count;
    CGSize scrollViewSize = self.ClothesScrollView.bounds.size;
    self.ClothesScrollView.contentSize = CGSizeMake(scrollViewSize.width * dataManager.data.count, scrollViewSize.height);
    self.ClothesScrollView.pagingEnabled   = true;
    int i = 0 ;
    for (NBHCModel *model in dataManager.data) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:model.photo];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake(i*scrollViewSize.width, 0, scrollViewSize.width, scrollViewSize.height);
        [self.ClothesScrollView addSubview:imageView];
        i++;
    }
    
    [self updateLabelAt:0];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.ClothesPageControl.currentPage = self.ClothesScrollView.contentOffset.x / self.ClothesScrollView.bounds.size.width;
    [self updateLabelAt:(int)self.ClothesPageControl.currentPage];
}
- (void) updateLabelAt: (int) index {
    NBHCModel* model = dataManager.data[index];
    self.ClothesLabel.text = [NSString stringWithFormat:@"%@ - %@", model.clothes, model.price];
    // CGSize labelSize = [self.modelLabel.text sizeWithAttributes:@{NSFontAttributeName:self.modelLabel.font}];
    //self.modelLabel.frame = CGRectMake(
    //                                self.modelLabel.frame.origin.x, self.modelLabel.frame.origin.y,
    //                                  self.modelLabel.frame.size.width, labelSize.height);
    
}

- (IBAction)onPageControlChange:(UIPageControl *)sender {
    self.ClothesScrollView.contentOffset = CGPointMake(self.ClothesPageControl.currentPage * self.ClothesScrollView.bounds.size.width, 0);
}



@end
