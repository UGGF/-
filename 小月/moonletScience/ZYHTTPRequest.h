//
//  ZYHTTPRequest.h
//  moonletScience
//
//  Created by 苏 on 16/5/18.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYHTTPRequest : NSObject

#pragma  注册账号
+ (void)requestRegister:(NSString *)phoneNum :(NSString *)psw Completion:(void (^) (NSDictionary *dict))block;

+ (void)request:(NSString *)url Completion:(void (^) (NSDictionary *dict))block;

#pragma 上传头像
+(void)postUserImageWith:(NSString *)userId :(NSData *)data  block:(void (^)(NSDictionary *dic,NSError *error))block;

#pragma 上传医师资格证
+(void)postAuthImageWith:(NSString *)token :(NSMutableArray *)dataArray block:(void (^)(NSDictionary *dic,NSError *error))block;

#pragma 更换工作证
+(void)updateAuthImageWith:(NSString *)token :(NSData *)data block:(void (^)(NSDictionary *dic,NSError *error))block;

#pragma 发布话题文章
+(void)createArticleWith:(NSString *)token :(NSString *)url :(NSMutableArray *)dataArray block:(void (^)(NSDictionary *dic,NSError *error))block;
@end
