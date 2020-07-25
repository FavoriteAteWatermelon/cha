//
//  CellModel.m
//  chat
//
//  Created by 小仙女 guluoyan.cn on 2020/7/24.
//  Copyright © 2020 小仙女 guluoyan.cn. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel
-(CGFloat)cellHeight {
    if (_cellHeight == 0){
//        头像
        CGFloat avatarH = 40;
        CGFloat avatarW = 40;
        CGFloat space = 10;
        self.avatarF = CGRectMake(space, space, avatarW, avatarH);
//        消息
        CGFloat msgY = CGRectGetMaxX(self.avatarF) + space;
        CGFloat msgW = [UIScreen mainScreen].bounds.size.width - 2 * space;
        NSDictionary *textAttr = @{NSFontAttributeName:[UIFont systemFontOfSize:16]};
                         CGSize tSize = CGSizeMake(msgW, MAXFLOAT);
         CGFloat msgH = [self.chatMsg  boundingRectWithSize:tSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttr context:nil ].size.height;
        self.chatMsgF = CGRectMake(space, msgY, msgW, msgH);
        _cellHeight = self.chatMsgF.origin.y + self.chatMsgF.size.height + space;
    }
    return _cellHeight;
}
@end
