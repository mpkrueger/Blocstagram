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

@property (nonatomic, strong) Media *filterItem;

@end
