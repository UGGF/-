//
//  OpenReportViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/5/9.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "OpenReportViewController.h"
#import "OpenReportTableViewCell.h"

@interface OpenReportViewController ()<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSArray *_nameArray;
    NSString *filePath;
    UIButton *_imageButton;
    NSString *_signStr;
    
}
@property(nonatomic,strong)UIAlertController *myActionSheet;
@end

@implementation OpenReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    _nameArray = @[@"驴友",@"牌友党",@"大学同学"];
    [self createNavBar];
    [self createContentView];
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
    title.text = @"设备权限";
    title.textColor = TEXTCOLOR;
    title.font = [UIFont systemFontOfSize:18];
    title.textAlignment = NSTextAlignmentCenter;
    [navBar addSubview:title];
    
    //导航返回键
    UIButton *fanHuiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fanHuiBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    fanHuiBtn.frame = CGRectMake(0, 0, 100, 50);
    [fanHuiBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 60)];
    [fanHuiBtn addTarget:self action:@selector(fanHuiBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //fanHuiBtn.backgroundColor = [UIColor blackColor];
    [navBar addSubview:fanHuiBtn];
    
    /** 设备绑定 */
    UIButton *openBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    openBtn.frame = CGRectMake(WIDTH-70, 15, 60, 20);
    openBtn.clipsToBounds = YES;
    openBtn.adjustsImageWhenHighlighted = NO;
    [openBtn setTitle:@"开放报告" forState:UIControlStateNormal];
    [openBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    openBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [openBtn addTarget:self action:@selector(openBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:openBtn];
}

- (void)fanHuiBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)openBtnClick{
    if ([_signStr isEqualToString:@"select"]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"友情提醒" message:@"您将指定该好友为设备使用者" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            //
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}


#pragma mark - 创建内容视图
- (void)createContentView{
    self.view.backgroundColor = RGBCOLOR(242, 242, 242);
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 40)];
    bgView.backgroundColor = WHITECOLOR;
    [self.view addSubview:bgView];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
    lineView.backgroundColor = LINECOLOR;
    [bgView addSubview:lineView];
    
    UISearchBar *seach = [[UISearchBar alloc]initWithFrame:CGRectMake(10, 5, WIDTH - 20, 30)];
    seach.placeholder = @"搜索朋友";
    seach.backgroundColor = RGBCOLOR(242, 242, 242);
    seach.backgroundImage = [self imageWithColor:WHITECOLOR size:seach.bounds.size];
    seach.layer.borderWidth = 2;
    seach.layer.borderColor = GREENCOLOR.CGColor;
    seach.layer.cornerRadius = 3;
    seach.clipsToBounds = YES;
    [bgView addSubview:seach];
    
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 112, WIDTH, HEIGHT-112)];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.backgroundColor = WHITECOLOR;
    self.tableview.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableview];
    
    
}

/** 搜索框背景图片的封装方法 */
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


#pragma mark - tableview相关的代理方法
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return _nameArray.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    bgView.backgroundColor = WHITECOLOR;
    
    UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(12, 12, 15, 15)];
    [arrow setImage:[UIImage imageNamed:@"contacts_arrow.png"]];
    if (_flagOpenArrar[section]) {
        arrow.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        arrow.transform = CGAffineTransformIdentity;
    }
    [bgView addSubview:arrow];
    
    UILabel *nameLab = [[UILabel alloc]initWithFrame:CGRectMake(35, 10, WIDTH/2, 20)];
    nameLab.textColor = RGBCOLOR(52, 52, 52);
    nameLab.text = _nameArray[section];
    nameLab.font = [UIFont systemFontOfSize:13];
    nameLab.textAlignment = NSTextAlignmentLeft;
    [bgView addSubview:nameLab];
    
   
    UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2, 10, WIDTH/2-50, 20)];
    numLab.numberOfLines = 0;
    numLab.text = @"2/4";
    numLab.textColor =  RGBCOLOR(52, 52, 52);
    numLab.font = [UIFont systemFontOfSize:13];
    numLab.textAlignment = NSTextAlignmentRight;
    [bgView addSubview:numLab];

    UIButton *cicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cicBtn.frame = CGRectMake(WIDTH-30, 10, 20, 20);
    cicBtn.layer.cornerRadius = 10;
    cicBtn.clipsToBounds = YES;
    cicBtn.selected = YES;
    cicBtn.adjustsImageWhenHighlighted = NO;
    cicBtn.layer.borderColor = TEXTTINTCOLOR.CGColor;
    cicBtn.layer.borderWidth = 1;
    cicBtn.layer.masksToBounds = YES;
    [cicBtn addTarget:self action:@selector(cicBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:cicBtn];

    
    UIButton *clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clickBtn.frame = CGRectMake(0, 0, WIDTH-30, 40);
    clickBtn.clipsToBounds = YES;
    clickBtn.tag = 70 + section;
    clickBtn.adjustsImageWhenHighlighted = NO;
    [clickBtn addTarget:self action:@selector(clickBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:clickBtn];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 39, WIDTH, 1)];
    line.backgroundColor = SLIVERYCOLOR;
    [bgView addSubview:line];
    
    return bgView;
}

