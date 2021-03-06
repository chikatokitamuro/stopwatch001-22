//
//  ViewController.m
//  stopwatch001-2
//
//  Created by chikatokitamuro on 2016/01/12.
//  Copyright © 2016年 chikatokitamuro. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()
{
    // 時刻を表示するためのラベルインスタンスを格納するための変数
    UILabel *timeLabel;
    
    // 背景画像を表示するためのイメージビューインスタンスを格納するための変数
    UIImageView *backgroundView;
    UIButton *aButton;
    UIButton *rButton;
    UIButton *sButton;
    
    //タイマーを格納する変数を宣言
    NSTimer *atimer;
    NSInteger countNumber;
}
@end

@implementation ViewController



- (void)setupParts{
    // 背景画像を設定
    backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 280)];
    // 画像を設定
    backgroundView.image = [UIImage imageNamed:@"bonb1.png"];
    // イメージビューを画面に貼付ける
    [self.view addSubview:backgroundView];
    // ラベルを作成
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    // ラベルの位置を中心で設定
    timeLabel.center = CGPointMake(160, 350);
    // ラベルに表示するフォントと文字サイズの設定
    timeLabel.font = [UIFont fontWithName:@"HiraKakuProN-W6" size:48];
    // ラベルに表示する文字を設定
    timeLabel.text = @"00:00";
    timeLabel.textColor = [UIColor redColor];
    // ラベルの文字寄せを設定
    timeLabel.textAlignment = NSTextAlignmentCenter;
    // ラベルの背景色を透明に設定
    timeLabel.backgroundColor = [UIColor clearColor];
    // ラベルを画面に貼付ける
    [self.view addSubview:timeLabel];
    
    //スタートボタン　ストップボタン　リセットボタン　を作る
    aButton = [UIButton buttonWithType:UIButtonTypeSystem];
    aButton.frame = CGRectMake(30, 200, 100, 50);
    aButton.center = CGPointMake(100, 450);
    aButton.tintColor = [UIColor redColor];
    aButton.backgroundColor = [UIColor greenColor];
    [aButton setTitle:@"スタート" forState:UIControlStateNormal];
    [self.view addSubview:aButton];
    [aButton addTarget:self action:@selector(timerStart:)
      forControlEvents:UIControlEventTouchUpInside];
    
    
    sButton = [UIButton buttonWithType:UIButtonTypeSystem];
    sButton.frame = CGRectMake(30, 200, 100, 50);
    sButton.center = CGPointMake(100, 500);
    sButton.tintColor = [UIColor redColor];
    sButton.backgroundColor = [UIColor greenColor];
    [sButton setTitle:@"ストップ" forState:UIControlStateNormal];
    [self.view addSubview:sButton];
    [sButton addTarget:self action:@selector(timerStop:)
      forControlEvents:UIControlEventTouchUpInside];
    
    
    rButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rButton.frame = CGRectMake(100, 200, 100, 50);
    rButton.center = CGPointMake(200, 450);
    rButton.tintColor = [UIColor greenColor];
    rButton.backgroundColor = [UIColor redColor];
    [rButton setTitle:@"リセット" forState:UIControlStateNormal];
    [self.view addSubview:rButton];
    [rButton addTarget:self action:@selector(timerReset:)
      forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)setCurrentTime{
    // 現在の時刻の情報を取ってくる
    NSDate *aDate = [NSDate date];
    
    // 現在の時刻を表示できる形式に変換する
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateStyle:NSDateFormatterNoStyle];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    NSString *dateStr = [formatter stringFromDate:aDate];
    
    // ラベルに現在時刻を表示
    [timeLabel setText:dateStr];
    
    
}-(void)timerStop:(id)sender{
    if (atimer != nil){
        [atimer invalidate];
        atimer = nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // ラベルとイメージビューを作成するメソッドを呼び出す
    [self setupParts];
    
    
    countNumber = 0;
    
    //タイマーインスタンスを作成
    atimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
    
    
}
-(void)tick:(NSTimer*)timer{
    
    //タイマーが起動した時に起動するメソッドを書く
    NSDate *now=[NSDate date];    //現在の時間を取得
    // tick.text = [NSString stringWithFormat:@"%.2f",[now timeIntervalSinceDate:stdate]];
    //同じようにtimeLabelにtimer変数を表示させる
    
    [timeLabel setText:@"00:00"];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

