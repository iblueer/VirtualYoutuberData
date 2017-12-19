//
//  MAEMOYoutubeGirl.h
//  GetDataFromURL
//
//  Created by 宅音かがや on 2017/12/20.
//  Copyright © 2017年 宅音かがや. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAEMOYoutubeGirl : NSObject
// 预设参数
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *type;
@property (nonatomic) NSString *url;
@property (nonatomic) NSString *introduce;
// 将要获得的参数
//@property (nonatomic) NSString *number;
@property (nonatomic) long number;
// 额外的方法
-(void)getNumberFromNet;
@end
