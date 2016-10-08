//
//  FYOffersTableViewController.m
//  FyberTestTask
//
//  Created by Amin Ur Rehman on 06/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import "FYOffersTableViewController.h"
#import "FYOfferTableViewCell.h"
#import "FYOfferItem.h"

@interface FYOffersTableViewController ()
@property (nonatomic, strong) NSURLSessionConfiguration *sessionConfig;
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation FYOffersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Lazy loading
- (NSURLSession *)session {
    if(!_session) {
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:sessionConfig];
    }
    return _session;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.offerItemsList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130.0f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FYOfferTableViewCell *cell = (FYOfferTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    FYOfferItem *item = self.offerItemsList[[indexPath row]];
    
    [cell.titleLabel setText:item.title];
    [cell.teaserLabel setText:item.teaser];
    [cell.payoutLabel setText:[NSString stringWithFormat:@"%ld",item.payout]];

    
    if (cell.imageDownloadTask) {
        [cell.imageDownloadTask cancel];
    }
    
    [cell.activityIndicator startAnimating];
    [cell.imageView setImage:nil];
    
    NSURL *imageURL = [NSURL URLWithString:item.thumbnailURL];
    if (imageURL) {
        cell.imageDownloadTask = [self.session dataTaskWithURL:imageURL
                                         completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                      if (error) {
                                          NSLog(@"Error retrieving image thumbnail =  %@", error);
                                      }
                                      else {
                                          NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                          
                                          if (httpResponse.statusCode == 200) {
                                              
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  [cell setThumbailWithImageData:data];
                                              });
                                          }
                                          else {
                                              NSLog(@" Error retrieving image for thumbail. HTTP Response = %ld", httpResponse.statusCode);
                                          }
                                      }
                                  }];
        
        [cell.imageDownloadTask resume];
    }

    
    
    return cell;
}



@end
