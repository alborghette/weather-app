//
//  City.h
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property int identifier;
@property NSString *name;


- (instancetype)initWithJson:(NSDictionary *)json;

@end
