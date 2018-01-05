//
//  MAEMOBilibiliGirl.m
//  VirtualYoutuberData
//
//  Created by 宅音かがや on 2018/01/05.
//  Copyright © 2018年 宅音かがや. All rights reserved.
//

#import "MAEMOBilibiliGirl.h"

@implementation MAEMOBilibiliGirl
-(NSString *)description {
    return [NSString stringWithFormat:@"|%@|%@|%ld|[Bilibili](%@)|%@|", self.name, self.type, self.bilibiliNumber, self.bilibiliURL, self.introduce];
}
@end
