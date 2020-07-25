//
//  CellModel.h
//  chat
//
//  Created by 小仙女 guluoyan.cn on 2020/7/24.
//  Copyright © 2020 小仙女 guluoyan.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellModel : NSObject
@property(nonatomic,copy) NSString *avatar;
@property(nonatomic,copy) NSString *chatMsg;
@property(nonatomic,assign)CGRect avatarF;
@property(nonatomic,assign)CGRect chatMsgF;
@property(nonatomic,assign)CGFloat cellHeight;
@end

NS_ASSUME_NONNULL_END
