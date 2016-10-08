//
//  FYOfferTableViewCell.h
//  FyberTestTask
//
//  Created by Amin Ur Rehman on 06/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYOfferTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *teaserLabel;
@property (weak, nonatomic) IBOutlet UILabel *payoutLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailPreview;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) NSURLSessionDataTask *imageDownloadTask;

- (void)setThumbailWithImageData:(NSData *)imageData;

@end
