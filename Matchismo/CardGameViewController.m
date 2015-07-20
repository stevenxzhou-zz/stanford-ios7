//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Steven on 7/19/15.
//  Copyright (c) 2015 edu.udel.steven. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()

@end

@implementation CardGameViewController

- (IBAction)touchCardButton:(UIButton *)sender {
    
    if ([sender.currentTitle length]) {
        UIImage *image = [UIImage imageNamed:@"cardback"];
        [sender setBackgroundImage:image forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        UIImage *image = [UIImage imageNamed:@"cardfront"];
        [sender setBackgroundImage:image forState:UIControlStateNormal];
        [sender setTitle:@"A♣️" forState:UIControlStateNormal];
    }
    
}

@end
