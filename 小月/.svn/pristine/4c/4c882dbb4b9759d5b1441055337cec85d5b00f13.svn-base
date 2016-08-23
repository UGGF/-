//
//  AmExpertViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/12.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "AmExpertViewController.h"
#import "JKWImagePost.h"

@interface AmExpertViewController ()<UIActionSheetDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIView *_bgView;
    NSString *filePath;
}
@property(nonatomic,strong)UIAlertController *myActionSheet;
@end

@implementation AmExpertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self creatTextLable];
    [self creatUnitLable];
    [self creatRemoveLable];
    [self findByToken];
}

-(void)findByToken
{
    session *danLi = [session getInstance];
    [ZYHTTPRequest request:findByToken(danLi.token) Completion:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        if ([[dict objectForKey:@"code"] intValue] == 200) {
            NSArray *jobArray = [[[dict objectForKey:@"userAuth"] objectForKey:@"aegerPic"] componentsSeparatedByString:@","];
            [self.jobImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,[jobArray objectAtIndex:0]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
            [self.jobImageViews setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,[jobArray objectAtIndex:1]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
            [self.adressImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@media/show?id=%@",LOCALHOST,[[dict objectForKey:@"userAuth"] objectForKey:@"jobPic"]]] placeholderImage:[UIImage imageNamed:@"touxiang_yuan"]];
        }
    }];
}


-(void)createNavBar
{
#pragma mark - 修改状态栏的简便方法  
    //状态栏设置
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 20)];
    statusBarView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:statusBarView];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //导航栏图片
    UIImageView *navBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 50)];
    navBar.userInteractionEnabled = YES;
    //navBar.image = [UIImage imageNamed:@"navbg.png"];
    navBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navBar];
    
    //导航栏字体
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"单位";
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
    [navBar addSubview:saveBtn];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 49, WIDTH, 1)];
    lineView.backgroundColor = LINECOLOR;
    [navBar addSubview:lineView];
    
}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)creatTextLable{
    self.topBgView = [[UIView alloc]initWithFrame:CGRectMake(20, 110, WIDTH-40, 100)];
    self.topBgView.layer.borderColor = TEXTTINTCOLOR.CGColor;
    self.topBgView.layer.borderWidth = 1;
    self.topBgView.layer.cornerRadius = 3;
    self.topBgView.layer.masksToBounds =YES;
    [self.view addSubview:self.topBgView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 90, 230, 10)];
    lab.text = @"医师资格证";
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:lab];
    
    self.jobImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10  , 10, 80, 80)];
    [self.topBgView addSubview:self.jobImageView];
    
    self.jobImageViews = [[UIImageView alloc]initWithFrame:CGRectMake(10 + 90  , 10, 80, 80)];
    [self.topBgView addSubview:self.jobImageViews];

}



- (void)creatUnitLable{
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(20, 250, WIDTH-40, 100)];
    self.bgView.layer.borderColor = TEXTTINTCOLOR.CGColor;
    self.bgView.layer.borderWidth = 1;
    self.bgView.layer.cornerRadius = 3;
    self.bgView.layer.masksToBounds =YES;
    [self.view addSubview:self.bgView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 230, 230, 10)];
    lab.text = @"单位工作证";
    lab.textColor = TEXTCOLOR;
    lab.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:lab];
    
    UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    changeBtn.frame = CGRectMake(WIDTH-50 - 120, 20, 80, 40);
    changeBtn.backgroundColor = BGCOLOR;
    [changeBtn setTitle:@"更换" forState:UIControlStateNormal];
    changeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [changeBtn setTintColor:WHITECOLOR];
    changeBtn.layer.cornerRadius = 3;
    changeBtn.clipsToBounds = YES;
    [changeBtn addTarget:self action:@selector(changeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:changeBtn];
    
    UILabel *updateLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH - 50 - 160, 70, 160, 10)];
    updateLab.text = @"(换单位后请更新单位工作证)";
    updateLab.textColor = TEXTTINTCOLOR;
    updateLab.font = [UIFont systemFontOfSize:12];
    [self.bgView addSubview:updateLab];
    
    self.adressImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10  , 10, 80, 80)];
    [self.bgView addSubview:self.adressImageView];
}

- (void)changeBtnClick{
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
        
        //创建一个选择后图片的小图标放在下方,类似微薄选择图后的效果
        [self.adressImageView setImage:image];
         NSData * imgData = [JKWImagePost compactImage:image];
        session *danLi = [session getInstance];
        [ZYHTTPRequest updateAuthImageWith:danLi.token :imgData block:^(NSDictionary *dic, NSError *error) {
            NSLog(@"%@",dic);
            if ([[dic objectForKey:@"code"] intValue] == 200) {
                [self.navigationController popViewControllerAnimated:YES];
            }else
            {
                ALERTVIEW(@"发生未知错误,请重试!")
            }

        }];
        
    }
}

- (void)creatRemoveLable{
    UIButton *remBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    remBtn.frame = CGRectMake(20, 390, WIDTH-40, 40);
    remBtn.backgroundColor = RGBCOLOR(85, 95, 100);
    [remBtn setTitle:@"解除认证" forState:UIControlStateNormal];
    [remBtn setTintColor:WHITECOLOR];
    remBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [remBtn addTarget:self action:@selector(remBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:remBtn];

}
- (void)remBtnClick{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"解除认证后将不再享有专家权利\n每人仅可解除认证5次\n是否确定解除认证?" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        session *danLi = [session getInstance];
        [ZYHTTPRequest request:DELETE_USERAUTH(danLi.token) Completion:^(NSDictionary *dict) {
            NSLog(@"%@",dict);
        }];
        //
        
    }]];
    [self presentViewController:alert animated:true completion:nil];
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
