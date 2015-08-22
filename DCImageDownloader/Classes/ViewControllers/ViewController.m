//
//  ViewController.m
//  DCImageDownloader
//
//  Created by 岩出 広大 on 2015/08/22.
//  Copyright (c) 2015年 DevCafe. All rights reserved.
//

#import "ViewController.h"
#import "KVOImageObject.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *url;
@property (weak, nonatomic) IBOutlet UIButton *btnGet;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIButton *touchBtnGet;

@property (strong, nonatomic) KVOImageObject *imageObj;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageObj = [[KVOImageObject alloc] init];
    // KVOに登録
    [self.imageObj addObserver:self forKeyPath:@"src" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchBtnGet:(id)sender {
    NSLog(@"url:%@", self.url.text);
    NSURL* myURL = [NSURL URLWithString:self.url.text];
    NSURLRequest* myRequest = [NSURLRequest requestWithURL:myURL];
    // 画像を取得
    [NSURLConnection sendAsynchronousRequest:myRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *resp, NSData *data, NSError *error) {
        
        // ここでいきなりViewに詰めてしまうのではなくKVOを利用する
        //        UIImage* image = [[UIImage alloc] initWithData:data];
        //        self.viewImage.image = image;
        
        // Modelの内容を変更
        [self.imageObj setUrl:self.url.text];
        [self.imageObj setSrc:data];
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([object isKindOfClass:[KVOImageObject class]] && [keyPath isEqual:@"src"]) {
        // srcに変更があった場合はここにくる
        UIImage* image = [[UIImage alloc] initWithData:((KVOImageObject *)object).src];
        self.image.image = image;
    }
}

@end
