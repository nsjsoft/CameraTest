//
//  ViewController.m
//  CameraTest
//
//  Created by metanet on 2022/03/29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    
    NSLog(@"didFinishPickingMediaWithInfo");
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        self.imageView.image = image;
        if(_newMedia) {
            UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
        }
    } else if([mediaType isEqualToString:(NSString *)kUTTypeMovie]) {
        NSURL *url = [info objectForKey:UIImagePickerControllerMediaURL];
        UISaveVideoAtPathToSavedPhotosAlbum(url.path, nil, nil, nil);
    }
    
    //UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)userCameraRoll:(UIBarButtonItem *)sender {
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    imagePicker.mediaTypes = [NSArray arrayWithObjects:
                              (NSString *)kUTTypeImage,
                              nil];
    imagePicker.allowsEditing = NO;
    
    [self presentViewController:imagePicker animated:YES
                     completion:^{
        NSLog(@"앨범 띄우기 성공");
    }];
    
    _newMedia = YES;
    
}

- (IBAction)userCamera:(UIBarButtonItem *)sender {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                  (NSString *)kUTTypeImage,
                                  nil];
        imagePicker.allowsEditing = NO;
        
        [self presentViewController:imagePicker animated:YES
                         completion:^{
            NSLog(@"카메라 띄우기 성공");
        }];
        
        _newMedia = YES;
        
    } else {
        NSLog(@"카메라 안됨!!!");
    }
}

@end
