//
//  FilteredImageCollectionViewCell.h
//  Blocstagram
//
//  Created by Matt Krueger on 7/18/15.
//  Copyright (c) 2015 Matt Krueger. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media;

@interface FilteredImageCollectionViewCell : UICollectionViewCell

- (void)setImage:(UIImage *)image;
- (void)setTitle:(NSString *)title;

@end
