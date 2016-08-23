//
//  JKWImagePost.h
//  JKWProject
//
//  Created by jsmysoft on 15/8/14.
//  Copyright (c) 2015年 kamto. All rights reserved.
//

/**
  图片上传
  网络请求类是AFNetWorking
  还有系统方法
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "MBProgressHUD.h"
#import "AFNetworking.h"
typedef void (^PostSuccessBlock)(NSString *str);

@interface JKWImagePost : NSObject<NSURLConnectionDelegate>
/**
 静态方法中self 不是JKWImagePost实例，不能访问JKWImagePost的属性
 
 *成功返回调用block 在另一个页面比如view will appear等等 中调用此block
   [JKWImagePost shared].postBlock = ^(NSString * str){
   //返回
   [self.navigationController popViewControllerAnimated:YES];
   //push前的页面刷新数据
   [self.myTableView reload];
 };

 *
 */


@property (nonatomic,strong)PostSuccessBlock postBlock;
/**
 *单例模式
 *静态方法中self 不是JKWImagePost实例，不能访问JKWImagePost的属性
 *
 */

+(JKWImagePost *)shared;

/*
 AFNetworking

*
*/
//压缩图片
+(NSData *)compactImage:(UIImage *)image;
/**
 *单张图片上传  base64
 *urlStr:获取数据的url地址
 *parameters: 上传的参数

 *
 */
-(void)imagePost:(UIImage *)image  WithUrl:(NSString *)url imageParameter:(NSString *)imageparameter parameters:(NSMutableDictionary *)parameters success:(void (^)(id responseObject))success fail:(void (^)())fail;

/**
 *多张图片上传   字节流
 *urlStr:获取数据的url地址
 *parameters: 上传的参数
 *
 */
-(void)severalImagesPost:(NSArray *)imageArr  WithUrl:(NSString *)url  parameters:(NSMutableDictionary *)parameters success:(void (^)(id responseObject))success fail:(void (^)())fail;

/*
 NSURLConnectionDelegate base64码
 *image 要上传的图片
 *imageparameter 图片参数名
 *parameters 其他参数
 */
- (void)PostImage:(UIImage *)image  WithUrl:(NSString *)url imageParameter:(NSString *)imageparameter parameters:(NSMutableDictionary *)parameters;


@end
