//
//  SNFooterView.m
//  EasywayTableView
//
//  Created by stone on 16/6/22.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "SNFooterView.h"


@interface SNFooterView()
@property (weak, nonatomic) IBOutlet UILabel *introLabel;

@end
@implementation SNFooterView

+ (instancetype)footerViewWithTableView:(UITableView *)tableView {
    
    static NSString * ID = @"footercell";
    
    SNFooterView * footercell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    if (footercell == nil) {
        footercell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    
    return footercell;
}
- (void)setFooterModel:(SNFooterModel *)footerModel{
    _footerModel = footerModel;
    
    
    self.introLabel.text = footerModel.intro;
    
    NSLog(@"footerModel");
    
    
}

@end
