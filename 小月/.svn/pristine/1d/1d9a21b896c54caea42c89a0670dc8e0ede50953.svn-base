//
//  PulisherViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/5.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "PulisherViewController.h"
#import "JKWImagePost.h"


@interface PulisherViewController ()<UIActionSheetDelegate,UITextViewDelegate,UIGestureRecognizerDelegate,UIApplicationDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    UIAlertController *_myActionSheet;
    NSString *filePath;
    UITextView *inputView;
    UIView *cicView;
}
@property(nonatomic,strong)UILabel *PLlab;
@property(nonatomic ,strong) NSMutableArray *imageArr;
@property(nonatomic,strong)NSMutableArray *imageViewArr;
@property(nonatomic,strong)UIView *bgView;
@end

@implementation PulisherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.picBtnArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.picArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.dataArray = [[NSMutableArray alloc]initWithCapacity:0];
    [self createNavBar];
    [self creatInputFieldView];
    [self createPopView];
    _imageArr = [NSMutableArray array];
    _imageViewArr = [NSMutableArray array];
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
    navBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navBar];
    
    //导航栏字体
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"创建话题";
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
    
    //发布按钮
    UIButton *writeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    writeBtn.frame = CGRectMake(WIDTH-50, 5, 40, 40);
    //writeBtn.backgroundColor = [UIColor redColor];
    [writeBtn setTitle:@"发布" forState:UIControlStateNormal];
    [writeBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    //[writeBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 35, 35)];
    [writeBtn addTarget:self action:@selector(publish) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:writeBtn];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 49, WIDTH, 1)];
    lineView.backgroundColor = LINECOLOR;
    [navBar addSubview:lineView];

}


