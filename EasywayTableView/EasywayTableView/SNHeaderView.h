//
//  SNHeaderView.h
//  EasywayTableView
//
//  Created by stone on 16/6/22.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNHeaderModel.h"

@interface SNHeaderView : UITableViewHeaderFooterView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

/** headerModel */
@property (nonatomic,strong) SNHeaderModel * headerModel;

@end
