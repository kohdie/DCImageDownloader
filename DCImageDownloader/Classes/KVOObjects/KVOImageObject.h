//
//  KVOImageObject.h
//  WYImageDownloader
//
//  Created by 岩出 広大 on 2015/01/24.
//  Copyright (c) 2015年 wyghur. All rights reserved.
//

#import <Foundation/Foundation.h>

/** KVOImageObject */
@interface KVOImageObject : NSObject

/** url */
@property (nonatomic, weak) NSString *url;
/** src */
@property (nonatomic, weak) NSData *src;

@end
