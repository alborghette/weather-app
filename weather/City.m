//
//  City.m
//  weather
//
//  Created by Murilo Alborghette on 25/06/17.
//  Copyright © 2017 Murilo Alborghette. All rights reserved.
//

#import "City.h"

@implementation City

static NSString * const kIdentifierKey = @"id";
static NSString * const kNameKey	   = @"name";

- (instancetype)initWithJson:(NSDictionary *)json {
	self = [super init];
	
	if (self) {
		int identifier = -1;
		if (json[kIdentifierKey] != nil) {
			identifier = [json[kIdentifierKey] intValue];
		}
		
		
		NSString *name = nil;
		if (json[kNameKey] != nil) {
			name = json[kNameKey];
		}
		
		self.name		= name;
		self.identifier = identifier;
	}
	
	return self;
}

@end
