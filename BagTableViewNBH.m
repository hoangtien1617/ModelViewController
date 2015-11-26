//
//  BagTableViewNBH.m
//  Nubee House Shop
//
//  Created by Hoàng Tiến on 11/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "BagTableViewNBH.h"
#import "BagDataManager.h"
#import "NBHBModel.h"
#import "BagDetail.h"
@interface BagTableViewNBH () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BagTableViewNBH
{
    BagDataManager *dataManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    dataManager = [BagDataManager getSingleton];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataManager.data.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NBHBModel *model = dataManager.data[indexPath.row];
    cell.textLabel.text = model.bag;
    cell.detailTextLabel.text = model.price;
    cell.imageView.image = model.icon;
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BagDetail *detailVC = (BagDetail*)segue.destinationViewController;
    NSIndexPath *selectedIndexpath = [self.tableView indexPathForSelectedRow];
    detailVC.model = dataManager.data[selectedIndexpath.row];
}

@end
