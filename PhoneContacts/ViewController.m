//
//  ViewController.m
//  CoreDataTest
//
//  Created by Abdul Wahid on 3/8/17.
//  Copyright © 2017 GLOBAL RESCUE. All rights reserved.
//

#import "ViewController.h"
#import "KTSContactsManager.h"
#import "ParserContact.h"

@interface ViewController () <KTSContactsManagerDelegate>

@property (strong, nonatomic) KTSContactsManager *contactsManager;

@end

@implementation ViewController

bool isAddressBookAccessable;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSync];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma - mark private methods

-(void)performSync{
    
    self.contactsManager = [KTSContactsManager sharedManager];
    self.contactsManager.delegate = self;
    [self.contactsManager importContacts:^(NSArray *contacts) {
        
        NSMutableArray *modifiedArray = [[NSMutableArray alloc] init];
        ParserContact *contactParser = [[ParserContact alloc] init];
        NSMutableArray *parsedContacts = (NSMutableArray*)[contactParser parseDataFromArray:contacts];
        NSLog(@"completed");
    }];
}

@end
