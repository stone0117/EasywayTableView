//
//  SNViewController.m
//  EasywayTableView
//
//  Created by stone on 16/6/22.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "SNCellModel.h"
#import "SNTableViewCell.h"
#import "SNHeaderModel.h"
#import "SNHeaderView.h"
#import "SNFooterView.h"
#import "SNFooterModel.h"
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

    SNTableView * tableView = [[SNTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped cellWithClassOrNib:[UINib nibWithNibName:@"SNTableViewCell" bundle:nil] cellID:@"cellID" headerViewWithClassOrNib:[UINib nibWithNibName:@"SNHeaderView" bundle:nil] headerViewID:@"headerViewID" footerViewWithClassOrNib:[UINib nibWithNibName:@"SNFooterView" bundle:nil] footerViewID:@"footerViewID"];
    
    tableView.customDelegate = self;
    
    tableView.groupCount = self.cellModels.count; //50;

    tableView.cellCount = 1;
    //=========  ============================ stone 🐳 ===========/
    
    tableView.cellModels = self.cellModels;
    
    tableView.headerModels = self.headerModels;

    tableView.footerModels = self.footerModels;
    
    //========= ============================ stone 🐳 ===========/
    
    [self.view addSubview:tableView];
}

#pragma mark - <SNTableViewDelegate>
/** @required */
- (id)getCellModelWith:(NSArray *)cellModels indexPath:(NSIndexPath *)indexPath{
    
    return cellModels[indexPath.section];
}

@end
