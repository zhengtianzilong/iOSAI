//
//  ZLChartDetailMessageViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLChartDetailMessageViewController.h"
#import "ZLChatMessageCell.h"
#import "ZLMessageModel.h"
#import "ZLChatTimeTableViewCell.h"
#import "ZLKeyBoardView.h"
#import "ZLVoiceRecordHelper.h"
#import "ZLChatDataSourceHelper.h"
#import "NSDate+Addition.h"
#import <KeyboardManager.h>
@interface ZLChartDetailMessageViewController ()<UITableViewDataSource,UITableViewDelegate,VoiceReordingDelegate,TextInputDelegate,ZLBottomMoreDelegate,ZLEmotionViewDelegate,GCDAsyncSocketDelegate>
@property(nonatomic,strong) UITableView *chatTable;
@property(nonatomic,strong) NSMutableArray *chatFakeMessages;

@property(nonatomic,strong) ZLKeyBoardView *keyBoardView;

@property(nonatomic,strong) ZLVoiceRecordHelper *voiceRecordHelper;


@end

@implementation ZLChartDetailMessageViewController

NSString *const leftChatCellIdentifier = @"cellleftCellId";
NSString *const rightChatCellIdentifier = @"cellleftCellId";
NSString *const chatTimeCellIdentifier = @"timeCellId";

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [[IQKeyboardManager sharedManager]setEnable:NO];
    
    if (clientSocket) {
        
        if ([clientSocket isConnected]) {
            [clientSocket disconnect];
        }
        
        [clientSocket connectToHost:@"192.168.31.215" onPort:8090 error:nil];
        
    }
    
    
    
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [[IQKeyboardManager sharedManager]setEnable:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HEXCOLOR(KStand_bkg_color);
    [self.view addSubview:self.chatTable];
    
    [self.view addSubview:self.keyBoardView];
    
    [self createSocket];
    
    // 给tableview添加congtentSize监听
    [self.chatTable addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        if (self.chatFakeMessages.count > 0) {
//            
//            // 滚动到最后一行
//            [self.chatTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.chatFakeMessages.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
//
//            
//        }
//        
//        });

    
}


- (void)createSocket{
    
    // 服务器
    serverSocket = [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    // 自身
    listenSocket = [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    [listenSocket acceptOnPort:8090 error:nil];
    // 点对点时,对方的socket
    clientSocket = [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    
    
    
}

- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket{
    
    if (sock == listenSocket) {
        NSLog(@"收到用户%@的链接请求",[newSocket connectedHost]);
        if (clientSocket && [clientSocket isConnected]) {
            [clientSocket disconnect];
        }
        clientSocket = newSocket;
    }
    [newSocket readDataWithTimeout:-1 tag:250];
    
    
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err{
    
    NSLog(@"断开链接了");
    if (err) {
        NSLog(@"%@",err);
    }else{
        NSLog(@"链接工作正常");
    }
    serverSocket = nil;
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    
    if (sock == serverSocket) {
        NSString *message = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"服务器message:%@",message);
    }else if(sock == clientSocket){
        
        NSString *message = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        ZLMessageModel *messageModel = [ZLTextMessageModel text:message username:@"小王" timeStamp:[NSDate date:[NSDate date] WithFormate:KDateFormate] isSender:NO];
        messageModel.avatar = [UIImage imageNamed:@"chat_robot_head"];
        [self.chatFakeMessages addObject:messageModel];
        
        NSLog(@"点对点message:%@",message);
    }
    [sock readDataWithTimeout:-1 tag:300];
    
    [self.chatTable reloadData];
    
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port{
    // 获取用户列表
    if (sock==serverSocket) {
        NSLog(@"已经连接到服务器:%@",host);
    }
    // 客户端与客户端通讯
    else{
        NSLog(@"已经连接到客户端:%@",host);
    }
    
    [sock readDataWithTimeout:-1 tag:400];
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag{
    // 获取用户列表
    if (sock==serverSocket) {
        NSLog(@"向服务器%@发送消息成功",[sock connectedHost]);
    }
    // 客户端与客户端通讯
    else{
        NSLog(@"向客户%@发送消息成功",[sock connectedHost]);
    }
    // 继续监听
    [sock readDataWithTimeout:-1 tag:500];
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    self.keyBoardView.hideKeyBoard = YES;
//}

- (void)tapGestureBegin{
    
//    if (self.keyBoardView.keyBoardDetalChange == 0) {
//        return;
//    }
    
//    self.keyBoardView.hideKeyBoard = YES;
//    
//    self.keyBoardView.keyBoardDetalChange = 44;
//    
    
    
    
}



#pragma mark -- chatTable
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.chatFakeMessages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id obj = self.chatFakeMessages[indexPath.row];
    UITableViewCell *cell = nil;
    
    if ([obj isKindOfClass:[ZLMessageModel class]]) {
        
        ZLChatMessageCell *messageCell = (ZLChatMessageCell *)cell;
        ZLMessageModel *message = (ZLMessageModel *)obj;
        if (message.isSender) {
            messageCell = [tableView dequeueReusableCellWithIdentifier:rightChatCellIdentifier ];
            
            
        }else{
            messageCell = [tableView dequeueReusableCellWithIdentifier:leftChatCellIdentifier ];
        }
        messageCell.message = message;
        messageCell.backgroundColor = HEXCOLOR(KStand_bkg_color);
        messageCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return messageCell;
        
    }
    
    else
    {
        ZLChatTimeTableViewCell *timeCell = (ZLChatTimeTableViewCell *)cell;
        timeCell = [tableView dequeueReusableCellWithIdentifier:chatTimeCellIdentifier ];
        NSString *time = (NSString *)obj;
        timeCell.time = time;
        timeCell.selectionStyle = UITableViewCellSelectionStyleNone;
        timeCell.backgroundColor = HEXCOLOR(KStand_bkg_color);;
        
        return timeCell;
    }
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id obj = self.chatFakeMessages[indexPath.row];
    
    if ( [obj isKindOfClass:[ZLMessageModel class]]) {
        return [ZLChatMessageCell CellHeight:obj];
    }
    
    return 30;
    
}


#pragma mark -- customKeyBoard


- (ZLKeyBoardView *)keyBoardView
{
    
    
    if (_keyBoardView == nil) {
        _keyBoardView = [[ZLKeyBoardView alloc]init];
        _keyBoardView.voiceRecoderDelegate = self;
        _keyBoardView.textInputDelegate = self;
        _keyBoardView.moreViewDelegate = self;
        _keyBoardView.emoijViewDelegate = self;
        [_keyBoardView addObserver:self forKeyPath:@"keyBoardDetalChange" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        
    }
    
    return _keyBoardView;
}

#pragma mark - Voice Recording delegate
- (void)prepareRecordingVoiceAction
{
    NSLog(@"prepareRecordingWithCompletion");
    [self prepareRecordWithCompletion:^BOOL{
        
        return YES;
    }];
}

- (void)didStartRecordingVoiceAction {
    NSLog(@"didStartRecordingVoice");
    [self startRecord];
}

- (void)didCancelRecordingVoiceAction {
    NSLog(@"didCancelRecordingVoice");
    [self cancelRecord];
}

- (void)didFinishRecoingVoiceAction {
    NSLog(@"didFinishRecoingVoice");
    [self finishRecorded];
    
}

- (void)didDragOutsideAction {
    NSLog(@"didDragOutsideAction");
    [self resumeRecord];
}

- (void)didDragInsideAction {
    NSLog(@"didDragInsideAction");
    [self pauseRecord];
}



#pragma mark ---textSendDelegate
//发送纯文本消息
- (void)sendTextMessage:(NSString *)text
{
    
    ZLTextMessageModel *message =  [ZLTextMessageModel text:text username:@"" timeStamp:[NSDate date:[NSDate date] WithFormate:KDateFormate] isSender:YES];
//    message.avatarUrl = @"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=603e37439313b07ebde8580c39e7bd15/a8014c086e061d9591b7875a7bf40ad163d9cadb.jpg";
    
    message.avatar = [UIImage imageNamed:@"chat_somebody"];
    
    [self sendMessage:message];
    
}


#pragma mark ---emoijMessageSendDelegate
//发送emoi表情
- (void)sendEmoijMessage:(NSString *)text
{
    ZLTextMessageModel *message =  [ZLTextMessageModel text:text username:@"" timeStamp:[NSDate date:[NSDate date] WithFormate:KDateFormate] isSender:YES];
//    message.avatarUrl = @"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=603e37439313b07ebde8580c39e7bd15/a8014c086e061d9591b7875a7bf40ad163d9cadb.jpg";
    
    message.avatar = [UIImage imageNamed:@"chat_somebody"];
    
    
    [self sendMessage:message];
    
    
}


//发送非emoij图片
- (void)sendEmotionImage:(NSString *)localPath emotionType:(EmotionType)emotionType
{
    
    ZLPhotoMessageModel *message =  [ZLPhotoMessageModel Photo:localPath thumbnailUrl:nil originPhotoUrl:nil username:nil timeStamp:[NSDate date:[NSDate date] WithFormate:KDateFormate] isSender:YES];
    if (emotionType == EmotionTypeGif)
    {
        message.isGif = YES;
    }
    else
    {
        message.isGif = NO;
    }
    
//    message.avatarUrl = @"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=603e37439313b07ebde8580c39e7bd15/a8014c086e061d9591b7875a7bf40ad163d9cadb.jpg";
    
    message.avatar = [UIImage imageNamed:@"chat_somebody"];
    
    [self sendMessage:message];
    
}


#pragma mark ---MoreViewClickDelegate
- (void)moreViewClick:(MoreViewType)type
{
    switch (type) {
        case MoreViewTypePhotoAblums:
            NSLog(@"拍照");
            break;
        case MoreViewTypePhotoLocation:
            NSLog(@"位置");
            
            break;
        case MoreViewTypeTakePicture:
            NSLog(@"拍照");
            
            break;
        case MoreViewTypePhoneCall:
            NSLog(@"语音电话");
            
            break;
        case MoreViewTypeVideoCall:
            NSLog(@"视频通话");
            
            break;
            
        default:
            break;
    }
    
    
}





#pragma mark ---voiceRecoder

- (NSString *)getRecorderPath
{
    
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *fileName = [dateFormatter stringFromDate:now];
    
    NSString *recordPath = NSHomeDirectory();
    recordPath = [NSString stringWithFormat:@"%@/Library/chatbuffer/%@.m4a",recordPath,fileName];
    NSFileManager *fm = [NSFileManager defaultManager];
    if(![fm fileExistsAtPath:[recordPath stringByDeletingLastPathComponent]]){
        [fm createDirectoryAtPath:[recordPath stringByDeletingLastPathComponent]
      withIntermediateDirectories:YES
                       attributes:nil
                            error:nil];
    }
    
    
    return recordPath;
}



- (void)prepareRecordWithCompletion:(PrepareRecorderCompletion)completion
{
    [self.voiceRecordHelper prepareRecordingWithPath:[self getRecorderPath] prepareRecorderCompletion:completion];
}


- (void)startRecord
{
    
    [self.voiceRecordHelper startRecordingWithStartRecorderCompletion:^{
        
        
    }];
}


- (void)finishRecorded
{
    [self.voiceRecordHelper stopRecordingWithStopRecorderCompletion:^(NSString *path){
        
        [self sendVoiceRecoder:path voiceDuration:self.voiceRecordHelper.recordDuration];
        
    }];
}


//发送语音消息
- (void)sendVoiceRecoder:(NSString *)voiceRecoderPath voiceDuration:(NSString *)voiceDuration
{
    ZLVoiceMessageModel *message =  [ZLVoiceMessageModel VoicePath:voiceRecoderPath voiceUrl:nil voiceDuration:voiceDuration username:nil timeStamp:[NSDate date:[NSDate date] WithFormate:KDateFormate] isRead:YES isSender:YES];
//    message.avatarUrl = @"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=603e37439313b07ebde8580c39e7bd15/a8014c086e061d9591b7875a7bf40ad163d9cadb.jpg";
    
    message.avatar = [UIImage imageNamed:@"chat_somebody"];
    
    [self.chatFakeMessages addObject:message];
    [self.chatTable reloadData];
    
    
    NSLog(@"messageSend:voiceRecoder:%@",voiceRecoderPath);
}


- (void)pauseRecord
{
    
    [self.voiceRecordHelper pauseRecordingWithPauseRecorderCompletion:^{
        
    }];
}


- (void)resumeRecord
{
    [self.voiceRecordHelper resumeRecordingWithResumeRecorderCompletion:^{
        
    }];
    
}

- (void)cancelRecord
{
    [self.voiceRecordHelper cancelledDeleteWithCompletion:^{
        
    }];
}





- (ZLVoiceRecordHelper *)voiceRecordHelper
{
    
    __weak typeof(self) weakSelf = self;
    if (!_voiceRecordHelper) {
        //   _isMaxTimeStop = NO;
        
        _voiceRecordHelper = [[ZLVoiceRecordHelper alloc] init];
        _voiceRecordHelper.maxTimeStopRecorderCompletion = ^(NSString *path){
            NSLog(@"到最大限制时间了！！");
            
            
            [weakSelf finishRecorded];
        };
        _voiceRecordHelper.peakPowerForChannel = ^(float peakPowerForChannel) {
            
            
            weakSelf.keyBoardView.peakPower = peakPowerForChannel;
            
            
            
        };
        _voiceRecordHelper.maxRecordTime = kVoiceRecorderTotalTime;
    }
    return _voiceRecordHelper;
}




#pragma mark --- sendMessage
- (void)sendMessage:(ZLMessageModel *)message
{
    
    switch (message.bubbleMessageBodyType) {
        case MessageBodyTypeText: {
            
            NSLog(@"messageSend  <Text>:%@",message.text);
            break;
        }
        case MessageBodyTypePhoto: {
            NSLog(@"messageSend <Photo>:%@",message.localPhotoPath);
            break;
        }
        case MessageBodyTypeVideo: {
            NSLog(@"messageSend <Video>:%@",message.videoThumbPhoto);
            break;
        }
        case MessageBodyTypeVoice: {
            NSLog(@"messageSend <Voice>:%@",message.voiceDuration);
            break;
        }
        case MessageBodyTypeLocation: {
            NSLog(@"messageSend <Location>:%@",message.location);
            break;
        }
    }
    
    NSData *data=[message.text dataUsingEncoding:NSUTF8StringEncoding];
    
    [clientSocket writeData:data withTimeout:-1 tag:100];
    
    [self.chatFakeMessages addObject:message];
    

    [self.chatTable reloadData];
    
}




#pragma mark -- kvo  键盘事件调整table的offset
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    //监测键盘变化：改变chatTable的offset
    if ([keyPath isEqualToString:@"keyBoardDetalChange"]){
        
//        NSLog(@"keyBoardDetalChange%f",_chatTable.contentOffset.y);
        NSLog(@"contentSize%f",_chatTable.contentSize.height);
        NSLog(@"y%f",_keyBoardView.frame.origin.y);
        NSLog(@"height%f",_keyBoardView.frame.size.height);
        if (_chatTable.contentSize.height > (Main_Screen_Height - _keyBoardView.frame.size.height)){
             [self.chatTable setContentOffset:CGPointMake(0, self.chatTable.contentSize.height + self.keyBoardView.keyBoardDetalChange-SCREEN_HEIGHT) animated:YES];
        }
        
       
        
    }
    
    //监测聊天消息接收和发送，系统table的contentSize变化，改变offset
    else if ([keyPath isEqualToString:@"contentSize"]){
        
        NSLog(@"%f",_chatTable.contentOffset.y);
        NSLog(@"%f",_chatTable.contentSize.height);
        NSLog(@"%f",_keyBoardView.frame.origin.y);
        
        if (_chatTable.contentSize.height > (Main_Screen_Height - _keyBoardView.frame.size.height)) {
            [self.chatTable setContentOffset:CGPointMake(0, self.chatTable.contentSize.height+self.keyBoardView.keyBoardDetalChange-SCREEN_HEIGHT) animated:NO];
        }
        

    }
    
}



- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.keyBoardView.hideKeyBoard = YES;
}



- (UITableView *)chatTable{
    
    if (!_chatTable) {
        
        _chatTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_chatTable registerClass:[ZLChatMessageCell class] forCellReuseIdentifier:leftChatCellIdentifier];
        [_chatTable registerClass:[ZLChatMessageCell class] forCellReuseIdentifier:rightChatCellIdentifier];
        [_chatTable registerClass:[ZLChatTimeTableViewCell class] forCellReuseIdentifier:chatTimeCellIdentifier];
        _chatTable.delegate = self;
        _chatTable.dataSource = self;
        _chatTable.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
        _chatTable.separatorStyle = UITableViewCellSelectionStyleNone;
        _chatTable.backgroundColor = HEXCOLOR(KStand_bkg_color);
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureBegin)];
        
        [_chatTable addGestureRecognizer:tapGesture];
        
        
    }
    return _chatTable;
    
}


- (NSMutableArray *)chatFakeMessages
{
    if (_chatFakeMessages == nil) {
        _chatFakeMessages = [[NSMutableArray alloc]init];
//        [_chatFakeMessages addObjectsFromArray:[ZLChatDataSourceHelper getFakeMessages]];
    }
    return _chatFakeMessages;
}



- (void)dealloc
{
    [self.chatTable removeObserver:self forKeyPath:@"contentSize"];
    [_keyBoardView removeObserver:self forKeyPath:@"keyBoardDetalChange"];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)left_button_event:(UIButton *)sender{
    
    [super left_button_event:sender];
    
    if (clientSocket && [clientSocket isConnected]) {
        [clientSocket disconnect];
    }
    
    
}


- (NSMutableAttributedString *)setTitle{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:@"小智Rebot"];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,string.length)];
    
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18] range:NSMakeRange(0, string.length)];
    
    return string;
}


@end
