//
//  Member.m
//  MeetMeUp
//
//  Created by Dave Krawczyk on 9/8/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "Member.h"

@implementation Member

- (instancetype)initWIthMemberID:(NSString *)memberID {
    self = [super init];

    if (self) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.meetup.com/2/member/%@?&sign=true&photo-host=public&page=20&key=3853273671c11671c707f524a249",memberID]];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            self.name = dictionary[@"name"];
            self.state = dictionary[@"state"];
            self.city = dictionary[@"city"];
            self.country = dictionary[@"country"];
            self.photoURL = [NSURL URLWithString:dictionary[@"photo"][@"photo_link"]];
         }];
    }
        return self;
    }

//- (void) retrieveDataFromMember: (NSString *)memberID withCompletion:(void(^)(Member *member))complete {
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.meetup.com/2/member/%@?&sign=true&photo-host=public&page=20&key=3853273671c11671c707f524a249",memberID]];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        Member *member = [[Member alloc]initWithDictionary:dict];
//        complete(member);
//    }];
//}

@end
