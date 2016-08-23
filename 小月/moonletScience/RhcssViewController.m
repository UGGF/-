//
//  RhcssViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/12.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "RhcssViewController.h"
#import "JKWImagePost.h"

@interface RhcssViewController ()<UIActionSheetDelegate,UIGestureRecognizerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIView *_bgView;
    UIView *_statusView;
    UIView *_workView;
    NSString *filePath;
    NSString *_signStr;
}

@property (weak, nonatomic) IBOutlet UIProgressView *pv;
@property(nonatomic,strong)UIAlertController *myActionSheet;
@property(nonatomic,strong)NSMutableArray *imageArr;
@property(nonatomic,strong)NSMutableArray *imageViewArr;
@end

@implementation RhcssViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    self.imageArr = [NSMutableArray array];
    self.imageViewArr = [NSMutableArray array];
    self.jobArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.companyArray = [[NSMutableArray alloc]initWithCapacity:0];
    [self createNavBar];
    [self creatTextLable];
    [self creatUnitLable];
    [self creatTemplate];
    
}




//** 下面状态栏修改的进阶版 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


-(void)createNavBar
{
#pragma mark - 修改状态栏的简便方法 
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 20)];
    
    statusBarView.backgroundColor=[UIColor blackColor];
    
    [self.view addSubview:statusBarView];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    //导航栏图片
    UIImageView *navBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 50)];
    navBar.userInteractionEnabled = YES;
    //navBar.image = [UIImage imageNamed:@"navbg.png"];
    navBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navBar];
    
    //导航栏字体
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"专家认证";
    title.textColor = TEXTCOLOR;
    title.font = [UIFont systemFontOfSize:18];
    title.textAlignment = NSTextAlignmentCenter;
    [navBar addSubview:title];
    
    //导航返回键
    UIButton *fanHuiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fanHuiBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    fanHuiBtn.frame = CGRectMake(0, 0, 100, 50);
    [fanHuiBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 60)];
    [fanHuiBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    //fanHuiBtn.backgroundColor = [UIColor blackColor];
    [navBar addSubview:fanHuiBtn];
    
    //保存按钮
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(WIDTH-50, 15, 40, 20);
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    saveBtn.clipsToBounds = YES;
    [saveBtn addTarget:self action:@selector(saveJobBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:saveBtn];
    
}

-(void)saveJobBtnClick
{
    
    session *danli = [session getInstance];
    if (self.jobArray.count == 2 && self.companyArray.count == 1) {
        NSMutableArray *resourceArray = [[NSMutableArray alloc]initWithCapacity:0];
        [resourceArray addObjectsFromArray:self.jobArray];
        [resourceArray addObjectsFromArray:self.companyArray];
        [ZYHTTPRequest postAuthImageWith:danli.token :resourceArray block:^(NSDictionary *dic, NSError *error) {
            NSLog(@"%@",dic);
            if ([[dic objectForKey:@"code"] intValue] == 200) {
            }
        }];
    }
    

}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)creatTextLable{
     _statusView = [[UIView alloc]initWithFrame:CGRectMake(20, 90, WIDTH-40, 120)];
     _statusView.layer.borderColor = TEXTTINTCOLOR.CGColor;
     _statusView.layer.borderWidth = 1;
     _statusView.layer.cornerRadius = 3;
     _statusView.layer.masksToBounds =YES;
     [self.view addSubview:_statusView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 230, 10)];
    lab.text = @"请上传执业医师资格证书照片(仅限两张)";
    lab.textColor = TEXTTINTCOLOR;
    lab.font = [UIFont systemFontOfSize:12];
    [_statusView addSubview:lab];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 40, 64, 64);
    btn.adjustsImageWhenHighlighted = NO;
    btn.tag = 1111;
    [btn setBackgroundImage:[UIImage imageNamed:@"gengduo_icon.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.clipsToBounds = YES;
    [_statusView addSubview:btn];
}



- (void)btnClick:(UIButton *)sender{
    _signStr = [NSString stringWithFormat:@"%ld",sender.tag];
    _myActionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    /** 点击相机和相册按钮的点击事件 */
     [_myActionSheet addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
     
     [self takePhoto];
     
     }]];
    [_myActionSheet addAction:[UIAlertAction actionWithTitle:@"从手机相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
     
     [self LocalPhoto];
     
     }]];
     
     [_myActionSheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]]; [self presentViewController:_myActionSheet animated:YES completion:nil];
}
     /** 调用相机方法 */
- (void)takePhoto{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.allowsEditing = YES;
    /** 设置拍照后的图片可被编辑 */
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
    }else{
        NSLog(@"模拟机无法打开照相机,请在真机使用");
    }
}
     
     //打开本地相册
