//
//  headerImage.m
//  moonletScience
//
//  Created by 苏 on 16/4/2.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "headerImage.h"
#import "JKWImagePost.h"

@interface headerImage ()

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
    self.headerImage.image = image;
    
}

#pragma mark -压缩图片
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    
    NSLog(@"没掉过， ");
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

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
}

-(void)womenBtnClick:(UIButton *)sender
{
    self.manBtn.selected = sender.selected;
    sender.selected = !sender.selected;
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
