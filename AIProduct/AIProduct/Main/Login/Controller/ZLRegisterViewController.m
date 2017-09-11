//
//  ZLRegisterViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLRegisterViewController.h"
#import "ZLCustomRegistView.h"

@interface ZLRegisterViewController ()<UITextFieldDelegate>
@property (nonatomic, strong)ZLCustomRegistView *customregistView;
@end

@implementation ZLRegisterViewController

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //移除通知中心
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeTextField:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.customregistView = [[ZLCustomRegistView alloc]initWithFrame:CGRectMake(0, 64, App_Frame_Width, App_Frame_Height - 64)];
    [self.view addSubview:self.customregistView];
    
    [self.customregistView.agreeAndAccept.checkButton addTarget:self action:@selector(checkButtonSelected:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.customregistView.stepButton addTarget:self action:@selector(stepButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.customregistView.verificationCodeButton addTarget:self action:@selector(sentPhoneCodeTimeMethod) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.customregistView.userPasswordTF.delegate = self;
    self.customregistView.conFirmUserPasswordTF.delegate = self;
}

- (void)sentPhoneCodeTimeMethod {
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); // 每秒执行一次
//    
//    NSTimeInterval seconds = 60.f;
//    NSDate *endTime = [NSDate dateWithTimeIntervalSinceNow:seconds]; // 最后期限
//    
//    dispatch_source_set_event_handler(_timer, ^{
//        int interval = [endTime timeIntervalSinceNow];
//        if (interval > 0) { // 更新倒计时
//            NSString *timeStr = [NSString stringWithFormat:@"%d秒后重发", interval];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                self.customregistView.verificationCodeButton.enabled = NO;
//                [self.customregistView.verificationCodeButton setTitle:timeStr forState:UIControlStateNormal];
//            });
//        } else { // 倒计时结束，关闭
//            dispatch_source_cancel(_timer);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                self.customregistView.verificationCodeButton.enabled = YES;
//                [self.customregistView.verificationCodeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
//            });
//        }
//    });
//    dispatch_resume(_timer);
    
    [self.customregistView.verificationCodeButton fire];
    
}



/**
 通知调用的文本框值变化的方法
 */
- (void)changeTextField:(NSNotification *)notification{
    
    if (self.customregistView.userPhoneTF.text.length == 11 && self.customregistView.trueOrFalseBtnFirst.isSelected && self.customregistView.trueOrFalseBtnSecond.isSelected && self.customregistView.verificationCodeTF.text.length >= 3 && self.customregistView.aiIdTF.text.length >= 3 && _customregistView.agreeAndAccept.checkButton.isSelected) {
        
        self.customregistView.stepButton.enabled = YES;
        
        self.customregistView.stepButton.selected = YES;
        
    }else{
        self.customregistView.stepButton.enabled = NO;
        
        self.customregistView.stepButton.selected = NO;
    }
    
}

/**
 复选框按钮
 */
- (void)checkButtonSelected:(UIButton *)sender{
    sender.selected = !sender.selected;
}

/**
 下一步按钮事件
 */
- (void)stepButtonClick:(UIButton *)sender{

    NSLog(@"%d",[ZLCheckRegilarExpression checkTelNumberWithTel:self.customregistView.userPhoneTF.text]);
    
    [MBProgressHUD showCustomIcon:@"login_fault_big" Title:@"验证码无效" ToView:self.view];
    
    
}

#pragma Mark -- textField代理
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (textField == self.customregistView.userPasswordTF) {
        self.customregistView.trueOrFalseBtnFirst.hidden = NO;
       BOOL isTrue = [ZLCheckRegilarExpression checkPasswordWithPassword :self.customregistView.userPasswordTF.text];
        
        if (isTrue) {
            
             self.customregistView.trueOrFalseBtnFirst.selected = YES;
            
        }else{
            
            self.customregistView.trueOrFalseBtnFirst.selected = NO;
        }
    }
    
    if (textField == self.customregistView.conFirmUserPasswordTF) {
        self.customregistView.trueOrFalseBtnSecond.hidden = NO;
        BOOL isTrue = [ZLCheckRegilarExpression checkPasswordWithPassword:self.customregistView.conFirmUserPasswordTF.text];
        
        BOOL isEqual= [self.customregistView.userPasswordTF.text isEqualToString:self.customregistView.conFirmUserPasswordTF.text];
        
        if (isTrue && isEqual) {
            
            self.customregistView.trueOrFalseBtnSecond.selected = YES;
            
        }else{
             self.customregistView.trueOrFalseBtnSecond.selected = NO;
        }
        
        
    }

}

- (NSMutableAttributedString *)setTitle{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"注册"];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18] range:NSMakeRange(0, title.length)];
    
    return title;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
