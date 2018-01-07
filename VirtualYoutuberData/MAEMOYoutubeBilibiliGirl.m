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
    return [NSString stringWithFormat:@"|%@|%@|%ld(Y)<br>%ld(B)|[Youtube](%@)<br>[Bilibili](%@)|%@|", self.name, self.type, self.number, self.bilibiliNumber, self.url, self.bilibiliURL, self.introduce];
}

-(void) getBilibiliNumberFromNet {
    // 先判断有没有参数？
    if(!self.bilibiliID) {
        NSLog(@"Error: No bilibiliID");
    }
    // 先来创建URL
    NSError *error;
    NSMutableString *burlString = [NSMutableString stringWithFormat:@"https://api.vc.bilibili.com/user_ex/v1/user/detail?uid=%@&user[]=role&user[]=level&room[]=live_status&room[]=room_link&feed[]=fans_count&feed[]=feed_count&feed[]=is_followed&feed[]=is_following&platform=pc", self.bilibiliID];
    NSURL *burl = [NSURL URLWithString:burlString];
    // 获取数据
    NSData *remoteTextFileData = [NSData dataWithContentsOfURL:burl];
    if (!remoteTextFileData) {
        NSLog(@"get remote data failed. error: %@", [error localizedDescription]);
    }
    // 将数据写入本地文件
    NSString *target = @"/tmp/VirtualYoutuberData/BilibiliGirl.html";
    BOOL written =[remoteTextFileData writeToFile:target atomically:YES];
    if (!written) {
        NSLog(@"write to file failed.");
    }
    //创建一个用来接受文件中字符串信息的字符串
    NSString *strHTML=[NSString stringWithContentsOfFile:@"/tmp/VirtualYoutuberData/BilibiliGirl.html" encoding:NSUTF8StringEncoding error:&error];
    if (!strHTML) {
        NSLog(@"read from file failed. error: %@", [error localizedDescription]);
    }
    // 正序查找
    // 查找 一小段字符串 在 字符串strHTML 中的位置（并输出 子字符串 在 strHTML 中的位置及其长度）
    // 注：这里其实就是寻找一个  字符串  的  子字符串
    NSString *keywordBegin = @"fans_count\":";
    NSString *keywordEnd = @",\"feed_count";
    NSRange tourokusyasuu = [strHTML rangeOfString:keywordBegin];//声明枚举类型的实例对象不用加 * ，如果加了 * ，就成这个对象的地址了，显然就不对了。
    NSRange nin = [strHTML rangeOfString:keywordEnd];
    //创建两个整形，保存子字符串的位置
    NSUInteger start = 0;
    NSUInteger end = 0;
    if ((tourokusyasuu.location!=NSNotFound)&&(nin.location!=NSNotFound)&&(tourokusyasuu.location < nin.location)) {//这里其实就是如果 子字符串 在 该字符串 中的位置不是无限大，那么肯定就对了，如果无限大，肯定就跑到外面去了，就找不到了～
        NSLog(@"%@ 查找成功", self.name);
        start = tourokusyasuu.location + tourokusyasuu.length;
        end = nin.location;
        //NSLog(@"start = %u, end = %u", start, end);
    }
    else
    {
        NSLog(@"字符串匹配失败!");
    }
    // 然后既然已经知道子串的起止位置了，就要拿到那个关键数据了。
    // 将子字符串的位置保存为一个NSRange类型
    NSUInteger length = end - start;
    NSRange stringRange = {start, length};
    // start表示的是提取的初始位置.
    // length表示的是提取字符的长度.
    NSString *num = [strHTML substringWithRange:stringRange];
    self.bilibiliNumber = [num integerValue];
}

@end
