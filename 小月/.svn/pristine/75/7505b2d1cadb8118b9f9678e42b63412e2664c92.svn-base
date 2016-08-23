//
//  ZYHTTPRequest.m
//  moonletScience
//
//  Created by 苏 on 16/5/18.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "ZYHTTPRequest.h"

@implementation ZYHTTPRequest


#pragma  注册账号
+ (void)requestRegister:(NSString *)phoneNum :(NSString *)psw Completion:(void (^) (NSDictionary *dict))block
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSLog(@"%@",REGISTER_URL(phoneNum, psw));
    NSString *string = [REGISTER_URL(phoneNum, psw) stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager GET:string parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        
        // NSLog(@"dictionary=%@",dictionary);
        NSString* error = [dictionary objectForKey:@"error"];
        if (!error) {
            if (block) {
                block(dictionary);
            }
        } else {
            ALERTVIEW(error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"-------%@",error);
    }];
}

+ (void)request:(NSString *)url Completion:(void (^) (NSDictionary *dict))block
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSLog(@"%@",url);
    NSString *string = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",url);
    [manager GET:string parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        
        // NSLog(@"dictionary=%@",dictionary);
        NSString* error = [dictionary objectForKey:@"error"];
        if (!error) {
            if (block) {
                block(dictionary);
            }
        } else {
            ALERTVIEW(error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"-------%@",error);
    }];
}

#pragma 上传头像
+(void)postUserImageWith:(NSString *)userId :(NSData *)data block:(void (^)(NSDictionary *dic,NSError *error))block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    requestSerializer.timeoutInterval = 20;
    manager.requestSerializer = requestSerializer;
    
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = responseSerializer;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyymmddhhmmss";
    NSString *fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
    
    
    
    [manager POST:updateHeaderImage
       parameters:nil
constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
    
    [formData appendPartWithFileData :data
                                 name:@"data"
                             fileName:fileName
                             mimeType:@"image/jpeg"];//@"image/jpeg"
    
}success:^(AFHTTPRequestOperation *operation,id responseObject){
    NSData *returnedData = responseObject;
     NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    NSError* error = [dictionary objectForKey:@"error"];
    NSLog(@"%@",dictionary);
    if (block) {
        block(dictionary,error);
    }
    if (returnedData&&returnedData.length>0) {
        
    }
}failure:^(AFHTTPRequestOperation *operation,NSError *error){
    NSLog(@"Req Error——>%@",error.localizedDescription);
    
}];
}

#pragma 上传医师资格证
+(void)postAuthImageWith:(NSString *)token :(NSMutableArray *)dataArray block:(void (^)(NSDictionary *dic,NSError *error))block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    requestSerializer.timeoutInterval = 20;
    manager.requestSerializer = requestSerializer;
    
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = responseSerializer;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyymmddhhmmss";
    NSString *fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
    
    [manager POST:USERAUTH_CREATE
       parameters:@{@"token" : token}
constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
    
    [formData appendPartWithFileData :[dataArray objectAtIndex:0]
                                 name:@"aegerPic0"
                             fileName:fileName
                             mimeType:@"image/png"];//@"image/jpeg"
    [formData appendPartWithFileData :[dataArray objectAtIndex:1]
                                 name:@"aegerPic1"
                             fileName:fileName
                             mimeType:@"image/png"];
    [formData appendPartWithFileData :[dataArray objectAtIndex:2]
                                 name:@"jobPic"
                             fileName:fileName
                             mimeType:@"image/png"];
    
}success:^(AFHTTPRequestOperation *operation,id responseObject){
    NSData *returnedData = responseObject;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    NSError* error = [dictionary objectForKey:@"error"];
    NSLog(@"%@",dictionary);
    if (block) {
        block(dictionary,error);
    }
    if (returnedData&&returnedData.length>0) {
        
    }
}failure:^(AFHTTPRequestOperation *operation,NSError *error){
    NSLog(@"Req Error——>%@",error.localizedDescription);
}];
}

#pragma 更换工作证
+(void)updateAuthImageWith:(NSString *)token :(NSData *)data block:(void (^)(NSDictionary *dic,NSError *error))block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    requestSerializer.timeoutInterval = 20;
    manager.requestSerializer = requestSerializer;
    
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = responseSerializer;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyymmddhhmmss";
    NSString *fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
    
    
    
    [manager POST:UPDATE_USERAUTH
       parameters:@{@"token" : token}
constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
    
    [formData appendPartWithFileData :data
                                 name:@"jobPic"
                             fileName:fileName
                             mimeType:@"image/png"];//@"image/jpeg"
}success:^(AFHTTPRequestOperation *operation,id responseObject){
    NSData *returnedData = responseObject;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    NSError* error = [dictionary objectForKey:@"error"];
    NSLog(@"%@",dictionary);
    if (block) {
        block(dictionary,error);
    }
    if (returnedData&&returnedData.length>0) {
        
    }
}failure:^(AFHTTPRequestOperation *operation,NSError *error){
    NSLog(@"Req Error——>%@",error.localizedDescription);
}];
}

#pragma 发布话题文章
+(void)createArticleWith:(NSString *)token :(NSString *)url :(NSMutableArray *)dataArray block:(void (^)(NSDictionary *dic,NSError *error))block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    requestSerializer.timeoutInterval = 20;
    manager.requestSerializer = requestSerializer;
    
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = responseSerializer;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyymmddhhmmss";
    NSString *fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
    
    
    NSString *str = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager POST:str
       parameters:@{@"token" : token}
constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
    for (int i = 0; i < dataArray.count; i++) {
        [formData appendPartWithFileData :[dataArray objectAtIndex:i]
                                     name:[NSString stringWithFormat:@"img%d",i]
                                 fileName:fileName
                                 mimeType:@"image/png"];//@"image/jpeg"
    }
    
    
}success:^(AFHTTPRequestOperation *operation,id responseObject){
    NSData *returnedData = responseObject;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    NSError* error = [dictionary objectForKey:@"error"];
    NSLog(@"%@",dictionary);
    if (block) {
        block(dictionary,error);
    }
    if (returnedData&&returnedData.length>0) {
        
    }
}failure:^(AFHTTPRequestOperation *operation,NSError *error){
    NSLog(@"Req Error——>%@",error.localizedDescription);
}];

}


@end