- (void)LocalPhoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil]; }
     
     /** 当选择一张照片后进入这里 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        //先把图片转成NSData
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *data;
        if (UIImagePNGRepresentation(image) == nil) {
            data = UIImageJPEGRepresentation(image, 1.0);
        } else {
            data = UIImagePNGRepresentation(image);
        }
     
     //图片保存的路径
     //这里将图片放在沙盒的documents文件夹中
     NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
     
     //文件管理器
     NSFileManager *fileManager = [NSFileManager defaultManager];
     
     //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
     [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
     [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
     
     //得到选择后沙盒中图片的完整路径
     filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
     
     //关闭相册界面
     [picker dismissViewControllerAnimated:YES completion:nil];
        
     [self.imageArr addObject:image];
    //创建一个选择后图片的小图标放在下方,类似微薄选择图后的效果
        
      
        NSData * imgData = [JKWImagePost compactImage:image];
        
        
        //    //    //上传服务器
        //    session * danli = [session getInstance];
        //    [ZYHTTPRequest postUserImageWith:danli.userId :imgData block:^(NSDictionary *dic, NSError *error) {
        //        NSLog(@"%@",[dic objectForKey:@"message"]);
        //
        //    }];
        
        //    [[HSLoginClass new] uploadAvatar:totalPath];
        
        
      
        if ([_signStr isEqualToString:@"1111"]) {
            if (_imageArr.count < 3) {
                
                
                        
                        UIImageView *smallView = [[UIImageView alloc]initWithFrame:CGRectMake(10+74*_imageArr.count, 40, 64, 64)];
                        [self.imageViewArr addObject:smallView];
                        
                        UIImageView *sun = _imageViewArr[_imageArr.count-1];
                        [sun setImage:image];
                        [_statusView addSubview:sun];
                        
                        UIButton *imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                        imageBtn.frame = CGRectMake(10 + 74 * self.imageArr.count, 40, 64, 64);
                        imageBtn.tag = 74 + self.imageArr.count;
                NSLog(@"%d",imageBtn.tag);
                        [imageBtn addTarget:self action:@selector(imageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                        [_statusView addSubview:imageBtn];
                [self.jobArray addObject:imgData];
                
            }else{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"一次最多只能上传二张!" preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
                [self presentViewController:alert animated:YES completion:nil];
            }
        }else if([_signStr isEqualToString:@"2222"]){
            
            
                    
                    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(10+74, 40, 64, 64)];
                    [view setImage:image];
                    [self.companyArray addObject:imgData];
                    view.tag = 1023;
                    [_workView addSubview:view];
                    
                    UIButton *imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                    imageBtn.frame = CGRectMake(10 + 74, 40, 64, 64);
                    imageBtn.tag = 1025;
                    [imageBtn addTarget:self action:@selector(imageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                    [_workView addSubview:imageBtn];
            
        }
    }
}

-(NSString *)getSaveKey
{
    NSString *saveKey = @"/uploads/{year}{mon}{day}/{filemd5}{.suffix}";
    return saveKey;
}



-(void)imageBtnClick:(UIButton *)sender
{
    NSLog(@"%d",sender.tag);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"您确定要删除该照片吗?" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        switch (sender.tag - 74) {
            case 1:
            {
                UIImageView *imageView = [self.imageViewArr objectAtIndex:0];
                [imageView removeFromSuperview];
                
                if (self.imageViewArr.count == 2) {
                    UIImageView *photoView = [self.imageViewArr objectAtIndex:1];
                    photoView.frame = CGRectMake(10 + 74, 40, 64, 64);
                    
                    UIButton *cancelBtn = [_statusView viewWithTag:76];
                    [cancelBtn removeFromSuperview];
                    
                }else
                {
                    [sender removeFromSuperview];
                }
                [self.jobArray removeObjectAtIndex:0];
                [self.imageViewArr removeObjectAtIndex:0];
                [self.imageArr removeObjectAtIndex:0];
                
                  break;
                
            }case 2:
            {
                
                UIImageView *imageView = [self.imageViewArr objectAtIndex:1];
                [imageView removeFromSuperview];
                [sender removeFromSuperview];
                [self.imageViewArr removeObjectAtIndex:1];
                [self.imageArr removeObjectAtIndex:1];
                [self.jobArray removeObjectAtIndex:1];
                break;
            }
                
            default:
                break;
        }
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)cancelImageBtnClick:(UIButton *)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"您确定要删除该照片吗?" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                UIImageView *imageView = [_workView viewWithTag:1023];
                [imageView removeFromSuperview];
                [sender removeFromSuperview];
                }]];
    [self.companyArray removeObjectAtIndex:0];
    [self presentViewController:alert animated:YES completion:nil];
}




- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"您取消了选择图片");
    [picker dismissViewControllerAnimated:YES completion:nil];
}
     
- (void)sendInfo {
    NSLog(@"图片的路径是：%@", filePath);
//    NSLog(@"您输入框中的内容是：%@", inputView.text);
}

- (void)creatUnitLable{
    _workView = [[UIView alloc]initWithFrame:CGRectMake(20, 215, WIDTH-40, 120)];
    _workView.layer.borderColor = TEXTTINTCOLOR.CGColor;
    _workView.layer.borderWidth = 1;
    _workView.layer.cornerRadius = 3;
    _workView.layer.masksToBounds =YES;
    [self.view addSubview:_workView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 230, 10)];
    lab.text = @"请上传单位工作证照片(仅限一张)";
    lab.textColor = TEXTTINTCOLOR;
    lab.font = [UIFont systemFontOfSize:12];
    [_workView addSubview:lab];
    
    UIButton *btnM = [UIButton buttonWithType:UIButtonTypeCustom];
    btnM.frame = CGRectMake(10, 40, 64, 64);
    btnM.adjustsImageWhenHighlighted = NO;
    btnM.tag = 2222;
    [btnM setBackgroundImage:[UIImage imageNamed:@"gengduo_icon.png"] forState:UIControlStateNormal];
    [btnM addTarget:self action:@selector(btnMClick:) forControlEvents:UIControlEventTouchUpInside];
    btnM.clipsToBounds = YES;
    [_workView addSubview:btnM];
}

- (void)btnMClick:(UIButton *)sender{
    _signStr = [NSString stringWithFormat:@"%ld",sender.tag];
    _myActionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    /** 点击相机和相册按钮的点击事件 */
    [_myActionSheet addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self takePhoto];
        
    }]];
    [_myActionSheet addAction:[UIAlertAction actionWithTitle:@"从手机相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self LocalPhoto];
        
    }]];
    
    [_myActionSheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]]; [self presentViewController:_myActionSheet animated:YES completion:nil];
}

