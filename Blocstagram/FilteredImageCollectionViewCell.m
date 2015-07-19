//
//  FilteredImageCollectionViewCell.m
//  Blocstagram
//
//  Created by Matt Krueger on 7/18/15.
//  Copyright (c) 2015 Matt Krueger. All rights reserved.
//

#import "FilteredImageCollectionViewCell.h"
#import "Media.h"

@interface FilteredImageCollectionViewCell ()

@property (nonatomic, strong) UIImageView *filterImageView;
@property (nonatomic, strong) UILabel *filterTitle;

@end

@implementation FilteredImageCollectionViewCell

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.filterImageView = [[UIImageView alloc] init];
        self.filterTitle = [[UILabel alloc] init];
        
        for (UIView *view in @[self.filterImageView, self.filterTitle]) {
            [self.contentView addSubview:view];
        }
    }
    
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    CGFloat imageHeight = self.filterItem.image.size.height / self.filterItem.image.size.width * CGRectGetWidth(self.contentView.bounds);
    self.filterImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.bounds), imageHeight);
}


    
    //    static NSInteger imageViewTag = 1000;
    //    static NSInteger labelTag = 1001;
    //
    //    UIImageView *thumbnail = (UIImageView *)[cell.contentView viewWithTag:imageViewTag];
    //    UILabel *label = (UILabel *)[cell.contentView viewWithTag:labelTag];
    //
    //    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.filterCollectionView.collectionViewLayout;
    //    CGFloat thumbnailEdgeSize = flowLayout.itemSize.width;
    //
    //    if (!thumbnail) {
    //        thumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, thumbnailEdgeSize, thumbnailEdgeSize)];
    //        thumbnail.contentMode = UIViewContentModeScaleAspectFill;
    //        thumbnail.tag = imageViewTag;
    //        thumbnail.clipsToBounds = YES;
    //
    //        [cell.contentView addSubview:thumbnail];
    //    }
    //
    //    if (!label) {
    //        label = [[UILabel alloc] initWithFrame:CGRectMake(0, thumbnailEdgeSize, thumbnailEdgeSize, 20)];
    //        label.tag = labelTag;
    //        label.textAlignment = NSTextAlignmentCenter;
    //        label.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:10];
    //        [cell.contentView addSubview:label];
    //    }
    //
    //    thumbnail.image = self.filterImages[indexPath.row];
    //    label.text = self.filterTitles[indexPath.row];

//- (NSAttributedString *) filterTitleString {
//    return filterTitleString;
//}

- (void) setFilterItem:(Media *)filterItem {
    _filterItem = filterItem;
    self.filterImageView.image = _filterItem.image;
//    self.filterTitle.attributedText = [self filterTitleString];
}

@end
