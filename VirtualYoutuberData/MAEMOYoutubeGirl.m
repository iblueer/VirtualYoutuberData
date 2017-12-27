//
//  MAEMOYoutubeGirl.m
//  GetDataFromURL
//
//  Created by 宅音かがや on 2017/12/20.
//  Copyright © 2017年 宅音かがや. All rights reserved.
//

#import "MAEMOYoutubeGirl.h"

@implementation MAEMOYoutubeGirl

-(NSString *)description {
    return [NSString stringWithFormat:@"|%@|%@|%ld|[Youtube](%@)|%@|", self.name, self.type, self.number, self.url, self.introduce];
}

-(void)getNumberFromNet {
    // 先判断有没有参数？
    if(!self.url) {
        NSLog(@"Error: No URL");
    }
    // 从网上获取html文件
    NSError *error;
    NSURL *remoteTextFileURL = [NSURL URLWithString:self.url];
    NSData *remoteTextFileData = [NSData dataWithContentsOfURL:remoteTextFileURL];
    if (!remoteTextFileData) {
        NSLog(@"get remote data failed. error: %@", [error localizedDescription]);
    }
    // 写入文件
    NSString *target = @"/Users/Shared/VirtualYoutuberData/YoutubeGirl.html";
    BOOL written =[remoteTextFileData writeToFile:target atomically:YES];
    if (!written) {
        NSLog(@"write to file failed.");
    }
    //*************直接从文件中读取字符串***************
    //创建一个用来接受文件中字符串信息的字符串
    NSString *strHTML=[NSString stringWithContentsOfFile:@"/Users/Shared/VirtualYoutuberData/YoutubeGirl.html" encoding:NSUTF8StringEncoding error:&error];
    if (!strHTML) {
        NSLog(@"read from file failed. error: %@", [error localizedDescription]);
    }
    // 正序查找
    // 查找 一小段字符串 在 字符串str2 中的位置（并输出 子字符串 在 str2 中的位置及其长度）
    // 注：这里其实就是寻找一个  字符串  的  子字符串
    NSString *keywordBegin = @"aria-label=\"チャンネル登録者数 ";
    NSString *keywordEnd = @" 人\">";
    NSRange tourokusyasuu = [strHTML rangeOfString:keywordBegin];//声明枚举类型的实例对象不用加 * ，如果加了 * ，就成这个对象的地址了，显然就不对了。
    NSRange nin = [strHTML rangeOfString:keywordEnd];
    //        - (NSRange)rangeOfString:(NSString *)aString;
    //        我们在注释中可以知道 rangeOfString 这个方法的返回值是 NSRange
    
    //        而 NSRange 是什么呢？
    
    //        typedef struct _NSRange {
    //            NSUInteger location;
    //            NSUInteger length;
    //        } NSRange;
    
    //        显然这是一个枚举类型，返回值是 该子字符串  在 字符串str2 中的 位置 和 自身长度
    
    // rangeOfString 作用是查找子字符串itcast在 str中第一次出现的位置
    // 如果找能够查找到字符串，则返回子字符串的位置信息
    // 如果查找不到，则返回的Range的
    //                          位置 是一个特别大得数
    //                          length 0
    
    
    
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
    //根据指点范围提取字符串.
    //NSString *str4 = [strHTML substringWithRange:NSMakeRange(, 4)];
    //这是更加简单的写法, NSMakeRange是一个C语言的函数, 特征就是用圆括号表示.
    //NSMakeRange的函数就是创建一个range, 输入location和length, 并返回值就是一个Range类型.
    //NSLog(@"登录者数为 %@", number);
//    self.number = num;
    
    NSString *trimmedString = [num stringByReplacingOccurrencesOfString:@"," withString:@""];
//    NSLog(@"%@", trimmedString);
    //trimmedString就是过滤后的字符串
    self.number = [trimmedString integerValue];
//    NSLog(@"%ld", self.number);
}
@end