/** 返回按钮点击事件 */
- (void)fanhui
{
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

/** 发布按钮点击事件 */
- (void)publish
{
    if (self.bodyTfield.text.length == 0 || self.bodyTfield.text.length > 8) {
        ALERTVIEW(@"主题应不超过8个字")
    }else if ( self.markTfield.text.length == 0)
    {
        ALERTVIEW(@"您还未选择标签")
    }else
    {
        session *danLi = [session getInstance];
        [ZYHTTPRequest createArticleWith:danLi.token :CREATE_ARTICLE(self.bodyTfield.text, inputView.text, self.markTfield.text) :self.dataArray block:^(NSDictionary *dic, NSError *error) {
            if ([[dic objectForKey:@"code"] intValue] == 200) {
            }
            NSLog(@"%@",dic);
        }];
    }
//    [self.navigationControll er pushViewController:nil animated:YES];
}


/** 创建弹出视图 */
#pragma mark - 创建弹出视图
- (void)createPopView{
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    self.bgView.clipsToBounds = YES;
    self.bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];;
    [self.view addSubview:self.bgView];
    self.bgView.hidden = YES;

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    tap.delegate = self;
    [self.bgView addGestureRecognizer:tap];
    
    cicView = [[UIView alloc]initWithFrame:CGRectMake(20, HEIGHT/3, WIDTH-40, 200)];
    cicView.layer.cornerRadius =  3;
    cicView.clipsToBounds = YES;
    cicView.backgroundColor = WHITECOLOR;
    [self.bgView addSubview:cicView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, WIDTH-40, 20)];
    lab.text = @"请选择话题标签";
    lab.textColor = BGCOLOR;
    lab.font = [UIFont systemFontOfSize:16];
    lab.textAlignment = NSTextAlignmentCenter;
    [cicView addSubview:lab];
    
     self.resonArray = @[@"环境因素",@"行为因素",@"精神因素",@"药物因素",@"嗜酒因素",@"年龄因素",@"入睡因素",@"早睡易醒",@"身体乏力",@"反应迟钝",@"记忆衰退",@"头晕耳鸣"];
    for (int i = 0; i < 12; i++) {
        UIButton *unBindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        unBindBtn.frame = CGRectMake(10+(i%4)*((WIDTH-40-20-248)/3+62), 60+(i/4)*35, 62, 30);
        unBindBtn.layer.borderColor = SLIVERYCOLOR.CGColor;
        unBindBtn.layer.borderWidth = 1.3;
        unBindBtn.layer.cornerRadius = 3;
        unBindBtn.clipsToBounds = YES;
        unBindBtn.tag = 10000 + i;
        unBindBtn.adjustsImageWhenHighlighted = NO;
        [unBindBtn setTitle:self.resonArray[i] forState:UIControlStateNormal];
        [unBindBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        unBindBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [unBindBtn addTarget:self action:@selector(unBindBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [cicView addSubview:unBindBtn];
    }
    
    self.bgView.hidden = YES;
}

-(void)unBindBtnClick:(UIButton *)sender
{
    self.markTfield.text = self.resonArray[sender.tag - 10000];
    self.bgView.hidden = YES;
    
}

/** 手势点击事件 */
- (void)tapClick:(UITapGestureRecognizer *)sender{
    if (sender.numberOfTouchesRequired == 1) {
        self.bgView.hidden = YES;
    }
}

/** 解决手势冲突 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:cicView]) {
        return NO;
    }
    return YES;
}

/** 标签按钮点击事件 */
- (void)markBtnClick{
    [self.view endEditing:YES];
    self.bgView.hidden = NO;
    [self.view bringSubviewToFront:self.bgView];
}


#pragma mark - 发布信息输入栏
- (void)creatInputFieldView{
    
    UILabel *bodyLabvel = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, 50, 20)];
    bodyLabvel.text = @"主题:";
    bodyLabvel.textAlignment = NSTextAlignmentLeft;
    bodyLabvel.textColor = TEXTCOLOR;
    bodyLabvel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:bodyLabvel];
    
    self.bodyTfield = [[UITextField alloc]initWithFrame:CGRectMake(60, 80, WIDTH - 70, 20)];
    self.bodyTfield.placeholder = @"请输入主题(最多8字)";
    self.bodyTfield.textColor = TEXTCOLOR;
    self.bodyTfield.textAlignment = NSTextAlignmentLeft;
    self.bodyTfield.font = [UIFont systemFontOfSize:16];
    self.bodyTfield.tag = 2014;
    self.bodyTfield.delegate = self;
    [self.view addSubview:self.bodyTfield];
    
    for (int i = 0; i < 2; i++) {
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 109 + 40 * i, WIDTH, 1)];
        lineView.backgroundColor = LINECOLOR;
        [self.view addSubview:lineView];
    }
    
    UILabel *markLabvel = [[UILabel alloc]initWithFrame:CGRectMake(10, 120, 50, 20)];
    markLabvel.text = @"标签:";
    markLabvel.textAlignment = NSTextAlignmentLeft;
    markLabvel.textColor = TEXTCOLOR;
    markLabvel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:markLabvel];
    
    self.markTfield = [[UITextField alloc]initWithFrame:CGRectMake(60, 120, WIDTH - 70, 20)];
    self.markTfield.placeholder = @"请选择话题标签";
    self.markTfield.textColor = TEXTCOLOR;
    self.markTfield.textAlignment = NSTextAlignmentLeft;
    self.markTfield.font = [UIFont systemFontOfSize:16];
    self.markTfield.tag = 2014;
    self.markTfield.delegate = self;
    [self.view addSubview:self.markTfield];
    
    UIButton *markBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    markBtn.frame = CGRectMake(0, 100, WIDTH, 40);
    [markBtn addTarget:self action:@selector(markBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:markBtn];
    
    //输入框视图
    inputView = [[UITextView alloc]initWithFrame:CGRectMake(5, 160, WIDTH-10, (HEIGHT-70)/3-20)];
    inputView.keyboardType = UIKeyboardTypeDefault;
    inputView.font = [UIFont systemFontOfSize:16];
    inputView.layer.borderColor = LINECOLOR.CGColor;
    inputView.layer.borderWidth = 1;
    inputView.layer.cornerRadius = 3;
    inputView.clipsToBounds = YES;
    inputView.delegate = self;
    inputView.textColor = TEXTCOLOR;
    [self.view addSubview:inputView];
    
    self.PLlab = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, WIDTH, 40)];
    self.PLlab.text = @"您此刻的想法,最多1500字";
    self.PLlab.font = [UIFont systemFontOfSize:16];
    self.PLlab.textColor = TEXTTINTCOLOR;
    [inputView addSubview:self.PLlab];
    
    UIButton *addbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addbtn.frame = CGRectMake(20, 160 +(HEIGHT-70)/3, 64, 64);
    [addbtn setBackgroundImage:[UIImage imageNamed:@"gengduo_icon.png"] forState:UIControlStateNormal];
    [addbtn addTarget:self action:@selector(addImaBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addbtn];
    
//    //添加照片和更多
//    for (int i =0; i < 2; i++) {
//        UIButton *addbtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        addbtn.tag = i;
//        addbtn.frame = CGRectMake(20+74*i, 75+(HEIGHT-70)/3, 64, 64);
//        switch (addbtn.tag) {
//            case 0:
//                [addbtn setBackgroundImage:[UIImage imageNamed:@"zhaopian_icon"] forState:UIControlStateNormal];
//                [addbtn addTarget:self action:@selector(addImaBtnClick) forControlEvents:UIControlEventTouchUpInside];
//                break;
//            case 1:
//                [addbtn setBackgroundImage:[UIImage imageNamed:@"gengduo_icon"] forState:UIControlStateNormal];
//                [addbtn addTarget:self action:@selector(addMoreBtnClick) forControlEvents:UIControlEventTouchUpInside];
//                
//        }
//        
//        
//        [self.view addSubview:addbtn];
//    }

}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.text.length > 8) {
        ALERTVIEW(@"超出最大可输入长度")
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    self.PLlab.hidden = YES;
}

