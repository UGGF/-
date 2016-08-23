//
//  headerImage.m
//  moonletScience
//
//  Created by 苏 on 16/4/2.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "headerImage.h"
#import "JKWImagePost.h"
#import <CommonCrypto/CommonDigest.h>

@interface headerImage ()

@property (weak, nonatomic) IBOutlet UIProgressView *pv;

@end

@implementation headerImage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavBar];
    [self createKit];
    
}

-(void)createKit
{
    self.view.backgroundColor = BGCOLOR;
    
    self.userSex = @"男";
    
    self.headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH / 2 - 65, 130, 130, 130)];
    self.headerImage.image = [UIImage imageNamed:@"touxiang_icon"];
    self.headerImage.layer.cornerRadius = 5;
    self.headerImage.clipsToBounds = YES;
    [self.view addSubview:self.headerImage];
    
    UIButton *headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    headBtn.frame = CGRectMake(WIDTH / 2 - 65, 130, 130, 130);
    headBtn.layer.cornerRadius = 3;
    headBtn.clipsToBounds = YES;
    [headBtn addTarget:self action:@selector(headBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:headBtn];
    
    self.manBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.manBtn.frame = CGRectMake(WIDTH / 2 - 65, 270, 15, 15);
    self.manBtn.selected = YES;
    self.manBtn.backgroundColor = [UIColor whiteColor];
    [self.manBtn setBackgroundImage:[UIImage imageNamed:@"gouzi_icon"] forState:UIControlStateSelected];
    [self.manBtn addTarget:self action:@selector(manBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.manBtn.layer.cornerRadius = 3;
    self.manBtn.clipsToBounds = YES;
    [self.view addSubview:self.manBtn];
    
    UILabel *manLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH  / 2 - 45, 270, 20, 20)];
    manLabel.text = @"男";
    manLabel.font = [UIFont systemFontOfSize:16];
    manLabel.textColor = WHITECOLOR ;
    [self.view addSubview:manLabel];
    
    self.womenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.womenBtn.frame = CGRectMake(WIDTH / 2 - 65 + 90, 270, 15, 15);
    self.womenBtn.selected = NO;
    self.womenBtn.backgroundColor = WHITECOLOR;
    [self.womenBtn setBackgroundImage:[UIImage imageNamed:@"gouzi_icon"] forState:UIControlStateSelected];
    [self.womenBtn addTarget:self action:@selector(womenBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.womenBtn.layer.cornerRadius = 3;
    self.womenBtn.clipsToBounds = YES;
    [self.view addSubview:self.womenBtn];
    
    UILabel *womenLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 45 + 90, 270, 20, 20)];
    womenLabel.text = @"女";
    womenLabel.font = [UIFont systemFontOfSize:16];
    womenLabel.textColor = WHITECOLOR ;
    [self.view addSubview:womenLabel];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(10, 330, WIDTH - 20, 40);
    sureBtn.tag = 1;
    [sureBtn setTitle:@"完成" forState:UIControlStateNormal];
    [sureBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    sureBtn.layer.cornerRadius = 3;
    sureBtn.backgroundColor = GREENCOLOR;
    sureBtn.clipsToBounds = YES;
    [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureBtn];
    
    UIButton *vaultBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    vaultBtn.frame = CGRectMake(WIDTH - 70, 370, 60, 40);
    vaultBtn.tag = 1;
    [vaultBtn setTitle:@"跳过 > > >" forState:UIControlStateNormal];
    vaultBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [vaultBtn setTitleColor:GREENCOLOR forState:UIControlStateNormal];
    vaultBtn.layer.cornerRadius = 3;
    vaultBtn.clipsToBounds = YES;
    [vaultBtn addTarget:self action:@selector(vaultBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:vaultBtn];
    
    
    
}

-(void)headBtnClick
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"上传头像" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:@"从相册选择" otherButtonTitles:@"拍照", nil];
    actionSheet.delegate = self;
    // 显示actionSheet
    actionSheet.tag = 2011;
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
switch (buttonIndex) {
    case 0:{
        NSLog(@"从相册选择");
        
        self.pickerImage = [[UIImagePickerController alloc] init];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            self.pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            //pickerImage.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            self.pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:self.pickerImage.sourceType];
            
        }
        self.pickerImage.delegate = self;
        self.pickerImage.allowsEditing = NO;
        [self presentModalViewController:self.pickerImage animated:YES];
        
        break;
    }
    case 1:{
        NSLog(@"拍照");
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            NSArray *temp_MediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
            
            picker.mediaTypes = temp_MediaTypes;
            
            picker.delegate = self;
            
            picker.allowsImageEditing = YES;
            
        }
        
        [self presentModalViewController:picker animated:YES];
        break;
    }
        
    case 2:{
        NSLog(@"取消");
        break;
    }
    default:
        break;
}
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"选择这张照片了%@",info);
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [self saveImage:image WithName:@"headerImage"];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    NSLog(@"kjmjm----%@",image);
    
    
}

