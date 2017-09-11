//
//  ZLChatMessageCell.m
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLChatMessageCell.h"
#import "BubbleTextView.h"
#import "BubblePhotoView.h"
#import "BubbleVoiceView.h"
#import "BubbleLocationView.h"
#import "BubbleVideoView.h"
#import "NSBundle+ZLKeyBoardExtension.h"
#import "ZLKeyBoardHelpDefine.h"
#import "UIView+Frame.h"
@implementation ZLChatMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUi];
    }
    
    return self;
}



- (void)setMessage:(ZLMessageModel *)message
{
    _message = message;
    
//    [self.avateImageV sd_setImageWithURL:[NSURL URLWithString:_message.avatarUrl] placeholderImage:nil];
    
    [self.avateImageV setImage:message.avatar];
    
    //气泡图左右处理不一样
    if (_message.isSender)
    {
        self.avateImageV.frame = CGRectMake(Main_Screen_Width-45-KLeftMargin, KTopMargin, 45, 45);
        self.bubbleImageV.image = [[NSBundle imageWithBundle:BundleName imageName:@"chat_sender_bg@2x"]stretchableImageWithLeftCapWidth:5 topCapHeight:35];
        
    }else
    {
        
        self.avateImageV.frame = CGRectMake(KLeftMargin, KTopMargin, 45, 45);
        self.bubbleImageV.image = [[NSBundle imageWithBundle:BundleName imageName:@"chat_receiver_bg@2x"]stretchableImageWithLeftCapWidth:35 topCapHeight:35];
    }
    
    
    //bubbleImageV中的视图是不确定的，所以不打算复用，每次赋值移除之前视图，重新加新视图
    [self.bubbleImageV.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    switch (self.message.bubbleMessageBodyType) {
        case MessageBodyTypeText: {
            
            BubbleTextView *bubbleView = [BubbleTextView BubbleTextView];
            bubbleView.message = message;
            [self.bubbleImageV addSubview:bubbleView];
            
            
            CGSize size = [BubbleTextView BubbleTextViewSize:message];
            
            
            //注意self.bubbleImageV是在内部bubble的size.width上增加间距定的frame
            if (_message.isSender) {
                self.bubbleImageV.frame = CGRectMake(CGRectGetMinX(self.avateImageV.frame)-(size.width+2*KLeftMargin),KTopMargin,size.width+2*KLeftMargin,size.height+2*KTopMargin);
                
            }else{
                self.bubbleImageV.frame = CGRectMake(CGRectGetMaxX(self.avateImageV.frame),KTopMargin,size.width+2*KLeftMargin,size.height+2*KTopMargin);
            }
            
            bubbleView.frame = CGRectMake(KLeftMargin, KTopMargin, size.width, size.height);
            
            break;
        }
        case MessageBodyTypePhoto: {
            BubblePhotoView *bubbleView = [BubblePhotoView BubblePhotoView];
            bubbleView.message = message;
            [self.bubbleImageV addSubview:bubbleView];
            
            
            CGSize size = [BubblePhotoView bubblePhotoWithMessage:message];
            
            
            //注意self.bubbleImageV是在内部bubble的size.width上增加间距定的frame
            if (_message.isSender) {
                self.bubbleImageV.frame = CGRectMake(CGRectGetMinX(self.avateImageV.frame)-(size.width+KSenderLeftBubbleImageMargin+KSenderRightBubbleImageMargin),KTopBubbleImageMargin,size.width+KSenderLeftBubbleImageMargin+KSenderRightBubbleImageMargin,size.height+2*KTopBubbleImageMargin);
                bubbleView.frame = CGRectMake(KSenderLeftBubbleImageMargin,KTopBubbleImageMargin, size.width, size.height);
            }else{
                self.bubbleImageV.frame = CGRectMake(CGRectGetMaxX(self.avateImageV.frame),KTopBubbleImageMargin,size.width+KReceiverLeftBubbleImageMargin+KReceiverRightBubbleImageMargin,size.height+2*KTopBubbleImageMargin);
                bubbleView.frame = CGRectMake(KReceiverLeftBubbleImageMargin,KTopBubbleImageMargin, size.width, size.height);
            }
            
            
            
            break;
        }
        case MessageBodyTypeVideo: {
            BubbleVideoView *bubbleView = [BubbleVideoView BubbleVideoView];
            bubbleView.message = message;
            [self.bubbleImageV addSubview:bubbleView];
            
            
            CGSize size = [BubbleVideoView bubbleVideoWithMessage:message];
            
            //注意self.bubbleImageV是在内部bubble的size.width上增加间距定的frame
            if (_message.isSender) {
                self.bubbleImageV.frame = CGRectMake(CGRectGetMinX(self.avateImageV.frame)-(size.width+KSenderLeftBubbleImageMargin+KSenderRightBubbleImageMargin),KTopBubbleImageMargin,size.width+KSenderLeftBubbleImageMargin+KSenderRightBubbleImageMargin,size.height+2*KTopBubbleImageMargin);
                bubbleView.frame = CGRectMake(KSenderLeftBubbleImageMargin,KTopBubbleImageMargin, size.width, size.height);
            }else{
                self.bubbleImageV.frame = CGRectMake(CGRectGetMaxX(self.avateImageV.frame),KTopBubbleImageMargin,size.width+KReceiverLeftBubbleImageMargin+KReceiverRightBubbleImageMargin,size.height+2*KTopBubbleImageMargin);
                bubbleView.frame = CGRectMake(KReceiverLeftBubbleImageMargin,KTopBubbleImageMargin, size.width, size.height);
            }
            
            break;
        }
        case MessageBodyTypeVoice: {
            
            BubbleVoiceView *bubbleView = [BubbleVoiceView BubbleVoiceView];
            bubbleView.message = message;
            [self.bubbleImageV addSubview:bubbleView];
            
            
            CGSize size = [BubbleVoiceView bubbleVoiceWithMessage:message];
            
            
            //注意self.bubbleImageV是在内部bubble的size.width上增加间距定的frame
            if (_message.isSender) {
                self.bubbleImageV.frame = CGRectMake(CGRectGetMinX(self.avateImageV.frame)-(size.width+2*KLeftMargin),KTopMargin,size.width+2*KLeftMargin,size.height+2*KTopMargin);
                
            }else{
                self.bubbleImageV.frame = CGRectMake(CGRectGetMaxX(self.avateImageV.frame),KTopMargin,size.width+2*KLeftMargin,size.height+2*KTopMargin);
            }
            
            bubbleView.frame = CGRectMake(KLeftMargin, KTopMargin, size.width, size.height);
            
            break;
        }
            
        case MessageBodyTypeLocation: {
            BubbleLocationView *bubbleView = [BubbleLocationView BubbleLocationView];
            bubbleView.message = message;
            [self.bubbleImageV addSubview:bubbleView];
            
            
            CGSize size = [BubbleLocationView BubbleLocationWithMessage:message];
            
            
            //注意self.bubbleImageV是在内部bubble的size.width上增加间距定的frame
            if (_message.isSender) {
                self.bubbleImageV.frame = CGRectMake(CGRectGetMinX(self.avateImageV.frame)-(size.width+2*KLeftMargin),KTopMargin,size.width+2*KLeftMargin,size.height+2*KTopMargin);
                
            }else{
                self.bubbleImageV.frame = CGRectMake(CGRectGetMaxX(self.avateImageV.frame),KTopMargin,size.width+2*KLeftMargin,size.height+2*KTopMargin);
            }
            
            bubbleView.frame = CGRectMake(KLeftMargin, KTopMargin, size.width, size.height);
            
            
            break;
        }
    }
}



- (void)setUpUi
{
    
    self.avateImageV = [[UIImageView alloc]init];
    self.avateImageV.image = self.message.avatar;
    self.avateImageV.layer.cornerRadius = 45.0/2;
    self.avateImageV.clipsToBounds = YES;
    
    
    
    self.bubbleImageV = [[UIImageView alloc]init];
    
    
    [self.contentView addSubview:self.avateImageV];
    [self.contentView addSubview:self.bubbleImageV];
    
}



+ (CGFloat)CellHeight:(ZLMessageModel *)message
{
    CGFloat avaterImageHeight = 45;
    
    
    CGFloat bubbleViewHeight = 0;
    switch (message.bubbleMessageBodyType) {
        case MessageBodyTypeText: {
            bubbleViewHeight = [BubbleTextView BubbleTextViewSize:message].height;
            bubbleViewHeight += KTopMargin*2;
            break;
        }
        case MessageBodyTypePhoto: {
            bubbleViewHeight = [BubblePhotoView bubblePhotoWithMessage:message].height;
            bubbleViewHeight += KTopMargin*2;
            break;
        }
        case MessageBodyTypeVideo: {
            bubbleViewHeight = [BubbleVideoView bubbleVideoWithMessage:message].height;
            bubbleViewHeight += KTopMargin*2;
            break;
        }
        case MessageBodyTypeVoice: {
            bubbleViewHeight = [BubbleVoiceView bubbleVoiceWithMessage:message].height;
            bubbleViewHeight += KTopMargin*2;
            break;
        }
            
        case MessageBodyTypeLocation: {
            bubbleViewHeight = [BubbleLocationView BubbleLocationWithMessage:message].height;
            bubbleViewHeight += KTopMargin*2;
            
            break;
        }
    }
    
    
    if (bubbleViewHeight<avaterImageHeight) {
        bubbleViewHeight = avaterImageHeight;
    }
    
    return KTopMargin+bubbleViewHeight+KTopMargin;
}



@end
