//
//  SNTableView.m
//  EasywayTableView
//
//  Created by stone on 16/6/22.
//  Copyright © 2016年 stone. All rights reserved.
//

//#import "SNFooterView.h"
//#import "SNHeaderView.h"
//#import "SNTableViewCell.h"
#import "SNTableView.h"
#import <objc/message.h>

@interface SNTableView ()
///** cell */
//@property(nonatomic, strong) UITableViewCell * cell;
///** headerView */
//@property(nonatomic, strong) UITableViewHeaderFooterView * headerView;
///** footerView */
//@property(nonatomic, strong) UITableViewHeaderFooterView * footerView;

/** identifier */
@property(nonatomic, strong) NSString * cellID;
@property(nonatomic, strong) NSString * headerID;
@property(nonatomic, strong) NSString * footerID;
@end

@implementation SNTableView
//=========  ============================ stone 🐳 ===========/

- (void)setupInit {
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.delegate = self;
    self.dataSource = self;

    self.estimatedRowHeight = 100;
    self.estimatedSectionHeaderHeight = 100;
    self.estimatedSectionFooterHeight = 100;
    //
    self.rowHeight = UITableViewAutomaticDimension;
    self.sectionHeaderHeight = UITableViewAutomaticDimension;
    self.sectionFooterHeight = UITableViewAutomaticDimension;
}
//===================================== stone ===========/
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style cellWithClassOrNib:(id)cell cellID:(NSString *)cellID headerViewWithClassOrNib:(id)headerView headerViewID:(NSString *)headerViewID footerViewWithClassOrNib:(id)footerView footerViewID:(NSString *)footerViewID {

    if (self = [self initWithFrame:frame style:style]) {
        [self setupInit];

        if (cellID) {

            if ([cell isKindOfClass:UINib.class]) {
                [self registerNib:cell forCellReuseIdentifier:cellID];
            } else {
                [self registerClass:[cell class] forCellReuseIdentifier:cellID];
            }
            self.cellID = cellID;
        }

        if (headerViewID) {
            if ([headerView isKindOfClass:UINib.class]) {
                [self registerNib:headerView forHeaderFooterViewReuseIdentifier:headerViewID];
            } else {
                [self registerClass:[headerView class] forHeaderFooterViewReuseIdentifier:headerViewID];
            }
            self.headerID = headerViewID;
        }

        if (footerViewID) {

            if ([footerView isKindOfClass:UINib.class]) {
                [self registerNib:footerView forHeaderFooterViewReuseIdentifier:footerViewID];
            } else {
                [self registerClass:[footerView class] forHeaderFooterViewReuseIdentifier:footerViewID];
            }
            self.footerID = footerViewID;
        }
    }
    return self;
}

////===================================== stone ===========/
//- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style cellWithClassOrNib:(id)cell cellID:(NSString *)cellID footerViewWithClassOrNib:(id)footerView footerViewID:(NSString *)footerViewID{
//
//    if (self = [self initWithFrame:frame style:style]) {
//        [self setupInit];
//
//        if ([cell isKindOfClass:UINib.class]) {
//            [self registerNib:cell forCellReuseIdentifier:cellID];
//        } else {
//            [self registerClass:[cell class] forCellReuseIdentifier:cellID];
//        }
//
//        if ([footerView isKindOfClass:UINib.class]) {
//            [self registerNib:footerView forHeaderFooterViewReuseIdentifier:footerViewID];
//        } else {
//            [self registerClass:[footerView class] forHeaderFooterViewReuseIdentifier:footerViewID];
//        }
//
//
//        self.cellID = cellID;
//
//        self.footerID = footerViewID;
//    }
//    return self;
//}
////===================================== stone ===========/
//- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style cellWithClassOrNib:(id)cell cellID:(NSString *)cellID headerViewWithClassOrNib:(id)headerView headerViewID:(NSString *)headerViewID{
//
//    if (self = [self initWithFrame:frame style:style]) {
//        [self setupInit];
//
//        if ([cell isKindOfClass:UINib.class]) {
//            [self registerNib:cell forCellReuseIdentifier:cellID];
//        } else {
//            [self registerClass:[cell class] forCellReuseIdentifier:cellID];
//        }
//
//        if ([headerView isKindOfClass:UINib.class]) {
//            [self registerNib:headerView forHeaderFooterViewReuseIdentifier:headerViewID];
//        } else {
//            [self registerClass:[headerView class] forHeaderFooterViewReuseIdentifier:headerViewID];
//        }
//
//        self.cellID = cellID;
//        self.headerID = headerViewID;
//
//
//    }
//    return self;
//}
////===================================== stone ===========/
//- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style cellWithClassOrNib:(id)cell cellID:(NSString *)cellID {
//
//    if (self = [self initWithFrame:frame style:style]) {
//        [self setupInit];
//
//        if ([cell isKindOfClass:UINib.class]) {
//            [self registerNib:cell forCellReuseIdentifier:cellID];
//        } else {
//            [self registerClass:[cell class] forCellReuseIdentifier:cellID];
//        }
//
//        self.cellID = cellID;
//
//    }
//    return self;
//}
//
//- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
//    self = [super initWithFrame:frame style:style];
//    if (self) {
//
//        [self setupInit];
//    }
//    return self;
//}

