//
//  ZLChangePasswordViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLChangePasswordViewController.h"
#import "ZLChangePasswordView.h"
@interface ZLChangePasswordViewController ()<UITextFieldDelegate>
@property(nonatomic, strong) ZLChangePasswordView *changePassV;
@end

@implementation ZLChangePasswordViewController
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //移除通知中心
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HEXCOLOR(KStand_bkg_color);
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(passWordChangeTextField:) name:UITextFieldTextDidChangeNotification object:nil];
    self.changePassV = [[ZLChangePasswordView alloc]init];
    self.changePassV.newpasswordTF.delegate = self;
    self.changePassV.repeatPasswordTF.delegate = self;
    [self.view addSubview:self.changePassV];
    
    [self.changePassV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.width.mas_equalTo(App_Frame_Width);
        make.top.equalTo(self.view).offset(64);
        make.bottom.equalTo(self.view.mas_bottom);
    }];

    

}


#pragma Mark -- textField代理
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (textField == self.changePassV.newpasswordTF) {
        self.changePassV.trueOrFalseBtnFirst.hidden = NO;
        BOOL isTrue = [ZLCheckRegilarExpression checkPasswordWithPassword :self.changePassV.newpasswordTF.text];
        
        if (isTrue) {
            
            self.changePassV.trueOrFalseBtnFirst.selected = YES;
            
        }else{
            
            self.changePassV.trueOrFalseBtnFirst.selected = NO;
        }
    }
    
    if (textField == self.changePassV.repeatPasswordTF) {
        self.changePassV.trueOrFalseBtnSecond.hidden = NO;
        BOOL isTrue = [ZLCheckRegilarExpression checkPasswordWithPassword:self.changePassV.repeatPasswordTF.text];
        
        BOOL isEqual= [self.changePassV.newpasswordTF.text isEqualToString:self.changePassV.repeatPasswordTF.text];
        
        if (isTrue && isEqual) {
            
            self.changePassV.trueOrFalseBtnSecond.selected = YES;
            
        }else{
            self.changePassV.trueOrFalseBtnSecond.selected = NO;
        }
        
        
    }
    
}


/**
 通知调用的文本框值变化的方法
 */
- (void)passWordChangeTextField:(NSNotification *)notification{
    
    if (self.changePassV.newpasswordTF.text.length >= 8 && [self.changePassV.repeatPasswordTF.text isEqualToString:self.changePassV.newpasswordTF.text ]) {
        
        self.changePassV.sureButton.enabled = YES;
        
        self.changePassV.sureButton.selected = YES;
        
    }else{
        self.changePassV.sureButton.enabled = NO;
        
        self.changePassV.sureButton.selected = NO;
    }
    
}


- (NSMutableAttributedString *)setTitle{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"修改密码"];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(0, title.length)];
    
    return title;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
