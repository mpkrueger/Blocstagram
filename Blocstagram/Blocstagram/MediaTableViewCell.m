//
//  MediaTableViewCell.m
//  Blocstagram
//
//  Created by Matt Krueger on 6/21/15.
//  Copyright (c) 2015 Matt Krueger. All rights reserved.
//

#import "MediaTableViewCell.h"
#import "Media.h"
#import "Comment.h"
#import "User.h"

@interface MediaTableViewCell ()

@property (nonatomic, strong) UIImageView *mediaImageView;
@property (nonatomic, strong) UILabel *usernameAndCaptionLabel;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) NSLayoutConstraint *imageHeightConstraint;
@property (nonatomic, strong) NSLayoutConstraint *usernameAndCaptionLabelHeightConstraint;
@property (nonatomic, strong) NSLayoutConstraint *commentLabelHeightConstraint;

@end

static UIFont *lightFont;
static UIFont *boldFont;
static UIColor *usernameLabelGray;
static UIColor *commentLabelGray;
static UIColor *linkColor;
static NSParagraphStyle *paragraphStyle;

@implementation MediaTableViewCell

+ (void)load {
    lightFont = [UIFont fontWithName:@"HelveticaNeue-Thin" size:11];
    boldFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
    usernameLabelGray = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1];
    commentLabelGray = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1];
    linkColor = [UIColor colorWithRed:0.345 green:0.314 blue:0.427 alpha:1];
    
    NSMutableParagraphStyle *mutableParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    mutableParagraphStyle.headIndent = 20.0;
    mutableParagraphStyle.firstLineHeadIndent = 20.0;
    mutableParagraphStyle.tailIndent = -20.0;
    mutableParagraphStyle.paragraphSpacingBefore = 5;
    
    paragraphStyle = mutableParagraphStyle;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.mediaImageView = [[UIImageView alloc] init];
        self.usernameAndCaptionLabel = [[UILabel alloc] init];
        self.usernameAndCaptionLabel.numberOfLines = 0;
        self.usernameAndCaptionLabel.backgroundColor = usernameLabelGray;
        
        self.commentLabel = [[UILabel alloc] init];
        self.commentLabel.numberOfLines = 0;
        self.commentLabel.backgroundColor = commentLabelGray;
        
        for (UIView *view in @[self.mediaImageView, self.usernameAndCaptionLabel, self.commentLabel]) {
            [self.contentView addSubview:view];
            view.translatesAutoresizingMaskIntoConstraints = NO;
        }
        
        NSDictionary *viewDictionary = NSDictionaryOfVariableBindings(_mediaImageView, _usernameAndCaptionLabel, _commentLabel);
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_mediaImageView]|" options:kNilOptions metrics:nil views:viewDictionary]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_usernameAndCaptionLabel]|" options:kNilOptions metrics:nil views:viewDictionary]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_commentLabel]|" options:kNilOptions metrics:nil views:viewDictionary]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_mediaImageView][_usernameAndCaptionLabel][_commentLabel]" options:kNilOptions metrics:nil views:viewDictionary]];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSAttributedString *) usernameAndCaptionString {
    CGFloat usernameFontSize = 15;
    NSString *baseString = [NSString stringWithFormat:@"%@ %@", self.mediaItem.user.userName, self.mediaItem.caption];
    
    NSMutableAttributedString *mutableUsernameAndCaptionString = [[NSMutableAttributedString alloc] initWithString:baseString attributes:@{NSFontAttributeName : [lightFont fontWithSize:usernameFontSize], NSParagraphStyleAttributeName : paragraphStyle}];
    
    NSRange usernameRange = [baseString rangeOfString:self.mediaItem.user.userName];
    NSRange captionRange = [baseString rangeOfString:self.mediaItem.caption];
    [mutableUsernameAndCaptionString addAttribute:NSFontAttributeName value:[boldFont fontWithSize:usernameFontSize] range:usernameRange];
    [mutableUsernameAndCaptionString addAttribute:NSForegroundColorAttributeName value:linkColor range:usernameRange];
    [mutableUsernameAndCaptionString addAttribute:NSKernAttributeName value:[NSNumber numberWithInt:(2)] range:captionRange];
    
    return mutableUsernameAndCaptionString;
}