#pragma mark - <UITableViewDataSource>
/** 组数 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupCount; //self.models.count;
}
/** 行数 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellCount;
}

- (NSString *)getPropertyNames:(NSString *)string cellModelType:(NSString *)cellModelType {
    // 遍历模型中属性
    unsigned int count = 0;
    // 取出模型中所有属性
    Ivar * ivars = class_copyIvarList(NSClassFromString(string), &count);

    NSMutableArray * propertyNameList = [NSMutableArray array];
    // 遍历模型中所有属性
    for (int i = 0; i < count; i++) {
        // 取出属性
        Ivar ivar = ivars[i];
        // 获取属性名称（加下划线的属性名称）
        NSString * ivarName = @(ivar_getName(ivar));
        // 截取属性名称（取出下划线的属性名称）
        ivarName = [ivarName substringFromIndex:1];

        // NSLog(@"%@",ivarName);
        [propertyNameList addObject:ivarName];

        const char * propertyType = ivar_getTypeEncoding(ivar);

        NSString * propertyTypeName = [NSString stringWithUTF8String:propertyType];

        NSString * newStr = [NSString stringWithFormat:@"@\"%@\"", cellModelType];

        /*
         - (void)setCellModel:(SNCellModel *)cellModel
         */

        if ([newStr isEqualToString:propertyTypeName]) {

            NSString * firstStr = [ivarName substringWithRange:NSMakeRange(0, 1)];

            NSString * methodName = [ivarName stringByReplacingOccurrencesOfString:firstStr withString:firstStr.uppercaseString];

            NSLog(@"set%@:", methodName);

            return [NSString stringWithFormat:@"set%@:", methodName];
        }

        //        NSLog(@"%@ --- %@",newStr,propertyTypeName);
    }
    return @"";
}

