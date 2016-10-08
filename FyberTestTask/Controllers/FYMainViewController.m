//
//  ViewController.m
//  FyberTestTask
//
//  Created by Amin Ur Rehman on 05/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import "FYMainViewController.h"
#import "FYOffersTableViewController.h"

@interface FYMainViewController ()
@property (weak, nonatomic) IBOutlet UITextField *uidTextField;
@property (weak, nonatomic) IBOutlet UITextField *apiKeyTextField;
@property (weak, nonatomic) IBOutlet UITextField *appIdTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *mainViewActivityIndicator;
@property (strong,nonatomic) FYDataSource *dataSource;
@property (copy,nonatomic) NSArray *offerItems;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"offersViewSegue"]) {
        
        FYOffersTableViewController *offersViewController = (FYOffersTableViewController *)segue.destinationViewController;
        [offersViewController setOfferItemsList:self.offerItems];
        
    }
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
    [self enableUserInteraction];
    
    if([itemsList count] == 0) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Offers", nil)
                                                                                 message:NSLocalizedString(@"No offers found!", nil)
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
        return;
        
    }
    
    self.offerItems = itemsList;
    [self performSegueWithIdentifier:@"offersViewSegue" sender:self];
}

#pragma mark - Actions
- (IBAction)submitButton:(id)sender {
    NSString *uid = self.uidTextField.text;
    NSString *apiKey = self.apiKeyTextField.text;
    NSString *appId = self.appIdTextField.text;
    
    if(self.dataSource.delegate) {
        [self disableUserInteraction];
    }

    [self.dataSource retrieveOffersWithUid:uid apiKey:apiKey appId:appId];
}


#pragma mark - Private
- (void) disableUserInteraction {
    [self.mainViewActivityIndicator startAnimating];
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
}

- (void) enableUserInteraction {
    [self.mainViewActivityIndicator stopAnimating];
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];
}

@end