- (BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@""] && range.length > 0 ) {
        return YES;
    }else{
        if (textView.text.length - range.length + text.length > 3000) {
            ALERTVIEW(@"超出最大可输入长度")
            return NO;
        }else{
            return YES;
        }
    }

}

/** 点击相片按钮的点击事件 */
- (void)addImaBtnClick{
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

        [self.imageArr addObject:image];
        NSData * imgData = [JKWImagePost compactImage:image];
        [self.dataArray addObject:imgData];
        //创建一个选择后图片的小图标放在下方,类似微薄选择图后的效果
        if (_imageArr.count < 10) {
            
            int x;
            int y;
            
                
                
                if (_imageArr.count - 1 < 3) {
                    x = 20 + 74 + 74 * ((_imageArr.count - 1) % 3);
                    y = 160 + (HEIGHT - 70) / 3 + 74 * ( (_imageArr.count - 1) / 3);
                }else if (_imageArr.count - 1 >= 3)
                {
                    x = 20 + 74 * (_imageArr.count % 4);
                    y = 160 + (HEIGHT - 70) / 3 + 74 * ( _imageArr.count / 4);
            }
            
            
            UIImageView *smallimage = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, 64, 64)];
            [self.imageViewArr addObject:smallimage];
            
            UIImageView *sun = _imageViewArr[_imageArr.count-1];
            UIImage *cao = _imageArr[_imageArr.count-1];
            sun.image = cao;
            //        smallimage.image = image;
            //加在视图中
            [self.view addSubview:sun];
            
            UIButton *picBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            picBtn.frame = CGRectMake(x, y, 64, 64);
            picBtn.tag = 2013 + _imageArr.count - 1;
            [picBtn addTarget:self action:@selector(picBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:picBtn];
            [self.picBtnArray addObject:picBtn];
            
//            [self performSelector:@selector(setImageArr:) withObject:nil afterDelay:1];
        }else{
        
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"一次最多只能上传九张!" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
        }
        
    }

}

-(void)picBtnClick:(UIButton *)sender
{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"您确定要删除该照片吗?" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImageView *picImage = [self.imageViewArr objectAtIndex:self.imageViewArr.count - 1];
        [picImage removeFromSuperview];
        [self.imageViewArr removeObjectAtIndex:self.imageViewArr.count - 1];
        [_imageArr removeObjectAtIndex:sender.tag - 2013];
        [self.dataArray removeObjectAtIndex:sender.tag - 2013];
        UIButton *picBtn = [self.picBtnArray objectAtIndex:self.picBtnArray.count - 1];
        [picBtn removeFromSuperview];
        [self.picBtnArray removeObjectAtIndex:self.picBtnArray.count - 1];
        [self.picArray removeAllObjects];
        for (int i = 0; i < self.imageViewArr.count; i++) {
            UIImageView *picImages = self.imageViewArr[i];
            picImages.image = _imageArr[i];
        }
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"您取消了选择图片");
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)sendInfo
{
    NSLog(@"图片的路径是：%@", filePath);
    
    NSLog(@"您输入框中的内容是：%@", inputView.text);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

///** 点击更多按钮的点击事件 */
//- (void)addMoreBtnClick{
//    [self.navigationController pushViewController:nil animated:YES];
//}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    if (inputView.text.length > 0) {
        self.PLlab.hidden = YES;
    }else{
        self.PLlab.hidden = NO;
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
