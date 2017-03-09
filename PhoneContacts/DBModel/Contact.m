//
//  Contact.m
//  PhoneContacts
//
//  Created by Abdul Wahid on 3/9/17.
//  Copyright © 2017 GLOBAL RESCUE. All rights reserved.
//

#import "Contact.h"
#import "Email.h"
#import "Phone.h"

@implementation Contact

/*
-(NSArray*)getPhoneNumbers {
    //return [[[Phone query] whereWithFormat:@"leadId = %@",self.Id] fetch];
}

-(NSArray*)getEmails {
    //return [[[Email query] whereWithFormat:@"leadId = %@",self.Id] fetch];
}
 */

-(NSString*)displayName {
    NSString *spaceString = ![self.firstName isEqualToString:@""] && ![self.lastName isEqualToString:@""] ? @" " : @"";
    NSString *displayName = [NSString stringWithFormat:@"%@%@%@",self.firstName,spaceString,self.lastName];
    
    if ([displayName isEqualToString:@""]) {
        for (Email *emailInfo in self.emails) {
            return emailInfo.email;
        }
        
        for (Phone *phoneInfo in self.phoneNumbers) {
            return phoneInfo.phoneNumber;
        }
    }
    return displayName;
}


@end
