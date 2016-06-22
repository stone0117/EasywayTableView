//
//  SNFooterModel.m
//  EasywayTableView
//
//  Created by stone on 16/6/22.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "SNFooterModel.h"

@implementation SNFooterModel
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)modelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
+ (NSArray *)models {
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
    NSArray * arr = [NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray * arrM = [NSMutableArray arrayWithCapacity:arr.count];
    
    [arr enumerateObjectsUsingBlock:^(NSDictionary * dict, NSUInteger idx, BOOL * _Nonnull stop) {
        SNFooterModel * model = [self modelWithDict:dict];
        [arrM addObject:model];
    }];
    return arrM.copy;
}
@end
