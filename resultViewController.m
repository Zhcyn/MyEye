//
//  resultViewController.m
//  daltonik
//
//  Created by Андрей Зябкин on 24.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import "resultViewController.h"

@interface resultViewController ()

@end

@implementation resultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Оформляем кнопку назад
    [backButton.backgroundImage setImage:[UIImage imageNamed:@"4btn"]];
    [backButton.nameOfButton setText:@"X"];
    
    
    //Скролл к началу текста
    [text scrollRangeToVisible:NSMakeRange(0, 0)];
    
    //Точность пройденного теста
    float accuracy=0.0;
    
    //Устаналиваем процент точности
    switch (numberOfTest) {
        case 1:{
            [progressBar setProgress:Accuracy1];
            accuracy=Accuracy1;
            break;
        }
        case 2:{
            [progressBar setProgress:Accuracy2];
            accuracy=Accuracy2;
            break;
        }
            break;
        default:
            accuracy=0.0;
            break;
    }
    
    //Пишем результат тестирования
    if (accuracy<=0.3){
        [text setText:@"Congratulations! You have finished testing. Unfortunately, the result is very bad, you have obvious problems with color recognition and vision in general, maybe you are color blind. We strongly recommend visiting a doctor. The results in this test with average indicators of vision quality should not fall below 60%."];
    }
    else if (accuracy>=0.3 && accuracy<=0.6){
        [text setText:@"Congratulations! You have finished testing. The result is poor, judging by the test results, you have noticeable problems with color recognition. We recommend that you try the test again, in case of a similar result, you should consult a doctor."];
    }
    else if (accuracy>=0.6 && accuracy<=0.9){
        [text setText:@"Congratulations! You have finished testing. A decent result, but there is a possibility of slight visual deviations, namely color recognition. To improve the results, we suggest re-testing more carefully, and also try yourself in the second test."];
    }
    else if (accuracy>=0.9){
        [text setText:@"Congratulations! You have finished testing. Great result, you definitely do not suffer from color blindness! Now test your eyes in the second test!"];
    }
    
    //Увеличиваем шрифты на iPad
    if(IPAD){
        [text setFont:[text.font fontWithSize:text.font.pointSize+10]];
        //[errorText setFont:[errorText.font fontWithSize:errorText.font.pointSize+10]];
        //[currentQuestionNum setFont:[currentQuestionNum.font fontWithSize:currentQuestionNum.font.pointSize+10]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Нажата кнопка закрытия теста
-(void)closePressed:(id)sender{
    NSLog(@"OK2");
    [self performSegueWithIdentifier:@"showMenu" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIViewController *controller =segue.destinationViewController;
    controller.modalPresentationStyle = UIModalPresentationFullScreen;
}

@end
