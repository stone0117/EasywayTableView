//
//  SNTableViewCell.h
//  EasywayTableView
//
//  Created by stone on 16/6/22.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNCellModel.h"

@interface SNTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

/** model */
@property (nonatomic,strong) SNCellModel * cellModel;

@end
