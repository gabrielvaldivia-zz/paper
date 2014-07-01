//
//  FeedViewController.m
//  paper
//
//  Created by Gabriel Valdivia on 6/28/14.
//  Copyright (c) 2014 Gabriel Valdivia. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *newsScrollView;
@property (weak, nonatomic) IBOutlet UIView *feed;
@property (weak, nonatomic) IBOutlet UIImageView *headlineImageView;
- (void)onHeadlineDrag:(UIPanGestureRecognizer *)panGestureRecognizer;
- (void)onNewsDrag: (UIPanGestureRecognizer *)newsPanGestureRecognizer;

@end

@implementation FeedViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.newsScrollView.contentSize = CGSizeMake(2568, 254);
    [self setNeedsStatusBarAppearanceUpdate];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onHeadlineDrag:)];
    [self.headlineImageView addGestureRecognizer:panGestureRecognizer];
    
    UIPanGestureRecognizer *newsPanGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onNewsDrag:)];
    [self.newsScrollView addGestureRecognizer:newsPanGestureRecognizer];

}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)onNewsDrag: (UIPanGestureRecognizer *)newsPanGestureRecognizer {
    if (newsPanGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        
    }
    
    else if (newsPanGestureRecognizer.state == UIGestureRecognizerStateEnded){
        
    }
}


- (void)onHeadlineDrag:(UIPanGestureRecognizer *)panGestureRecognizer {

    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        // Start of the gesture.
        // You could remove any layout constraints that interfere
        // with changing of the position of the content view.
    }
    
    else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        // Calculate new center of the view based on the gesture recognizer's
        // translation.
        
        CGPoint newCenter = _feed.center;
        newCenter.y += [panGestureRecognizer translationInView:self.view].y;
        
        // Set the new center of the view.
        _feed.center = newCenter;
        
        // Reset the translation of the recognizer.
        [panGestureRecognizer setTranslation:CGPointZero inView:self.view];
    }
    
    else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        
        CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
        NSLog(@"Velocity %@",NSStringFromCGPoint(velocity));
        
        
        
        if (velocity.y <0) {
            [UIView animateWithDuration:.3 animations:^{
                self.feed.frame = CGRectMake(self.feed.frame.origin.x, 0, self.feed.frame.size.width, self.feed.frame.size.height);
            }];
        }
        
        else if (velocity.y >0) {
                
                [UIView animateWithDuration:.8 delay:0 usingSpringWithDamping:.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    self.feed.frame = CGRectMake(self.feed.frame.origin.x, 520, self.feed.frame.size.width, self.feed.frame.size.height);
                } completion:nil
                 ];
        };
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