////生成图片名
//-(NSString * )getPicName {
//    /**
//     *	@brief	方式1 由开发者生成saveKey
//     */
//    NSDate *currentDate = [NSDate date];//获取当前时间，日期
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"YYYYMMdd"];
//    NSString *dateString = [dateFormatter stringFromDate:currentDate];
//    NSString *str = [NSString stringWithFormat:@"%@",[[NSDate date] timeIntervalSince1970]];
//    const char *cStr = [str UTF8String];
//    unsigned char result[16];
//    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
//    str =  [NSString stringWithFormat:
//                     @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
//                     result[0], result[1], result[2], result[3],
//                     result[4], result[5], result[6], result[7],
//                     result[8], result[9], result[10], result[11],
//                     result[12], result[13], result[14], result[15]
//                     ];
//    return self.picName;
//    NSString *path = [NSString stringWithFormat:@"/%@/%.0f.jpg",dateString,str];
//    NSLog(@"%@",path);
//    return str;
//}

#pragma mark 保存图片到document
- (void)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName
{
    NSData* imageData = UIImagePNGRepresentation(tempImage);
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex:0];
    // Now we get the full path to the file
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    // and then we write it out
    [imageData writeToFile:fullPathToFile atomically:NO];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:fullPathToFile forKey:@"headerImage"];
    
    NSData * imgData = [JKWImagePost compactImage:tempImage];
    
    
//    //    //上传服务器
//    session * danli = [session getInstance];
//    [ZYHTTPRequest postUserImageWith:danli.userId :imgData block:^(NSDictionary *dic, NSError *error) {
//        NSLog(@"%@",[dic objectForKey:@"message"]);
//        
//    }];
    
    NSLog(@"图片的路径是-----%@",fullPathToFile);
    //    [[HSLoginClass new] uploadAvatar:totalPath];
    
    [UPYUNConfig sharedInstance].DEFAULT_BUCKET = @"seeleep";
    [UPYUNConfig sharedInstance].DEFAULT_PASSCODE = @"BsKBPmxr9VyQM34MUpMH/S5JoEY=";
    __block UpYun *uy = [[UpYun alloc] init];
    uy.successBlocker = ^(NSURLResponse *response, id responseData) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"上传成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        NSString *picPath = [NSString stringWithFormat:@"https://seeleep.b0.upaiyun.com%@",[responseData objectForKey:@"url"]];
        [self.headerImage setImageWithURL:[NSURL URLWithString:picPath]];
        
        NSString *str = [NSString stringWithFormat:@"http://appapi.seeleep.com/X_UserLogic/seeleep/8_Page/?seeleep=1&ModuleId=188&Field_userIcon=%@&Field_userId=%@&Field_sex=%@",picPath,self.userId,self.userSex];
        [ZYHTTPRequest request:str Completion:^(NSDictionary *dict) {
            NSLog(@"%@",dict);
        }];
        NSLog(@"response body %@", responseData);
    };
    uy.failBlocker = ^(NSError * error) {
        NSString *message = [error.userInfo objectForKey:@"message"];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"message" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        NSLog(@"error %@", message);
    };
    uy.progressBlocker = ^(CGFloat percent, int64_t requestDidSendBytes) {
        [_pv setProgress:percent];
    };
    
    //    uy.uploadMethod = UPMutUPload; 分块
    //    如果 policy 由服务端生成, 只需要 return policy
        uy.policyBlocker = ^()
    {// Create NSData object
        
        NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
        NSTimeInterval a=[dat timeIntervalSince1970]*1000;
        NSString *timeString = [NSString stringWithFormat:@"%f", a];//转为字符型
        
        NSData *nsdata = [[NSString stringWithFormat:@"{\"bucket\":\"seeleep\",\"expiration\":%@,\"save-key\":\"%@\"}",timeString,[self getSaveKey]]
                          dataUsingEncoding:NSUTF8StringEncoding];
        
        // Get NSString from NSData object in Base64
        self.base64Decoded = [nsdata base64EncodedStringWithOptions:0];
        
        
        NSLog(@"Decoded: %@", self.base64Decoded);
            
//          NSString * str = [Base64codeFunc textFromBase64String:@"{\"bucket\":\"seeleep\",\"expiration\":1409200758,\"save-key\":\"/img.jpg\"}"];
            return self.base64Decoded;
        };
