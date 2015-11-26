//
//  ShoesTableViewNBH.m
//  Nubee House Shop
//
//  Created by Hoàng Tiến on 11/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "ShoesTableViewNBH.h"
#import "ShoesDataManager.h"
#import "NBHSModel.h"
#import "ShoesDetail.h"

@interface ShoesTableViewNBH ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ShoesTableViewNBH
{
    ShoesDataManager *dataManager;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    dataManager = [ShoesDataManager getSingleton];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataManager.data.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NBHSModel *model = dataManager.data[indexPath.row];
    cell.textLabel.text = model.shoes;
    cell.detailTextLabel.text = model.price;
    cell.imageView.image = model.icon;
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ShoesDetail *detailVC = (ShoesDetail*)segue.destinationViewController;
    NSIndexPath *selectedIndexpath = [self.tableView indexPathForSelectedRow];
    detailVC.model = dataManager.data[selectedIndexpath.row];
}


@end
