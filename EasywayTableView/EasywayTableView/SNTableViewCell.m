//
//  SNTableViewCell.m
//  EasywayTableView
//
//  Created by stone on 16/6/22.
//  Copyright © 2016年 stone. All rights reserved.
//


#import "SNTableViewCell.h"
////define this constant if you want to use Masonry without the 'mas_' prefix
//#define MAS_SHORTHAND
////define this constant if you want to enable auto-boxing for default syntax
//#define MAS_SHORTHAND_GLOBALS
//
//#import "Masonry.h"

@interface SNTableViewCell ()
@property(weak, nonatomic) IBOutlet UIImageView * iconImageView;
@property(weak, nonatomic) IBOutlet UILabel * nameLabel;
@property(weak, nonatomic) IBOutlet UILabel * introLabel;
//=========  ============================ stone 🐳 ===========/

//@property(weak, nonatomic)  UIImageView * iconImageView;
//@property(weak, nonatomic)  UILabel * nameLabel;
//@property(weak, nonatomic)  UILabel * introLabel;

//=========  ============================ stone 🐳 ===========/
@end

@implementation SNTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString * ID = @"cell";
    SNTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];

    if (cell == nil) {
        
        NSLog(@"----%@",NSStringFromClass([self class]));
        
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
        
//        cell = [[SNTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        UIImageView * iconImageView = [[UIImageView alloc] init];
        _iconImageView = iconImageView;
        [self addSubview:iconImageView];
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.numberOfLines = 0;
        _nameLabel = nameLabel;
        [self addSubview:nameLabel];
        
        UILabel * introLabel = [[UILabel alloc] init];
        introLabel.numberOfLines = 0;
        _introLabel = introLabel;
        [self addSubview:introLabel];
        
//        [self setupUI];
    }
    return self;
}
//- (void)setupUI{
//    
//    [self.iconImageView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.equalTo(self).offset(8);
//        make.width.height.equalTo(100);
//        make.bottom.lessThanOrEqualTo(self).offset(-8);
//    }];
//    
//    [self.nameLabel makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self).offset(8);
//        make.left.equalTo(self.iconImageView.right).offset(8);
//        make.right.equalTo(self).offset(-8);
//        
//        
//    }];
//    
//    [self.introLabel makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.nameLabel.bottom).offset(8);
//        make.left.equalTo(self.iconImageView.right).offset(8);
//        make.right.equalTo(self).offset(-8);
//        
//        
//        make.bottom.lessThanOrEqualTo(self).offset(-8);
//    }];
//}

- (void)setCellModel:(SNCellModel *)cellModel {
    _cellModel = cellModel;

    self.iconImageView.image = [UIImage imageNamed:cellModel.icon];
    self.nameLabel.text = cellModel.name;
    self.introLabel.text = cellModel.intro;
    NSLog(@"111");
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