/** cell */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    //    UITableViewCell * cell = ((id (*)(id, SEL, id))(void *)objc_msgSend)(self.customCell.class, NSSelectorFromString(@"cellWithTableView:"), tableView);

    //    UITableViewCell * cell = nil;
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:self.cellID forIndexPath:indexPath];

    //    if ([self.customDelegate respondsToSelector:@selector(cellWithTableView:)]) {
    //        cell = ((id (*)(id, SEL, id))(void *)objc_msgSend)(self.customDelegate, NSSelectorFromString(@"cellWithTableView:"), tableView);
    //    }

    //    id cellModel = self.cellModels[indexPath.section];
    //    id cellModel = ([self.customDelegate respondsToSelector:@selector(getCellModelWith:indexPath:)] == NO) ? nil : [self.customDelegate getCellModelWith:self.cellModels indexPath:indexPath];
    id cellModel = [self.customDelegate respondsToSelector:@selector(getCellModelWith:indexPath:)] ? [self.customDelegate getCellModelWith:self.cellModels indexPath:indexPath] : nil;

    NSString * methodName = [self getPropertyNames:NSStringFromClass([cell class]) cellModelType:NSStringFromClass([cellModel class])];

    if (![methodName isEqualToString:@""]) {

        ((void (*)(id, SEL, id))(void *)objc_msgSend)(cell, NSSelectorFromString(methodName), cellModel);
    }

    //    if (indexPath.section % 2) {
    //        cell.contentView.backgroundColor = [UIColor colorWithRed:152 / 255.0 green:208 / 255.0 blue:201 / 255.0 alpha:1.0];
    //    } else {
    //        cell.contentView.backgroundColor = [UIColor colorWithRed:76 / 255.0 green:165 / 255.0 blue:146 / 255.0 alpha:1.0];
    //    }

    return cell;

    /*
     UITableViewHeaderFooterView * headercell = nil;
     if ([self.customDelegate respondsToSelector:@selector(headerViewWithTableView:)]) {
     headercell = ((id (*)(id, SEL, id))(void *)objc_msgSend)(self.customDelegate, NSSelectorFromString(@"headerViewWithTableView:"), tableView);
     }
     
     
     
     //    headercell = ((id (*)(id, SEL, id))(void *)objc_msgSend)(headercell.class, NSSelectorFromString(@"headerViewWithTableView:"), tableView);
     
     NSLog(@"%@", headercell);
     // Implicitly declaring library function 'objc_msgSend' with type 'id (id, SEL, ...)'
     
     // objc_msgSend(self, NSSelectorFromString(@"foo"), tableView);
     
     // NSLog(@"%@",[objc class]);
     ((void (*)(id, SEL, id))(void *)objc_msgSend)(headercell, NSSelectorFromString(@"setHeaderModel:"), self.headerModels[section]);
     
     return headercell;
     */
}
#pragma mark - <UITableViewDelegate>
/** 选中一行 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}
/** 取消 选中 */
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0) {
}
/** 自定义section header */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    if (!self.headerID) {
        return nil;
    }

    //    SNHeaderView * headerView = [SNHeaderView headerViewWithTableView:tableView];
    //
    //    UIView * mView = [[UIView alloc] init];
    //    mView.backgroundColor = [UIColor redColor];
    //    mView.frame = headerView.bounds;
    //    headerView.backgroundView = mView;
    //
    //    return headerView;

    //    id header = [self.customHeaderView.class mes

    //    NSLog(@"---%@",tableView);

    //    id headercell = objc_msgSend(self.customHeaderView.class, NSSelectorFromString(@"headerViewWithTableView:"), tableView);
    //    UITableViewHeaderFooterView * headercell = ((id (*)(id, SEL, id))(void *)objc_msgSend)(self.customHeaderView.class, NSSelectorFromString(@"headerViewWithTableView:"), tableView);
    //

    //    UITableViewHeaderFooterView * headercell = nil;

    UITableViewHeaderFooterView * headercell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.headerID];

    //    if ([self.customDelegate respondsToSelector:@selector(headerViewWithTableView:)]) {
    //        headercell = ((id (*)(id, SEL, id))(void *)objc_msgSend)(self.customDelegate, NSSelectorFromString(@"headerViewWithTableView:"), tableView);
    //    }

    //    headercell = ((id (*)(id, SEL, id))(void *)objc_msgSend)(headercell.class, NSSelectorFromString(@"headerViewWithTableView:"), tableView);

    NSLog(@"%@", headercell);
    // Implicitly declaring library function 'objc_msgSend' with type 'id (id, SEL, ...)'

    // objc_msgSend(self, NSSelectorFromString(@"foo"), tableView);

    // NSLog(@"%@",[objc class]);

    //=========  ============================ stone 🐳 ===========/
    id headerModel = self.headerModels[section];

    NSString * methodName = [self getPropertyNames:NSStringFromClass([headercell class]) cellModelType:NSStringFromClass([headerModel class])];

    //=========  ============================ stone 🐳 ===========/
    if (![methodName isEqualToString:@""]) {

        ((void (*)(id, SEL, id))(void *)objc_msgSend)(headercell, NSSelectorFromString(methodName), self.headerModels[section]);
    }

    return headercell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {

    if (!self.footerID) {
        return nil;
    }
    //    UITableViewHeaderFooterView * footercell = ((id (*)(id, SEL, id))(void *)objc_msgSend)(self.customFooterView.class, NSSelectorFromString(@"footerViewWithTableView:"), tableView);
    //
    //    ((void (*)(id, SEL, id))(void *)objc_msgSend)(footercell, NSSelectorFromString(@"setFooterModel:"), self.footerModels[section]);
    //
    //    return footercell;

    //    UITableViewHeaderFooterView * footercell = nil;

    UITableViewHeaderFooterView * footercell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.footerID];
    //    if ([self.customDelegate respondsToSelector:@selector(footerViewWithTableView:)]) {
    //        footercell = ((id (*)(id, SEL, id))(void *)objc_msgSend)(self.customDelegate, NSSelectorFromString(@"footerViewWithTableView:"), tableView);
    //    }

    //=========  ============================ stone 🐳 ===========/
    id footerModel = self.footerModels[section];

    NSString * methodName = [self getPropertyNames:NSStringFromClass([footercell class]) cellModelType:NSStringFromClass([footerModel class])];

    //=========  ============================ stone 🐳 ===========/

    if (![methodName isEqualToString:@""]) {

        ((void (*)(id, SEL, id))(void *)objc_msgSend)(footercell, NSSelectorFromString(methodName), footerModel);
    }

    return footercell;
}

/* 动态计算cell高度 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    //    if (self.customCell == nil) {
    //        return 0.001;
    //    }
    //    return -1;

    if (self.cellID) {
        return -1;
    }
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    //    return -1; //0.001;//技巧
    //    if (self.customFooterView == nil) {
    //        return 0.001;
    //    }
    //    return -1;

    if (self.footerID) {
        return -1;
    }
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    //    return -1;

    //    if (self.customHeaderView == nil) {
    //        return 0.001;
    //    }

    if (self.headerID) {
        return -1;
    }
    return 0.001;
}
@end
