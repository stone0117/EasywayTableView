//
//  SNFooterModel.h
//  EasywayTableView
//
//  Created by stone on 16/6/22.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNFooterModel : NSObject
/** icon */
@property (nonatomic,copy) NSString * icon;
/** name */
@property (nonatomic,copy) NSString * name;
/** intro */
@property (nonatomic,copy) NSString * intro;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)modelWithDict:(NSDictionary *)dict;
/** convince */
+ (NSArray *)models;
@end
