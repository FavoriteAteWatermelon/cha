//
//  itemCell.h
//  chat
//
//  Created by 小仙女 guluoyan.cn on 2020/7/23.
//  Copyright © 2020 小仙女 guluoyan.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@class CellModel;
@interface itemCell : UITableViewCell
//@property(nonatomic,copy)NSString *msg;
@property(nonatomic,strong)CellModel *chatModel;
@end

NS_ASSUME_NONNULL_END
