//
//  ViewController.m
//  TicTacToe
//
//  Created by Sonam Mehta on 1/10/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
    __weak IBOutlet UILabel *whichPlayerLabel;
    __weak IBOutlet UILabel *myLabelNine;
    __weak IBOutlet UILabel *myLabelEight;
    __weak IBOutlet UILabel *myLabelSeven;
    __weak IBOutlet UILabel *myLabelSix;
    __weak IBOutlet UILabel *myLabelFive;
    __weak IBOutlet UILabel *myLabelFour;
    __weak IBOutlet UILabel *myLabelThree;
    __weak IBOutlet UILabel *myLabelTwo;
    __weak IBOutlet UILabel *myLabelOne;
}

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGestureRecognizer

{
   if (tapGestureRecognizer.state == UIGestureRecognizerStateEnded)
   {
       NSString *symbol = @"X";
       UIColor *color = [UIColor blueColor];
       if ([whichPlayerLabel.text isEqualToString: @"Player 1"]) {
           symbol = @"X";
           color = [UIColor blueColor];
       }
       else {
           symbol = @"O";
           color = [UIColor redColor];
       }

       CGPoint point = [tapGestureRecognizer locationInView:self.view];
       UILabel *label = [self findLabelUsingPoint:point];
       if (label != nil)
       {
           label.text = symbol;
           label.textColor = color;
           NSString *winner = [NSString stringWithFormat:@"Congratulations! %@ is the winner!", [self whoWon]];
           if (winner != nil) {
               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Congratulations! %@ is the winner!" delegate:nil cancelButtonTitle:@"In your Face!" otherButtonTitles:@"New Game", nil];
               [alert show];
           }
           [self switchPlayer];
       }
   }
}

-(UILabel *)findLabelUsingPoint:(CGPoint)point
{
   
    if (CGRectContainsPoint(myLabelOne.frame, point)) {

        if ([myLabelOne.text isEqualToString:@"X"] == NO && [myLabelOne.text isEqualToString:@"O"] == NO) {
            return myLabelOne;
            }
    }
    if (CGRectContainsPoint(myLabelTwo.frame, point)) {
        if ([myLabelTwo.text isEqualToString:@"X"] == NO && [myLabelTwo.text isEqualToString:@"O"] == NO) {
            return myLabelTwo;
        }
    }
    if (CGRectContainsPoint(myLabelThree.frame, point)) {
        if ([myLabelThree.text isEqualToString:@"X"] == NO && [myLabelThree.text isEqualToString:@"O"] == NO) {
            return myLabelThree;
        }
    }
    if (CGRectContainsPoint(myLabelFour.frame, point)) {
        if ([myLabelFour.text isEqualToString:@"X"] == NO && [myLabelFour.text isEqualToString:@"O"] == NO) {
            return myLabelFour;
        }
    }
    if (CGRectContainsPoint(myLabelFive.frame, point)) {
        if ([myLabelFive.text isEqualToString:@"X"] == NO && [myLabelFive.text isEqualToString:@"O"] == NO) {
            return myLabelFive;
        }
    }
    if (CGRectContainsPoint(myLabelSix.frame, point)) {
        if ([myLabelSix.text isEqualToString:@"X"] == NO && [myLabelSix.text isEqualToString:@"O"] == NO) {
            return myLabelSix;
        }
    }
    if (CGRectContainsPoint(myLabelSeven.frame, point)) {
        if ([myLabelSeven.text isEqualToString:@"X"] == NO && [myLabelSeven.text isEqualToString:@"O"] == NO) {
            return myLabelSeven;
        }
    }
    if (CGRectContainsPoint(myLabelEight.frame, point)) {
        if ([myLabelEight.text isEqualToString:@"X"] == NO && [myLabelEight.text isEqualToString:@"O"] == NO) {
            return myLabelEight;
        }
    }
    if (CGRectContainsPoint(myLabelNine.frame, point)) {
        if ([myLabelNine.text isEqualToString:@"X"] == NO && [myLabelNine.text isEqualToString:@"O"] == NO) {
            return myLabelNine;
        }
    }
    return nil;
}

-(NSString *)whoWon
{
    NSString *whoWon = [self checkLabelsForWinner];
    if (whoWon != nil) {
        return whoWon;
    }
    return nil;
}

-(NSString *)checkLabelsForWinner
{
    if ([myLabelOne.text isEqualToString:@"Ω"]== NO && [myLabelOne.text isEqualToString:myLabelTwo.text]== YES && [myLabelTwo.text isEqualToString:myLabelThree.text] ==YES)
    {
        return myLabelOne.text;
    }
    if ([myLabelFour.text isEqualToString:@"Ω"]== NO &&[myLabelFour.text isEqualToString:myLabelFive.text]== YES && [myLabelFive.text isEqualToString:myLabelSix.text] ==YES)
    {
        return myLabelFive.text;
    }
    if ([myLabelSeven.text isEqualToString:@"Ω"]== NO &&[myLabelSeven.text isEqualToString:myLabelEight.text]== YES && [myLabelEight.text isEqualToString:myLabelNine.text] ==YES)
    {
        return myLabelSeven.text;
    }
    if ([myLabelOne.text isEqualToString:@"Ω"]== NO &&[myLabelOne.text isEqualToString:myLabelFour.text]== YES && [myLabelFour.text isEqualToString:myLabelSeven.text] ==YES)
    {
        return myLabelFour.text;
    }
    if ([myLabelTwo.text isEqualToString:@"Ω"]== NO &&[myLabelTwo.text isEqualToString:myLabelFive.text]== YES && [myLabelFive.text isEqualToString:myLabelEight.text] ==YES)
    {
        return myLabelFive.text;
    }
    if ([myLabelThree.text isEqualToString:@"Ω"]== NO &&[myLabelThree.text isEqualToString:myLabelSix.text]== YES && [myLabelSix.text isEqualToString:myLabelNine.text] ==YES)
    {
        return myLabelThree.text;
    }
    if ([myLabelFive.text isEqualToString:@"Ω"]== NO &&[myLabelOne.text isEqualToString:myLabelFive.text]== YES && [myLabelFive.text isEqualToString:myLabelNine.text] ==YES)
    {
        return myLabelNine.text;
    }
    if ([myLabelThree.text isEqualToString:@"Ω"]== NO &&[myLabelThree.text isEqualToString:myLabelFive.text]== YES && [myLabelFive.text isEqualToString:myLabelSeven.text] ==YES)
    {
        return myLabelSeven.text;
    }
    return nil;
    
}



- (void) switchPlayer
{
    if ([whichPlayerLabel.text isEqualToString:@"Player 1"] == YES) {
        whichPlayerLabel.text = @"Player 2";
    }
    else{
        whichPlayerLabel.text = @"Player 1";
    }
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
