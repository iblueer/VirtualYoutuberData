//
//  MAEMOYoutubeBilibiliGirl.h
//  GetDataFromURL
//
//  Created by 宅音かがや on 2017/12/20.
//  Copyright © 2017年 宅音かがや. All rights reserved.
//

#import "MAEMOYoutubeGirl.h"

@interface MAEMOYoutubeBilibiliGirl : MAEMOYoutubeGirl
// 在父类基础上添加了新的参数
@property (nonatomic) NSString *bilibiliUrl;
// 将要获得的参数
@property (nonatomic) NSString *bilibiliNumber;
// 中国特色的方法
-(void) getBilibiliNumber;
@end
