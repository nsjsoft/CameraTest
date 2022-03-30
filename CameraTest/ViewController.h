//
//  ViewController.h
//  CameraTest
//
//  Created by metanet on 2022/03/29.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    UIImagePickerController *imagePicker;
}

@property BOOL newMedia;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)userCamera:(UIBarButtonItem *)sender;
- (IBAction)userCameraRoll:(UIBarButtonItem *)sender;

@end

