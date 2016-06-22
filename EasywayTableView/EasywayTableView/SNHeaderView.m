//
//  SNHeaderView.m
//  EasywayTableView
//
//  Created by stone on 16/6/22.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "SNHeaderView.h"
@interface SNHeaderView()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end
@implementation SNHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView {
    
    static NSString * ID = @"headercell";
    
    SNHeaderView * headercell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];

    if (headercell == nil) {
        headercell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    
    return headercell;
}
- (void)setHeaderModel:(SNHeaderModel *)headerModel{
    _headerModel = headerModel;
    
    NSLog(@"headerModel");
    
    self.iconImageView.image = [UIImage imageNamed:headerModel.icon];
    
}
@end
