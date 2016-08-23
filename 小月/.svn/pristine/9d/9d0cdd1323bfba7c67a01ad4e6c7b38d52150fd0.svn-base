//
//  JKWImagePost.m
//  JKWProject
//
//  Created by jsmysoft on 15/8/14.
//  Copyright (c) 2015年 kamto. All rights reserved.
//

#import "JKWImagePost.h"

@implementation JKWImagePost

+ (JKWImagePost *)shared{
    static JKWImagePost *imagePost = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        imagePost = [[self alloc]init];
    });
    return imagePost;
}
/*图片压缩*/
static float scale = 1.0;
+(NSData *)compactImage:(UIImage *)image
{
    NSData * resultData= nil;
    NSData * data = UIImageJPEGRepresentation(image, scale);
    resultData = data;
    while (resultData.length > 1024 * 100 && scale > 0.1) {
        scale -= 0.05;
        UIImage * newImage = [UIImage imageWithData:data];
        NSData * newData = UIImageJPEGRepresentation(newImage, scale);
        resultData = newData;
    }
    
    return resultData;
}

#pragma mark  单张图片上传 base64码
-(void)imagePost:(UIImage *)image  WithUrl:(NSString *)url  imageParameter:(NSString *)imageparameter parameters:(NSMutableDictionary *)parameters success:(void (^)(id))success fail:(void (^)())fail
{
    
    //转为base64
    NSString *baseString;
    if (image != nil) {
        NSData *imageData = [JKWImagePost compactImage:image];
       baseString = [imageData base64EncodedStringWithOptions:0];
       
        
    }
    //parameters = [NSMutableDictionary dictionary];
    //调用方法前就初始化并添加其他参数
    
    parameters[imageparameter] = baseString;
    
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    
    [manger POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
        self.postBlock(@"success");
        
        if (success) {
            success(responseObject);
            NSLog(@"success");
        }

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        if (fail) {
            fail();
        }
    }];
    
    
    
        
    
}

#pragma mark 上传多张图片
-(void)severalImagesPost:(NSArray *)imageArr WithUrl:(NSString *)url parameters:(NSMutableDictionary *)parameters success:(void (^)(id))success fail:(void (^)())fail
{
    
    //parameters = [NSMutableDictionary dictionary];
    //调用方法前就初始化并添加其他参数
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    
    [manger POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        for (int i = 0; i < imageArr.count; i++) {
            
            NSData *imageData = UIImageJPEGRepresentation(imageArr[i], 0.2);
            //参数名
            NSString *name = [NSString stringWithFormat:@"image%d",i];
            //fileName
            NSString *imageName = [NSString stringWithFormat:@"%@.jpg",name];
            
            [formData appendPartWithFileData:imageData name:@"images" fileName:imageName mimeType:@"image/png"];
        }
        

        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        //成功后回调block 
        self.postBlock(@"success");
        
    
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"错误: %@",error.localizedDescription);
    }];
    
}

#pragma mark 系统方法上传
- (void)PostImage:(UIImage *)image  WithUrl:(NSString *)url imageParameter:(NSString *)imageparameter parameters:(NSMutableDictionary *)parameters
{
    
    NSString *baseString;
       
    NSData * imagedata = [JKWImagePost compactImage:image];
    NSString *strBase64 = [imagedata base64EncodedStringWithOptions:0];
    baseString = (__bridge NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                   (CFStringRef)strBase64,
                                                                                   NULL,
                                                                                   CFSTR(":/?#[]@!$&’()*+,;="),
                                                                                   kCFStringEncodingUTF8);
   
    
    //parameters 参数字典在调用这个方法前初始化
    NSMutableString *string = [[NSMutableString alloc]init];
    NSArray *array = [parameters allKeys];
    for (int i = 0; i < array.count; i ++) {
        if (i == 0) {
            [string appendString:@"?"];
            [string appendFormat:@"%@=%@",array[i],parameters[array[i]]];
        }
        else{
            [string appendString:@"&"];
            [string appendFormat:@"%@=%@",array[i],parameters[array[i]]];
            
        }
    }
    [string appendString:@"&"];
    [string appendFormat:@"%@=%@",imageparameter,baseString];
   // NSLog(@"传入的参数字符串：%@",string);
    
    
    
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    [request setHTTPMethod:@"POST"];
    
    
    [request setHTTPBody:data];
    
    
    [NSURLConnection connectionWithRequest:request delegate:self];

}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
     NSLog(@"上传中");
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
     NSLog(@"上传完成");
    self.postBlock(@"success");

    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"上传失败");
}

@end
