//
//  CardImageTableViewCell.m
//  deckOfCardsApi
//
//  Created by Douglas Voss on 7/13/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

#import "CardImageTableViewCell.h"

@interface CardImageTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;


@end

@implementation CardImageTableViewCell

- (void)updateWithCard:(Card *)card {
    self.cardImageView.image = [UIImage new];
    UILabel *loadingLabel = [UILabel new];
    loadingLabel.frame = self.cardImageView.frame;
    loadingLabel.text = @"Loading";
    [self.cardImageView addSubview:loadingLabel];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask =
    [session
     dataTaskWithURL:card.imageURL
     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
         
         if (!error)
         {
             dispatch_async(dispatch_get_main_queue(), ^{
                 self.cardImageView.image = [UIImage imageWithData:data];
                 [loadingLabel removeFromSuperview];
             });
         }
         else
         {
             loadingLabel.text = @"Error Loading";
             NSLog(@"%@", error.description);
         }
         
         // handle setting our image
    }];
    
    [dataTask resume];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
