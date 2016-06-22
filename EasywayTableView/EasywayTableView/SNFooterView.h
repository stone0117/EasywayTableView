//
//  SNFooterView.h
//  EasywayTableView
//
//  Created by stone on 16/6/22.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNFooterModel.h"

@interface SNFooterView : UITableViewHeaderFooterView
+ (instancetype)footerViewWithTableView:(UITableView *)tableView;

/** footerModel */
@property (nonatomic,strong) SNFooterModel * footerModel;
@end
