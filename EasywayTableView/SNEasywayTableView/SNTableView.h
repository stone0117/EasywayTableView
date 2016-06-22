//
//  SNTableView.h
//  EasywayTableView
//
//  Created by stone on 16/6/22.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SNTableViewDelegate <NSObject>

@optional
- (UITableViewCell *)cellWithTableView:(UITableView *)tableView;
- (UITableViewHeaderFooterView *)headerViewWithTableView:(UITableView *)tableView;
- (UITableViewHeaderFooterView *)footerViewWithTableView:(UITableView *)tableView;
@required
- (id)getCellModelWith:(NSArray *)cellModels indexPath:(NSIndexPath *)indexPath;

@end

@interface SNTableView : UITableView<UITableViewDataSource, UITableViewDelegate>

/** customHeaderView */
@property (nonatomic,strong,readonly) UITableViewHeaderFooterView * customHeaderView;
/** customFooterView */
@property (nonatomic,strong,readonly) UITableViewHeaderFooterView * customFooterView;
/** customCell */
@property (nonatomic,strong,readonly) UITableViewCell * customCell;

/** cellModels */
@property (nonatomic,strong) NSArray * cellModels;
/** headerModels */
@property (nonatomic,strong) NSArray * headerModels;
/** footerModels */
@property (nonatomic,strong) NSArray * footerModels;

/** cellCount */
@property (nonatomic, assign) NSInteger cellCount;

/** groupCount */
@property (nonatomic, assign) NSInteger groupCount;


/** customDelegate */
@property (nonatomic,weak) id<SNTableViewDelegate> customDelegate;

@end
