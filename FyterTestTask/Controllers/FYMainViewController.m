//
//  ViewController.m
//  FyterTestTask
//
//  Created by Amin Ur Rehman on 05/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import "FYMainViewController.h"

@interface FYMainViewController ()
@property (weak, nonatomic) IBOutlet UITextField *uidTextField;
@property (weak, nonatomic) IBOutlet UITextField *apiKeyTextField;
@property (weak, nonatomic) IBOutlet UITextField *appIdTextField;
@property (strong,nonatomic) FYDataSource *dataSource;
@end

@implementation FYMainViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (FYDataSource *)dataSource {
    if(!_dataSource) {
        _dataSource = [[FYDataSource alloc] init];
        _dataSource.delegate = self;
    }
    return _dataSource;
}

#pragma mark - FYDataSourceDelegate
- (void)offerUpdatedWithItems:(NSArray *)itemsList {
    
    NSLog(@"%@",itemsList);
}

#pragma mark - Actions
- (IBAction)submitButton:(id)sender {
    NSString *uid = self.uidTextField.text;
    NSString *apiKey = self.apiKeyTextField.text;
    NSString *appId = self.appIdTextField.text;
    
    [self.dataSource retrieveOffersWithUid:uid apiKey:apiKey appId:appId];
}

@end