- (NSAttributedString *) commentString {
    NSMutableAttributedString *commentString = [[NSMutableAttributedString alloc] init];
    
    for (Comment *comment in self.mediaItem.comments) {
        // Make a string that says "username comment" followed by a line break
        NSString *baseString = [NSString stringWithFormat:@"%@ %@\n", comment.from.userName, comment.text];
        
       
        
        // Make an attributed string, with the "username" bold
        NSMutableAttributedString *oneCommentString = [[NSMutableAttributedString alloc] initWithString:baseString attributes:@{NSFontAttributeName : lightFont, NSParagraphStyleAttributeName : paragraphStyle}];
        
        
        
        NSRange usernameRange = [baseString rangeOfString:comment.from.userName];
        NSRange commentRange = [baseString rangeOfString:comment.text];

        [oneCommentString addAttribute:NSFontAttributeName value:boldFont range:usernameRange];
        
        if (comment == self.mediaItem.comments[0]) {
            [oneCommentString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:commentRange];
        }
        
        NSMutableParagraphStyle *rightAlign = [[NSMutableParagraphStyle alloc] init];
        [rightAlign setAlignment:NSTextAlignmentRight];
        
        if ([self.mediaItem.comments indexOfObject:comment] % 2 == 1) {
            [oneCommentString addAttribute:NSParagraphStyleAttributeName value:rightAlign range:NSMakeRange(0, [oneCommentString length])];
            NSLog(@"Comment %lu", [self.mediaItem.comments indexOfObject:comment]);
        }
        
        [oneCommentString addAttribute:NSForegroundColorAttributeName value:linkColor range:usernameRange];
        
        [commentString appendAttributedString:oneCommentString];
    }
    
    return commentString;
}


- (void) layoutSubviews {
    [super layoutSubviews];
    
    CGFloat imageHeight = self.mediaItem.image.size.height > 0 ? self.mediaItem.image.size.height / self.mediaItem.image.size.width * CGRectGetWidth(self.contentView.bounds) : 0;
    self.mediaImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.bounds), imageHeight);
    
    CGSize sizeOfUsernameAndCaptionLabel = [self sizeOfString:self.usernameAndCaptionLabel.attributedText];
    self.usernameAndCaptionLabel.frame = CGRectMake(0, CGRectGetMaxY(self.mediaImageView.frame), CGRectGetWidth(self.contentView.bounds), sizeOfUsernameAndCaptionLabel.height);
    
    CGSize sizeOfCommentLabel = [self sizeOfString:self.commentLabel.attributedText];
    self.commentLabel.frame = CGRectMake(0, CGRectGetMaxY(self.usernameAndCaptionLabel.frame), CGRectGetWidth(self.bounds), sizeOfCommentLabel.height);
    
    self.separatorInset = UIEdgeInsetsMake(0, CGRectGetWidth(self.bounds)/2.0, 0, CGRectGetWidth(self.bounds)/2.0);
}

- (void) setMediaItem:(Media *)mediaItem {
    _mediaItem = mediaItem;
    self.mediaImageView.image = _mediaItem.image;
    self.usernameAndCaptionLabel.attributedText = [self usernameAndCaptionString];
    self.commentLabel.attributedText = [self commentString];
}

+ (CGFloat) heightForMediaItem:(Media *)mediaItem width:(CGFloat)width {
    MediaTableViewCell *layoutCell = [[MediaTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"layoutCell"];
    
    layoutCell.frame = CGRectMake(0, 0, width, CGFLOAT_MAX);
    
    layoutCell.mediaItem = mediaItem;
    
    [layoutCell layoutSubviews];
    
    return CGRectGetMaxY(layoutCell.commentLabel.frame);
}

@end
