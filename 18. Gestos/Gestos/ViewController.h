#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

//Tap
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
- (IBAction)handleTap:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *mico;

@property AVAudioPlayer * audiojejeje;
@property AVAudioPlayer * audioMordisco;
@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pinchGesture;
- (IBAction)handlePinch:(id)sender;

@property (strong, nonatomic) IBOutlet UIRotationGestureRecognizer *rotationGesture;
- (IBAction)handleRotation:(id)sender;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;
- (IBAction)handlePan:(id)sender;

- (IBAction)programarDesayuno:(id)sender;




@end

