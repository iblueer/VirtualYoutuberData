//
//  MAEMOYoutubeBilibiliGirl.m
//  GetDataFromURL
//
//  Created by 宅音かがや on 2017/12/20.
//  Copyright © 2017年 宅音かがや. All rights reserved.
//

#import "MAEMOYoutubeBilibiliGirl.h"

@implementation MAEMOYoutubeBilibiliGirl

-(NSString *)description {
    return [NSString stringWithFormat:@"|%@|%@|%ld(Y)<br>%@(B)|[Youtube](%@)<br>[Bilibili](%@)|%@|", self.name, self.type, self.number, self.bilibiliNumber, self.url, self.bilibiliUrl, self.introduce];
}

-(void) getBilibiliNumber {
    self.number = nil;
}
@end