- (void)clickBtnClick:(UIButton *)sender{
    for (int i = 0; i < 100; i++) {
        if (i == sender.tag - 70) {
            _flagOpenArrar[i] = !_flagOpenArrar[i];
        }
//        }else{
//            _flagOpenArrar[i] = NO;
//        }
    }
    [self.tableview reloadData];
}
- (void)cicBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected == NO) {
        [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
    }else{
        [sender setImage:nil forState:UIControlStateNormal];
    }

}

#pragma mark - 相机和相册的相关实现
/** 点击相片按钮的点击事件 */
- (void)imageButtonClick{
    _myActionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    /** 点击相机和相册按钮的点击事件 */
    [_myActionSheet addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self takePhoto];
        
    }]];
    [_myActionSheet addAction:[UIAlertAction actionWithTitle:@"从手机相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self LocalPhoto];
        
    }]];
    
    [_myActionSheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:_myActionSheet animated:YES completion:nil];
}


/** 调用相机方法 */
- (void)takePhoto{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.allowsEditing = YES;/** 设置拍照后的图片可被编辑 */
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
    }else{
        NSLog(@"模拟机无法打开照相机,请在真机使用");
    }
}

//打开本地相册
-(void)LocalPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
}

/** 当选择一张照片后进入这里 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        //先把图片转成NSData
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *data;
        if (UIImagePNGRepresentation(image) == nil)
        {
            data = UIImageJPEGRepresentation(image, 1.0);
        }
        else
        {
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
        [_imageButton setImage:image forState:UIControlStateNormal];
        
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


- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        if (_flagOpenArrar[section]) {
            return 1;
        }else{
            return 0;
        }
    }else if (section > 0){
        if (_flagOpenArrar[section]) {
            return 4;
        }else{
            return 0;
        }
        
    }else{
        return 0;
    }
    
    
}
//    if (_flagArrar[section]) {
//        return 4;
//    }else{
//        return 0;
//    }


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"OpenReportTableViewCell";
    OpenReportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.OpenImageBtn.backgroundColor = CAOGREENCOLOR;
    cell.OpenNameLab.text = @"得得";
    cell.OpenSignLab.text = @"发小";
    [cell.OpenSelectBtn addTarget:self action:@selector(OpenSelectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.OpenSelectBtn.tag = 100 + indexPath.row;
    cell.OpenSelectBtn.selected = YES;
    return cell;
}

- (void)OpenSelectBtnClick:(UIButton *)sender{
//    _signStr = [NSString stringWithFormat:@"%@%ld",_signStr,(long)sender.tag];
    sender.selected = !sender.selected;
    if (sender.selected == NO) {
        [sender setImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
    }else{
        [sender setImage:nil forState:UIControlStateNormal];
    }
}
//
//- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"友情提醒" message:@"您将指定该好友为设备使用者" preferredStyle:UIAlertControllerStyleAlert];
//    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
//    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        
//        //
//        
//    }]];
//    [self presentViewController:alert animated:YES completion:nil];
//    
//}



#pragma mark - 点击屏幕缩回键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
