/*
 PVIntroOnboardPage.m
 PVOnboardKitExample
 
 Copyright 2017 Victor Peschenkov
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 of the Software, and to permit persons to whom the Software is furnished to do
 so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "PVIntroOnboardPage.h"
#import "PVIntroOnboardPage_Private.h"

@interface PVIntroOnboardPage ()

@end

@implementation PVIntroOnboardPage

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.font = [UIFont systemFontOfSize:17.0f];
        _titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_titleLabel];
        
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        
        _subtitleLabel = [[UILabel alloc] init];
        _subtitleLabel.numberOfLines = 0;
        _subtitleLabel.textAlignment = NSTextAlignmentCenter;
        _subtitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _subtitleLabel.font = [UIFont systemFontOfSize:16.0f];
        _subtitleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_subtitleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize titleLabelSize = [self.titleLabel sizeThatFits:CGSizeMake(self.bounds.size.width - 48.0f, CGFLOAT_MAX)];
    self.titleLabel.frame = CGRectMake((self.bounds.size.width - titleLabelSize.width) / 2.0f,
                                       self.bounds.size.height * 0.14f - titleLabelSize.height,
                                       titleLabelSize.width,
                                       titleLabelSize.height);
    
    CGFloat imageViewHeightScale = (self.bounds.size.height * 0.56f) / self.imageView.image.size.height;
    self.imageView.frame = CGRectMake(fabs((self.imageView.image.size.width * imageViewHeightScale) - self.bounds.size.width) / 2.0f,
                                      CGRectGetMaxY(self.titleLabel.frame),
                                      self.imageView.image.size.width * imageViewHeightScale,
                                      self.imageView.image.size.height * imageViewHeightScale);
    
    CGSize subtitleLabelSize = [self.subtitleLabel sizeThatFits:CGSizeMake(self.bounds.size.width - 48.0f, CGFLOAT_MAX)];
    CGFloat subtitleYPosition = CGRectGetMaxY(self.imageView.frame) + ((self.bounds.size.height * 0.18f - subtitleLabelSize.height) / 2.0f);
    self.subtitleLabel.frame = CGRectMake((self.bounds.size.width - subtitleLabelSize.width) / 2.0f,
                                          subtitleYPosition,
                                          subtitleLabelSize.width,
                                          subtitleLabelSize.height);
}

#pragma mark - Public Methods

- (NSString *)title {
    return self.titleLabel.text;
}

- (void)setTitle:(NSString *)title {
    NSParameterAssert(title);
    self.titleLabel.text = title;
}

- (NSString *)subtitle {
    return self.subtitleLabel.text;
}

- (void)setSubtitle:(NSString *)subtitle {
    NSParameterAssert(subtitle);
    self.subtitleLabel.text = subtitle;
}

- (UIImage *)image {
    return self.imageView.image;
}

- (void)setImage:(UIImage *)image {
    NSParameterAssert(image);
    self.imageView.image = image;
}

@end