- (void)creatTemplate{
    UILabel *tempLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 345, 80, 10)];
    tempLab.text = @"范本示例";
    tempLab.textColor = TEXTTINTCOLOR;
    tempLab.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:tempLab];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(20, 360, WIDTH-40, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    NSArray *_arr = @[@"doctor_id1.png",@"doctor_id2.png",@"hospital_id.png"];
    for (int i = 0; i < 3; i++) {
        UIButton *btnT = [UIButton buttonWithType:UIButtonTypeCustom];
        btnT.frame = CGRectMake(20+(5+90)*i, 375, 90, 63);
        [btnT setBackgroundImage:[UIImage imageNamed:_arr[i]] forState:UIControlStateNormal];
        btnT.layer.cornerRadius = 3;
        btnT.tag = 2015+i;
        btnT.clipsToBounds = YES;
        [btnT addTarget:self action:@selector(btnTClick:) forControlEvents:UIControlEventTouchUpInside];
        btnT.adjustsImageWhenHighlighted = NO;
        [self.view addSubview:btnT];
    }
}

- (void)btnTClick:(UIButton *)btnT{
    _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    _bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    [self.view addSubview:_bgView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    tap.numberOfTouchesRequired =1;
    tap.numberOfTapsRequired = 1;
    tap.delegate = self;
    
    [_bgView addGestureRecognizer:tap];
    
    switch (btnT.tag) {
        case 2015:
        {
            UIButton *appBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            appBtn.frame = CGRectMake(0, WIDTH/2, WIDTH, HEIGHT/3);
            appBtn.adjustsImageWhenHighlighted = NO;
            [appBtn setBackgroundImage:[UIImage imageNamed:@"doctor_id_view1.png"] forState:UIControlStateNormal];
            [_bgView addSubview:appBtn];
            
        }
            break;
        case 2016:
        {
            UIButton *appBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
            appBtn1.frame = CGRectMake(0, WIDTH/2, WIDTH, HEIGHT/3);
            appBtn1.adjustsImageWhenHighlighted = NO;
            [appBtn1 setBackgroundImage:[UIImage imageNamed:@"doctor_id_view2.png"] forState:UIControlStateNormal];
            [_bgView addSubview:appBtn1];
            
        }
            break;
        case 2017:
        {
            UIButton *appBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
            appBtn2.frame = CGRectMake(0, WIDTH/2, WIDTH, HEIGHT/3);
            appBtn2.adjustsImageWhenHighlighted = NO;
            [appBtn2 setBackgroundImage:[UIImage imageNamed:@"hospital_id_view.png"] forState:UIControlStateNormal];
            [_bgView addSubview:appBtn2];
            
        }
            break;
    }

//    UIButton *appBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    appBtn.frame = CGRectMake(0, WIDTH/2, 322, 222);
//    appBtn.adjustsImageWhenHighlighted = NO;
//    [appBtn setBackgroundImage:[UIImage imageNamed:@"zhigezhen1_b.png"] forState:UIControlStateNormal];
//    [_bgView addSubview:appBtn];
//    [appBtn addGestureRecognizer:tap];
//    [bgView removeFromSuperview];
}

- (void)tapClick:(UITapGestureRecognizer *)sender{
    if (sender.numberOfTapsRequired == 1) {
        [_bgView removeFromSuperview];
    }
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
