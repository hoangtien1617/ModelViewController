//
//  BagNBH.m
//  Nubee House Shop
//
//  Created by Hoàng Tiến on 11/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "BagNBH.h"
#import "NBHBModel.h"
#import "BagDataManager.h"
@interface BagNBH ()
@property (weak, nonatomic) IBOutlet UINavigationBar *bagNavigation;
@property (weak, nonatomic) IBOutlet UIScrollView *bagScrollView;
@property (weak, nonatomic) IBOutlet UILabel *bagLabel;
@property (weak, nonatomic) IBOutlet UIPageControl *bagPageView;

@end

@implementation BagNBH
{
    BagDataManager *dataManager;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    dataManager = [BagDataManager getSingleton];
    self.bagPageView.numberOfPages = dataManager.data.count;
    CGSize scrollViewSize = self.bagScrollView.bounds.size;
    self.bagScrollView.contentSize = CGSizeMake(scrollViewSize.width * dataManager.data.count, scrollViewSize.height);
    self.bagScrollView.pagingEnabled   = true;
    int i = 0 ;
    for (NBHBModel *model in dataManager.data) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:model.photo];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake(i*scrollViewSize.width, 0, scrollViewSize.width, scrollViewSize.height);
        [self.bagScrollView addSubview:imageView];
        i++;
    }
    
    [self updateLabelAt:0];

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.bagPageView.currentPage = self.bagScrollView.contentOffset.x / self.bagScrollView.bounds.size.width;
    [self updateLabelAt:(int)self.bagPageView.currentPage];
}
- (void) updateLabelAt: (int) index {
    NBHBModel* model = dataManager.data[index];
    self.bagLabel.text = [NSString stringWithFormat:@"%@ - %@", model.bag, model.price];
    // CGSize labelSize = [self.modelLabel.text sizeWithAttributes:@{NSFontAttributeName:self.modelLabel.font}];
    //self.modelLabel.frame = CGRectMake(
    //                                self.modelLabel.frame.origin.x, self.modelLabel.frame.origin.y,
    //                                  self.modelLabel.frame.size.width, labelSize.height);
    
}

- (IBAction)onPageControlChange:(UIPageControl *)sender {
    self.bagScrollView.contentOffset = CGPointMake(self.bagPageView.currentPage * self.bagScrollView.bounds.size.width, 0);

}


@end
