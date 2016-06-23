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

//- (UITableViewCell *)cellWithTableView:(UITableView *)tableView;
//- (UITableViewHeaderFooterView *)headerViewWithTableView:(UITableView *)tableView;
//- (UITableViewHeaderFooterView *)footerViewWithTableView:(UITableView *)tableView;
//
///** cell */
//- (void)registerClass:(Class)cls forCellReuseIdentifier:(NSString *)identifier;
//- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier;
//
///** headerView */
//- (void)registerClass:(Class)cls forHeaderViewReuseIdentifier:(NSString *)identifier;
//- (void)registerNib:(UINib *)nib forHeaderViewReuseIdentifier:(NSString *)identifier;
//
///** footerView */
//- (void)registerClass:(Class)cls forFooterViewReuseIdentifier:(NSString *)identifier;
//- (void)registerNib:(UINib *)nib forFooterViewReuseIdentifier:(NSString *)identifier;


@required
/** 想知道 cell是 indexPath.row 获取的 还是 indexPath.section 获取的 */
- (id)getCellModelWith:(NSArray *)cellModels indexPath:(NSIndexPath *)indexPath;

@end

@interface SNTableView : UITableView<UITableViewDataSource, UITableViewDelegate>

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

/** cell */
// [self registerClass:<#(nullable Class)#> forCellReuseIdentifier:<#(nonnull NSString *)#>];
// [self registerNib:<#(nullable UINib *)#> forCellReuseIdentifier:<#(nonnull NSString *)#>];

/** headerView */
// [self registerClass:<#(nullable Class)#> forHeaderFooterViewReuseIdentifier:<#(nonnull NSString *)#>];
// [self registerNib:<#(nullable UINib *)#> forHeaderFooterViewReuseIdentifier:<#(nonnull NSString *)#>];

/** footerView */
// [self registerClass:<#(nullable Class)#> forHeaderFooterViewReuseIdentifier:<#(nonnull NSString *)#>];
// [self registerNib:<#(nullable UINib *)#> forHeaderFooterViewReuseIdentifier:<#(nonnull NSString *)#>];
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style cellWithClassOrNib:(id)cell cellID:(NSString *)cellID headerViewWithClassOrNib:(id)headerView headerViewID:(NSString *)headerViewID footerViewWithClassOrNib:(id)footerView footerViewID:(NSString *)footerViewID;
//- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style cellWithClassOrNib:(id)cell cellID:(NSString *)cellID footerViewWithClassOrNib:(id)footerView footerViewID:(NSString *)footerViewID;
//- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style cellWithClassOrNib:(id)cell cellID:(NSString *)cellID headerViewWithClassOrNib:(id)headerView headerViewID:(NSString *)headerViewID;
//- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style cellWithClassOrNib:(id)cell cellID:(NSString *)cellID;
//- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;
@end
