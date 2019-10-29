//
//  ViewController.m
//  daltonik
//
//  Created by Андрей Зябкин on 10.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Устанавливаем цвета и надписи кнопок
    [firstTestButton.leftImage setImage:[UIImage imageNamed:@"1btn"]];
    [firstTestButton.rightImage setImage:[UIImage imageNamed:@"3btn"]];
    
    [secondTestButton.leftImage setImage:[UIImage imageNamed:@"2btn"]];
    [secondTestButton.rightImage setImage:[UIImage imageNamed:@"up"]];
    
    [infoButton.leftImage setImage:[UIImage imageNamed:@"3btn"]];
    [infoButton.rightImage setImage:[UIImage imageNamed:@"1btn"]];
    
    firstTestButton.testNameLabel.text=@"Test";
    firstTestButton.testTextLabel.text=@"Comprehensive";
    
    secondTestButton.testNameLabel.text=@"Test";
    secondTestButton.testTextLabel.text=@"Into Shades";
    
    infoButton.testNameLabel.text=@"About";
    infoButton.testTextLabel.text=@"Program";
    infoButton.percentLabel.text=@"All";
    infoButton.correctLabel.text=@"Info";
    
    
    //Расставляем кнопки по сторонам
    if (!justStarted && firstTestButton.frame.origin.x!=self.view.frame.size.width){
        CGRect frame1 = firstTestButton.frame;
        CGRect frame2 = secondTestButton.frame;
        CGRect frame3 = infoButton.frame;
        frame1.origin.x = self.view.frame.size.width;
        frame2.origin.x = -self.view.frame.size.width;
        frame3.origin.x = self.view.frame.size.width;
        
        firstTestButton.frame = frame1;
        secondTestButton.frame = frame2;
        infoButton.frame = frame3;
    }
    
    justStarted=false;
    
    
    //Увеличиваем шрифты на iPad
    if (IPAD){
        //[appNameText setFont:[UIFont systemFontOfSize:100.0]];
        [appNameText setFont:[UIFont systemFontOfSize:100]];
        [appNameText2 setFont:[UIFont systemFontOfSize:50]];

    }
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    //Избавляемся от NaN
    if(isnan(Accuracy1))
        Accuracy1=0.0;
    if(isnan(Accuracy2))
        Accuracy2=0.0;
    
    //Установка процентов правильных ответов
    firstTestButton.percentLabel.text=[NSString stringWithFormat:@"%.0f%%",Accuracy1*100];
    secondTestButton.percentLabel.text=[NSString stringWithFormat:@"%.0f%%",Accuracy2*100];

}

//-(void) viewDidDisappear:(BOOL)animated {
//    if (firstTestButton.frame.origin.x==self.view.frame.size.width){
//        [UIView animateWithDuration:0.7 animations:^{
//            CGRect frame1 = self->firstTestButton.frame;
//            CGRect frame2 = self->secondTestButton.frame;
//            CGRect frame3 = self->infoButton.frame;
//
//            frame1.origin.x = 0;
//            frame2.origin.x = 0;
//            frame3.origin.x = 0;
//            
//            self->firstTestButton.frame = frame1;
//            self->secondTestButton.frame = frame2;
//            self->infoButton.frame = frame3;
//
//        }];
//    }
//}

-(void)viewDidAppear:(BOOL)animated {
    if (firstTestButton.frame.origin.x==self.view.frame.size.width){
        [UIView animateWithDuration:0.7 animations:^{
            CGRect frame1 = self->firstTestButton.frame;
            CGRect frame2 = self->secondTestButton.frame;
            CGRect frame3 = self->infoButton.frame;

            frame1.origin.x = 0;
            frame2.origin.x = 0;
            frame3.origin.x = 0;
            
            self->firstTestButton.frame = frame1;
            self->secondTestButton.frame = frame2;
            self->infoButton.frame = frame3;

        }];
    }
}


//Анимированное открытие теста
-(void)startAnimation:(NSInteger)testId{
    [UIView animateWithDuration:0.7 delay:0.1 options:0
                     animations:^
     {
        CGRect frame1 = self->firstTestButton.frame;
        CGRect frame2 = self->secondTestButton.frame;
        CGRect frame3 = self->infoButton.frame;
         
        CGRect frame4 = self->appNameText.frame;
        CGRect frame5 = self->appNameText2.frame;
         
         frame1.origin.x = self.view.frame.size.width;
         frame2.origin.x = -self.view.frame.size.width;
         frame3.origin.x = self.view.frame.size.width;
         
         frame4.origin.y = -frame4.size.height-frame4.origin.y;
         frame5.origin.y = -frame5.size.height-frame5.origin.y;
         
         //appNameText.frame=frame4;
         //appNameText2.frame=frame5;
         
        self->firstTestButton.frame = frame1;
        self->secondTestButton.frame = frame2;
        self->infoButton.frame = frame3;
         
     }
                     completion:^( BOOL completed )
     {
         switch (testId) {
             case 1:
                 [self performSegueWithIdentifier:@"showFirstTest" sender:self];
                 break;
             case 2:
                 [self performSegueWithIdentifier:@"showSecondTest" sender:self];
                 break;
                 
             default:
                 break;
         }
     }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Нажата кнопка первого теста
-(void)test1Pressed:(id)sender{
    [self startAnimation:1];
//    [self performSegueWithIdentifier:@"showFirstTest" sender:self];
}


//Нажата кнопка второго теста
-(void)test2Pressed:(id)sender{
    [self startAnimation:2];
//    [self performSegueWithIdentifier:@"showSecondTest" sender:self];
}

//Переход к инфо
-(void)showInfoScreen{
        [self performSegueWithIdentifier:@"showInfo" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIViewController *controller =segue.destinationViewController;
    controller.modalPresentationStyle = UIModalPresentationFullScreen;
}

@end
