//
//  FYOfferTableViewCell.m
//  FyberTestTask
//
//  Created by Amin Ur Rehman on 06/10/2016.
//  Copyright © 2016 FyberTask. All rights reserved.
//

#import "FYOfferTableViewCell.h"

@interface FYOfferTableViewCell()
@end

@implementation FYOfferTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)prepareForReuse {
    [self.thumbnailPreview setImage:nil];
    [self.activityIndicator startAnimating];
}

#pragma mark - Public

- (void)setThumbailWithImageData:(NSData *)imageData {
    [self.thumbnailPreview setImage:[UIImage imageWithData:imageData]];
    [self.activityIndicator stopAnimating];
}

@end
