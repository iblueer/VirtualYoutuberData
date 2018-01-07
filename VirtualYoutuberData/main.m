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
#import "MAEMOBilibiliGirl.h"

int main (int argc, const char * argv[]){
    @autoreleasepool {
        // 创建文件管理器
        NSFileManager *fm = [NSFileManager defaultManager];
        // 创建需要的目录
        [fm createDirectoryAtPath:@"/tmp/VirtualYoutuberData" withIntermediateDirectories:YES attributes:nil error:nil];
        
        
        /*-----------------------------------------------------------------------------------------------*/
        // Names数组
        NSArray *names = @[@"キズナアイ",
                           @"ミライアカリ",
                           @"輝夜月",
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
        NSArray *bnames = @[@"木鱼水心", @"小希"];
        
        // Types数组
        NSArray *types = @[@"3D", @"3D", @"3D", @"2D", @"2D", @"3D", @"3D", @"3D", @"3D", @"3D", @"3D", @"3D", @"3D", @"3D", @"3D(2D)", @"2D"];
        NSArray *btypes = @[@"2D", @"3D"];
        
        // URL数组
        NSArray *urls = @[@"https://www.youtube.com/channel/UC4YaOt1yT-ZeyB0OmxHgolA",
                          @"https://www.youtube.com/user/bittranslate/featured",
                          @"https://www.youtube.com/channel/UCQYADFw7xEJ9oZSM5ZbqyBw",
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
        // YoutubeBilibiliURL数组
        NSArray *yburls = @[@"https://space.bilibili.com/1473830",
                           @"https://space.bilibili.com/54081",
                           @"https://space.bilibili.com/265224956"];
        // BilibiliURL数组
        NSArray *burls = @[@"https://space.bilibili.com/927587",
                           @"https://space.bilibili.com/5563350"];
        
        // Bilibili数组
        NSArray *ybid = @[@"1473830", // Kizuna AI
                          @"54081", // 未来灯里
                          @"265224956"]; // 话唠
        
        NSArray *bid = @[@"927587", // 木鱼
                         @"5563350"]; // 小希
        
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
        
        NSArray *bintroduces = @[@"混迹各大区的老牌UP，凭借一张好嘴吃遍天下，唯一一个不靠人设的虚拟UP",
                                 @"中国首个虚拟AI，配音强无敌"];
        
        /*-----------------------------------------------------------------------------------------------*/
        
        // Girls对象数组
        NSMutableArray *girls = [[NSMutableArray alloc] init];
        NSMutableArray *bgirls = [[NSMutableArray alloc] init];
        
        // 循环次数：名字的个数
        
        // 添加Kizuna AI，未来灯里和辉夜月
        // 创建YBGirl
        for (int i = 0; i < 3; i++) {
            MAEMOYoutubeBilibiliGirl *ybgirl = [[MAEMOYoutubeBilibiliGirl alloc] init];
            [girls addObject:ybgirl];
            
            // 向Girl赋值
            ybgirl.name = names[i];
            ybgirl.type = types[i];
            ybgirl.url = urls[i];
            ybgirl.introduce = introduces[i];
            ybgirl.bilibiliID = ybid[i];
            ybgirl.bilibiliURL = yburls[i];
            
            // 调用getNumberFromNet方法
            [ybgirl getNumberFromNet];
            
            // 调用getBilibiliNumber方法
            [ybgirl getBilibiliNumberFromNet];
            
            // 对象初始化完成
        }

        // 跳过Kizuna AI/未来灯里/辉夜月。
        // 创建剩下的纯YoutubeGirl
        for (int i = 3; i < names.count; i++) {
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
            
            // 如果粉丝数为0，则直接从表中移除。
            if (girl.number == 0) {
                [girls removeObject:girl];
            }
        }
        
        /*-----------------------------------------------------------------------------------------------*/
        // 创建两个单独的b站主播
        // 创建木鱼水心-YBGirl
        {
            MAEMOYoutubeBilibiliGirl *ybgirl = [[MAEMOYoutubeBilibiliGirl alloc] init];
            [bgirls addObject:ybgirl];
            
            // 向Girl赋值
            ybgirl.name = bnames[0];
            ybgirl.type = btypes[0];
            ybgirl.url = @"https://www.youtube.com/channel/UCYgbkPn7g6CZKAMn4cQavEw";
            ybgirl.introduce = bintroduces[0];
            ybgirl.bilibiliID = bid[0];
            ybgirl.bilibiliURL = burls[0];
            
            // 调用getNumberFromNet方法
            [ybgirl getNumberFromNet];
            
            // 调用getBilibiliNumber方法
            [ybgirl getBilibiliNumberFromNet];
            
            // 对象初始化完成
        }
        
        // 创建小希纯BGirl
        {
            MAEMOBilibiliGirl *bgirl = [[MAEMOBilibiliGirl alloc] init];
            [bgirls addObject:bgirl];
            
            // 向Girl赋值
            bgirl.name = bnames[1];
            bgirl.type = btypes[1];
            bgirl.introduce = bintroduces[1];
            bgirl.bilibiliID = bid[1];
            bgirl.bilibiliURL = burls[1];
            
            // 调用getBilibiliNumber方法
            [bgirl getBilibiliNumberFromNet];
            
            // 对象初始化完成
        }
        
        // 对象全部完成
        NSLog(@"对象全部建立成功");
        /*-----------------------------------------------------------------------------------------------*/
        
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
        
        /*-----------------------------------------------------------------------------------------------*/
        // 同样给Bilibili的这么做。
        
        // 按照粉丝数量bilibiliNumber排序
        NSMutableArray *borderedGirls = [[NSMutableArray alloc] initWithArray:bgirls];
        NSSortDescriptor *bdesc = [NSSortDescriptor sortDescriptorWithKey:@"bilibiliNumber" ascending:false];
        NSArray *bdescriptors = @[bdesc];
        [borderedGirls sortUsingDescriptors:bdescriptors];
        
        // 建立一个的NSString，它是最后输出字符串的开头部分
        NSString *bresultTitle = [NSString stringWithFormat:@"\n|名字|种类|人气|频道|备注|\n|---|---|---|---|---|\n"];
        
        // 现在将正确的数据输出到NSString中
        //    拼接字符串  就得使用可变的字符串
        NSMutableString *bresult = [[NSMutableString alloc] initWithFormat:@""];
        [bresult appendString:bresultTitle];
        
        for(int i = 0; i < bgirls.count; i++){
            [bresult appendFormat:@"%@\n", borderedGirls[i]];//格式化的字符串
        }
        [bresult appendString:@"\n"];//换一行
        [bresult appendString:dateStamp];//加上时间戳
        /*-----------------------------------------------------------------------------------------------*/
        
        // 将最后的字符串输入到文本文件中
        NSData *data = [result dataUsingEncoding:NSUTF8StringEncoding];
        NSData *bdata = [bresult dataUsingEncoding:NSUTF8StringEncoding];
        
        // 以data的文件内容创建result.md
        [fm createFileAtPath:@"/tmp/VirtualYoutuberData/result.md" contents:data attributes:nil];
        [fm createFileAtPath:@"/tmp/VirtualYoutuberData/bresult.md" contents:bdata attributes:nil];
        
        NSLog(@"已成功导出Markdown文本文件到/tmp/VirtualYoutuberData/目录下");
        
        // 删除文件
        [fm removeItemAtPath:@"/tmp/VirtualYoutuberData/YoutubeGirl.html" error:nil];
        [fm removeItemAtPath:@"/tmp/VirtualYoutuberData/BilibiliGirl.html" error:nil];
        
    }
    return 0;
}

