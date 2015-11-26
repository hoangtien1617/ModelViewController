//
//  ClothesTableViewNBH.m
//  Nubee House Shop
//
//  Created by Hoàng Tiến on 11/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "ClothesTableViewNBH.h"
#import "ClothesDataManager.h"
#import "NBHCModel.h"
#import "ClothesDetail.h"

@interface ClothesTableViewNBH ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation ClothesTableViewNBH
{
    ClothesDataManager *dataManager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    dataManager = [ClothesDataManager getSingleton];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataManager.data.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NBHCModel *model = dataManager.data[indexPath.row];
    cell.textLabel.text = model.clothes;
    cell.detailTextLabel.text = model.price;
    cell.imageView.image = model.icon;
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ClothesDetail *detailVC = (ClothesDetail*)segue.destinationViewController;
    NSIndexPath *selectedIndexpath = [self.tableView indexPathForSelectedRow];
    detailVC.model = dataManager.data[selectedIndexpath.row];
}

@end
