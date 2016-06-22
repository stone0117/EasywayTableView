//
//  SNViewController.m
//  EasywayTableView
//
//  Created by stone on 16/6/22.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "SNCellModel.h"
#import "SNFooterView.h"
#import "SNHeaderModel.h"
#import "SNHeaderView.h"
#import "SNTableView.h"
#import "SNTableViewCell.h"
#import "SNViewController.h"

@interface SNViewController () <SNTableViewDelegate>
/** cellModels */
@property(nonatomic, strong) NSArray * cellModels;
/** headerModels */
@property(nonatomic, strong) NSArray * headerModels;
/** footerModels */
@property(nonatomic, strong) NSArray * footerModels;

@end

@implementation SNViewController

- (NSArray *)cellModels {
    if (_cellModels == nil) {

        _cellModels = [SNCellModel models];
    }
    return _cellModels;
}
- (NSArray *)headerModels {
    if (_headerModels == nil) {

        _headerModels = [SNHeaderModel models];
    }
    return _headerModels;
}

- (NSArray *)footerModels {
    if (_footerModels == nil) {

        _footerModels = [SNFooterModel models];
    }
    return _footerModels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    SNTableView * tableView = [[SNTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];

    tableView.customDelegate = self;

    [self.view addSubview:tableView];

    tableView.groupCount = self.cellModels.count; //50;

    tableView.cellCount = 1;
    //=========  ============================ stone 🐳 ===========/
    
    tableView.cellModels = self.cellModels;
    
    tableView.headerModels = self.headerModels;

    tableView.footerModels = self.footerModels;
}

#pragma mark - <SNTableViewDelegate>
- (UITableViewCell *)cellWithTableView:(UITableView *)tableView {
    
    return [SNTableViewCell cellWithTableView:tableView];
}
- (UITableViewHeaderFooterView *)headerViewWithTableView:(UITableView *)tableView {
    
    return [SNHeaderView headerViewWithTableView:tableView];
}
- (UITableViewHeaderFooterView *)footerViewWithTableView:(UITableView *)tableView {
    
    return [SNFooterView footerViewWithTableView:tableView];
}
/** @required */
- (id)getCellModelWith:(NSArray *)cellModels indexPath:(NSIndexPath *)indexPath{
    
    return cellModels[indexPath.section];
}

@end
