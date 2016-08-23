//
//  AppDelegate.m
//  moonletScience
//
//  Created by 苏 on 16/4/2.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "LeftViewController.h"
#import "LeftSlideViewController.h"
#import "BindingAccountViewController.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>

//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

//微信SDK头文件
#import "WXApi.h"

//新浪微博SDK头文件
#import "WeiboSDK.h"
//新浪微博SDK需要在项目Build Settings中的Other Linker Flags添加"-ObjC"

@interface AppDelegate ()<WeiboSDKDelegate,WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //     Override point for customization after application launch.
    
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //取得第一个Documents文件夹的路径
    NSString *filePath = [path objectAtIndex:0];
    
    //把TestPlist文件加入
    NSString *plistPath = [filePath stringByAppendingPathComponent:@"test.plist"];
    NSDictionary *dic2 = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    //            //打印数据
    //            danli.userId = [dic objectForKey:@"id"];
    //            danli.userName = [dic objectForKey:@"name"];
    //            danli.isLogoin = YES;
    
    NSLog(@"key1 is %@------%@",[dic2 valueForKey:@"loginName"],dic2);
    
    [ZYHTTPRequest request:LOGIN_URL([dic2 valueForKey:@"loginName"], [dic2 valueForKey:@"loginPass"]) Completion:^(NSDictionary *dict) {
        
        int stat = [[dict objectForKey:@"code"] intValue];
        if (stat == 200) {
            session *danli = [session getInstance];
            danli.userId = [dict objectForKey:@"userId"];
            danli.isLogoin = YES;
            danli.token = [dict objectForKey:@"token"];
            danli.headerPic = [dict  objectForKey:@"icon"];
            NSLog(@"%@",danli.token);
        }
    }];

    
    MainViewController *first = [[MainViewController alloc]init];
    
    self.mainNavigationController = [[UINavigationController alloc]initWithRootViewController:first];
    
    //nav.navigationBarHidden = YES;
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    self.LeftSlideVC = [[LeftSlideViewController alloc] initWithLeftView:leftVC andMainView:self.mainNavigationController];
    self.window.rootViewController = self.LeftSlideVC;
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    

    [self thirdLogin];
//    [WXApi registerApp:@"wx66b8aa5bd7630c85"];
    
    return YES;
}

/**
 *  第三方登录
 */
- (void)thirdLogin{
    [ShareSDK registerApp:@"iosv1101"
     
          activePlatforms:@[
                            @(SSDKPlatformTypeSinaWeibo),
                            @(SSDKPlatformTypeWechat),
                            @(SSDKPlatformTypeQQ),
                            @(SSDKPlatformTypeSMS)]
    onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                 break;
       
                 break;

             default:
                 break;
         }
     }
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         
         switch (platformType)
         {
             case SSDKPlatformTypeSinaWeibo:
                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                 [appInfo SSDKSetupSinaWeiboByAppKey:@"2121518015"
                                           appSecret:@"e376a8999d9b62b2b12d799467d3f8fb"
                                         redirectUri:@"http://www.hao123.com"
                                            authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:@"wx66b8aa5bd7630c85"
                                       appSecret:@"bf7866dc93891c3c3362365211b5ad6f"];
                 break;
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:@"1105309569"
                                      appKey:@"Y4zQNpApL9FrFwBI"
                                    authType:SSDKAuthTypeBoth];
                 break;


             default:
                 break;
         }
     }];
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


/**
 *  QQ登录
 */
//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
//{
////    return [TencentOAuth HandleOpenURL:url];
////    return [WeiboSDK handleOpenURL:url delegate:self];
//    return [WXApi handleOpenURL:url delegate:self];
//}
//
//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
//{
////    return [TencentOAuth HandleOpenURL:url];
////    return [WeiboSDK handleOpenURL:url delegate:self];
//    return [WXApi handleOpenURL:url delegate:self];
//
//}




@end