//    //    如果 sinature 由服务端生成, 服务端只需要将 policy 和 密钥 拼接之后进行 MD5, 否则就不用初始化signatureBlocker
        uy.signatureBlocker = ^(NSString *policy)
        {
            NSString *str = [NSString stringWithFormat:@"%@&BsKBPmxr9VyQM34MUpMH/S5JoEY=",self.base64Decoded];
            
            const char *cStr = [str UTF8String];
            unsigned char result[16];
            CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
            self.picName =  [NSString stringWithFormat:
                    @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                    result[0], result[1], result[2], result[3],
                    result[4], result[5], result[6], result[7],
                    result[8], result[9], result[10], result[11],
                    result[12], result[13], result[14], result[15]
                    ];
            NSLog(@"%@",self.picName);
            return self.picName;
        };

    [uy uploadFile:imgData saveKey:[self getSaveKey]];
}

-(NSString *)getSaveKey
{
    NSString *saveKey = @"/uploads/{year}{mon}{day}/{filemd5}{.suffix}";
    return saveKey;
}

#pragma mark 从文档目录下获取Documents路径
- (NSString *)documentFolderPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}


-(void)vaultBtnClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)sureBtnClick
{
    NSLog(@"修改个人信息了");
}

-(void)manBtnClick:(UIButton *)sender
{
    self.womenBtn.selected = sender.selected;
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.userSex = @"男";
    }else
    {
        self.userSex = @"女";
    }
}

-(void)womenBtnClick:(UIButton *)sender
{
    self.manBtn.selected = sender.selected;
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.userSex = @"女";
    }else
    {
        self.userSex = @"男";
    }
}

-(void)createNavBar
{
#pragma mark - 修改状态栏的简便方法
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 20)];
    
    statusBarView.backgroundColor=[UIColor clearColor];
    
    [self.view addSubview:statusBarView];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    UIImageView *navBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 50)];
    navBar.userInteractionEnabled = YES;
    navBar.image = [UIImage imageNamed:@"navbg.png"];
    [self.view addSubview:navBar];
    navBar.backgroundColor = [UIColor clearColor];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"上传头像";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont systemFontOfSize:18];
    title.textAlignment = NSTextAlignmentCenter;
    [navBar addSubview:title];
    
    UIButton *fanHuiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fanHuiBtn setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
    fanHuiBtn.frame = CGRectMake(0, 0, 100, 50);
    [fanHuiBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 60)];
    [fanHuiBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:fanHuiBtn];
    
}

-(void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
