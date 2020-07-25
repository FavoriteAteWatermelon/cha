//
//  itemCell.m
//  chat
//
//  Created by 小仙女 guluoyan.cn on 2020/7/23.
//  Copyright © 2020 小仙女 guluoyan.cn. All rights reserved.
//

#import "itemCell.h"
#import "CellModel.h"
@interface itemCell()
@property(nonatomic,weak)UIImageView *avatarImage;
@property(nonatomic,weak)UILabel *msg;
@end


@implementation itemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UIImageView *iconImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconImageView];
        self.avatarImage = iconImageView;
        UILabel *avatarLabel =[[UILabel alloc]init];
        avatarLabel.font=[UIFont systemFontOfSize:16];
         avatarLabel.numberOfLines = 0;
        [self.contentView addSubview:avatarLabel];
        self.msg = avatarLabel;
        
        
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.avatarImage.frame = self.chatModel.avatarF;
    self.msg.frame = self.chatModel.chatMsgF;
//    self.contentView.backgroundColor = [UIColor colorWithRed:240/ 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:1];
//    UILabel *label = [UILabel new];
////    label.text=self.msg;
//    label.frame=CGRectMake(0, 0, 200, 100);
//    [self.contentView addSubview:label];
    
}
-(void)setChatModel:(CellModel *)chatModel{
    _chatModel=chatModel;
    self.avatarImage.image =[UIImage imageNamed:chatModel.avatar];
    self.msg.text = chatModel.chatMsg;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
