//
//  main.m
//  VirtualYoutuberData
//
//  Created by 宅音かがや on 2017/12/20.
//  Copyright © 2017年 宅音かがや. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAEMOYoutubeGirl.h"
#import "MAEMOYoutubeBilibiliGirl.h"

int main (int argc, const char * argv[]){
    @autoreleasepool {
        // 创建文件管理器
        NSFileManager *fm = [NSFileManager defaultManager];
        // 创建需要的目录
        [fm createDirectoryAtPath:@"/Users/Shared/VirtualYoutuberData" withIntermediateDirectories:YES attributes:nil error:nil];
        
        
        /*-----------------------------------------------------------------------------------------------*/
        // Names数组
        NSArray *names = @[@"キズナアイ",
                           @"輝夜月",
                           @"ミライアカリ",
                           @"萌実",
                           @"エイレーン",
                           @"のじゃロリ狐娘",
                           @"電脳少女シロ",
                           @"藤崎由愛",
                           @"ときのそら",
                           @"富士葵",
                           @"バララとカレン",
                           @"ばあちゃる",
                           @"環と杏",
                           @"虎妮",
                           @"エゼ",
                           @"さはな"];
        
        // Types数组
        NSArray *types = @[@"3D", @"3D", @"3D", @"2D", @"2D", @"3D", @"3D", @"3D", @"3D", @"3D", @"3D", @"3D", @"3D", @"3D", @"3D(2D)", @"2D"];
        
        // URL数组
        NSArray *urls = @[@"https://www.youtube.com/channel/UC4YaOt1yT-ZeyB0OmxHgolA",
                          @"https://www.youtube.com/channel/UCQYADFw7xEJ9oZSM5ZbqyBw",
                          @"https://www.youtube.com/user/bittranslate/featured",
                          @"https://www.youtube.com/channel/UCy5lOmEQoivK5XK7QCaRKug",
                          @"https://www.youtube.com/user/TheOtakuMoe",
                          @"https://www.youtube.com/channel/UCt8tmsv8kL9Nc1sxvCo9j4Q",
                          @"https://www.youtube.com/channel/UCLhUvJ_wO9hOvv_yYENu4fQ",
                          @"https://www.youtube.com/channel/UC_zztIHGbBz9L-ZM-Ta2O1Q",
                          @"https://www.youtube.com/channel/UCp6993wxpyDPHUpavwDFqgg",
                          @"https://www.youtube.com/channel/UC3Ruo_5doyu514PesWGvCAg",
                          @"https://www.youtube.com/channel/UCpAcI-1ZUZVBNXzAd7pTMAA",
                          @"https://www.youtube.com/channel/UC6TyfKcsrPwBsBnx2QobVLQ",
                          @"https://www.youtube.com/channel/UCFI81W9F49a7GvimKF905eQ",
                          @"https://www.youtube.com/channel/UC6s0wLR0TZauzTVoGGw2r6g",
                          @"https://www.youtube.com/channel/UCf6s3Ri5h6b8fX2VDU0q8wg",
                          @"https://www.youtube.com/channel/UCynHwUYnx8V0NJ9_pU-aAsA"];
        
        // Bilibili数组
        NSArray *burls = @[@"https://space.bilibili.com/1473830/",
                           @"https://space.bilibili.com/265224956/"];
        
        // Introduces数组
        NSArray *introduces = @[@"登録者数百万超え、CM動画でお金を稼ぐ、世界一のバーチャールユーチューバー",
                                @"うるさいwてか登録者数増えるの速すぎ",
                                @"新しい企画、エイレーンの後輩、見た目はヨーロッパ人",
                                @"自称「あなたの嫁」だって？私まだ独身だけど",
                                @"西洋向け見たい、画風的には気に入らない",
                                @"こいつって、実おっさんだ",
                                @"声が幼い、体が成熟",
                                @"イメージが薄い、おっぱいがデカイ",
                                @"すごく元気です",
                                @"見かけは伝統の日本青年女性だそう",
                                @"姉妹ふたりで活動している",
                                @"うま？馬じゃない？いやうまですねこれ！",
                                @"新聞放送室で活動？草",
                                @"啊咧？台灣出身的虛擬UP主誒，卡哇伊",
                                @"ただの紙切りユーチューバーじゃん",
                                @"うわーこの絵ちょうダメだねw"];
        
        /*-----------------------------------------------------------------------------------------------*/
        
        // Girls对象数组
        NSMutableArray *girls = [[NSMutableArray alloc] init];
        
        // 循环次数：名字的个数
        
        // 添加Kizuna AI和辉夜月
        for (int i = 0; i < 2; i++) {
            MAEMOYoutubeBilibiliGirl *bgirl = [[MAEMOYoutubeBilibiliGirl alloc] init];
            [girls addObject:bgirl];
            
            // 向Girl赋值
            bgirl.name = names[i];
            bgirl.type = types[i];
            bgirl.url = urls[i];
            bgirl.introduce = introduces[i];
            bgirl.bilibiliUrl = burls[0];
            
            // 调用getNumberFromNet方法
            [bgirl getNumberFromNet];
            
            // 调用getBilibiliNumber方法
            [bgirl getBilibiliNumber];
            
            // 对象初始化完成
        }

        // 跳过Kizuna AI。
        // 跳过辉夜月。
        for (int i = 2; i < names.count; i++) {
            // 创建Girl
            MAEMOYoutubeGirl *girl = [[MAEMOYoutubeGirl alloc] init];
            [girls addObject:girl];
            
            // 向Girl赋值
            girl.name = names[i];
            girl.type = types[i];
            girl.url = urls[i];
            girl.introduce = introduces[i];
            
            // 调用getNumberFromNet函数
            [girl getNumberFromNet];
            
            // 对象初始化完成
        }
        
        // 对象全部完成
        NSLog(@"对象全部建立成功");
        
        // 建立一个NSDate类，格式化输出样式，以NSString格式显示现在的时间
        NSString *dateStamp;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = [NSString stringWithFormat:@"以上数据截至yyyy年MM月dd日 HH:mm"];
        dateStamp = [dateFormatter stringFromDate:[NSDate date]];
        
        // 按照粉丝数量number排序
        NSMutableArray *orderedGirls = [[NSMutableArray alloc] initWithArray:girls];
        NSSortDescriptor *desc = [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:false];
        NSArray *descriptors = @[desc];
        [orderedGirls sortUsingDescriptors:descriptors];
        
        // 建立一个的NSString，它是最后输出字符串的开头部分
        NSString *resultTitle = [NSString stringWithFormat:@"\n|名前|種類|人気|チャンネル|注釈|\n|---|---|---|---|---|\n"];
        
        // 现在将正确的数据输出到NSString中
        //    拼接字符串  就得使用可变的字符串
        NSMutableString *result = [[NSMutableString alloc] initWithFormat:@""];
        [result appendString:resultTitle];//加上一个字符串
        for(int i = 0; i < girls.count; i++){
            [result appendFormat:@"%@\n", orderedGirls[i]];//格式化的字符串
        }
        [result appendString:@"\n"];//换一行
        [result appendString:dateStamp];//加上时间戳
        
        // 将最后的字符串输入到文本文件中
        NSData *data = [result dataUsingEncoding:NSUTF8StringEncoding];
        [fm createFileAtPath:@"/Users/Shared/VirtualYoutuberData/result.md" contents:data attributes:nil];
        // 以data的文件内容创建result.md
        NSLog(@"已成功导出Markdown文本文件到/Users/Shared/VirtualYoutuberData/目录下");
        
        // 删除文件YoutubeGirl.html
        [fm removeItemAtPath:@"/Users/Shared/VirtualYoutuberData/YoutubeGirl.html" error:nil];
        
    }
    return 0;
}

