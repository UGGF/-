//
//  PersonDataViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/11.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "PersonDataViewController.h"
#import "BaseDataTableViewCell.h"
#import "SignatureViewController.h"
#import "NameViewController.h"
#import "TradeViewController.h"
#import "UnitViewController.h"
#import "PostViewController.h"
#import "AdressViewController.h"
#import "RhcssViewController.h"
#import "CheckViewController.h"
#import "AmExpertViewController.h"


@interface PersonDataViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIView *_backView;
    UITableView *_tableView;
    NSArray *_array;
    NSString *filePath;
    UIButton *imaBtn;
  
}
@end

@implementation PersonDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavBar];
    [self creatDataView];
    _array = @[@"昵称",@"手机",@"性别",@"年龄",@"身份",@"行业",@"单位",@"职务",@"地址"];
    [self creatDataTableView];
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
    title.text = @"个人资料";
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
    
}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 头像视图
- (void)creatDataView{
   _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT-70)];
    _backView.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:_backView];
    
    //头像视图
    UIView *firstView = [[UIView alloc]initWithFrame:CGRectMake(0, 2, WIDTH, 100)];
    firstView.backgroundColor = [UIColor whiteColor];
    [_backView addSubview:firstView];
    
    imaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imaBtn.frame = CGRectMake(WIDTH/2-90, 15, 50, 50);
    imaBtn.layer.cornerRadius = 25;
    imaBtn.clipsToBounds = YES;
    imaBtn.adjustsImageWhenHighlighted = NO;
    [imaBtn setImage:[UIImage imageNamed:@"add_head_photo.png"] forState:UIControlStateNormal];
    [imaBtn addTarget:self action:@selector(imaBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [firstView addSubview:imaBtn];
    
    UIButton *signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    signBtn.frame = CGRectMake(WIDTH/2-95, 70, 60, 20);
    [signBtn setTitle:@"个性签名" forState:UIControlStateNormal];
    [signBtn setTitleColor:BGCOLOR forState:UIControlStateNormal];
    signBtn.adjustsImageWhenHighlighted = NO;
    signBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [signBtn addTarget:self action:@selector(signBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [firstView addSubview:signBtn];
    
    UILabel *nameLable = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2-30, 30, 120, 10)];
    nameLable.text = @"米鸡尔的米";
    nameLable.textColor = TEXTCOLOR;
    nameLable.font = [UIFont systemFontOfSize:16];
    [firstView addSubview:nameLable];
   
}

- (void)signBtnClick{
    SignatureViewController *sign = [[SignatureViewController alloc]init];
    [self.navigationController pushViewController:sign animated:YES];
}

- (void)imaBtnClick{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //
        [self takePhoto];
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self localPhoto];
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

/** 相机实现 */
- (void)takePhoto{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ) {
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.allowsEditing = YES;
        [self presentViewController:picker animated:YES completion:nil];
    }else{
        NSLog(@"模拟机无法打开照相机,请在真机使用");
    }
}

/** 相册选择实现 */
- (void)localPhoto{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
}

/** 当选取一张照片时候来这里 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        //先把图片转换成NSData
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *data;
        if (UIImagePNGRepresentation(image) == nil) {
            data = UIImageJPEGRepresentation(image, 1.0);
        }else{
            data = UIImagePNGRepresentation(image);
        }
        
        //图片保存的路径
        //这里讲图片放在沙盒的document文件夹中
        NSString *DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        
        //文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
        
        //得到选择后沙盒中图片的完整路径
        filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,@"/image.png"];
        
        //关机相册界面
        [picker dismissViewControllerAnimated:YES completion:nil];
     
        //创建一个选择后图片的小图标放在下方,类似微博选择图后的效果
        [imaBtn setImage:image forState:UIControlStateNormal];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"您取消了选择图片");
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)sendInfo
{
    NSLog(@"图片的路径是：%@", filePath);
    
//    NSLog(@"您输入框中的内容是：%@", inputView.text);
}


#pragma mark - data tableView
- (void)creatDataTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 104, WIDTH,HEIGHT-70-100-4+40) style:UITableViewStylePlain];
    _tableView.dataSource =self;
    _tableView.delegate = self;
    [_backView addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 12;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"BaseDataTableViewCell";
    BaseDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    UILabel *textLable = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 30, 20)];
    textLable.text = _array[indexPath.row];
    textLable.textColor = TEXTCOLOR;
    textLable.font = [UIFont systemFontOfSize:14];
    [cell addSubview:textLable];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            NameViewController *name = [[NameViewController alloc]init];
            [self.navigationController pushViewController:name animated:YES];
        }
            break;
            
        case 1:
        {
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(WIDTH-100, 50, 75, 20)];
//            tf.backgroundColor = [UIColor yellowColor];
            tf.keyboardType = UIKeyboardTypeNumberPad;
            tf.textColor = TEXTTINTCOLOR;
            tf.textAlignment = NSTextAlignmentRight;
            tf.font = [UIFont systemFontOfSize:10];
            [_tableView addSubview:tf];
           
        }
             break;
        case 2:
        {
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                //
                
            }]];
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                //
                
            }]];
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
            [self presentViewController:actionSheet animated:YES completion:nil];
            
            
        }
            break;
        case 3:
        {
            UITextField *age = [[UITextField alloc]initWithFrame:CGRectMake(WIDTH-75, 130, 50, 20)];
//            age.backgroundColor = [UIColor yellowColor];
            age.keyboardType = UIKeyboardTypeNumberPad;
            age.textColor = TEXTTINTCOLOR;
            age.textAlignment = NSTextAlignmentRight;
            age.font = [UIFont systemFontOfSize:10];
            [_tableView addSubview:age];

         
        }
            break;
        case 4:
        {
            
            RhcssViewController *rhcss = [[RhcssViewController alloc]init];
            [self.navigationController pushViewController:rhcss animated:YES];
            break;
            
//            CheckViewController *check = [[CheckViewController alloc]init];
//            [self.navigationController pushViewController:check animated:YES];
//            break;
            
//            AmExpertViewController *am = [[AmExpertViewController alloc]init];
//            [self.navigationController pushViewController:am animated:YES];
        }
             break;
        case 5:
        {
            TradeViewController *trade = [[TradeViewController alloc]init];
            [self.navigationController pushViewController:trade animated:YES];
            
        }
            break;
        case 6:
        {
            UnitViewController *unit = [[UnitViewController alloc]init];
            [self.navigationController pushViewController:unit animated:YES];
            
        }
            break;
        case 7:
        {
            PostViewController *post = [[PostViewController alloc]init];
            [self.navigationController pushViewController:post animated:YES];
            
        }
            break;
        case 8:
        {
            AdressViewController *adress = [[AdressViewController alloc]init];
            [self.navigationController pushViewController:adress animated:YES];
           
        }
             break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
