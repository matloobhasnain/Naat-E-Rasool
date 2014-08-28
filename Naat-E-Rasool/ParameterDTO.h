//
//  ParameterDTO.h
//  Naat-E-Rasool
//
//  Created by Matloob Hasnain on 28/08/2014.
//  Copyright (c) 2014 terabyteLogixs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParameterDTO : NSObject

@property(assign)int sub_CategoryID;
@property(nonatomic,retain)NSString *content_Type;
@property(nonatomic,retain)NSString *language;
@property(assign)int offSet;
@end
