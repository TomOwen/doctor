//
//  PsychologistViewController.m
//  Psychologist
//
//  Created by Tom Owen on 4/29/12.
//  Copyright (c) 2012 Owen & Owen. All rights reserved.
//

#import "PsychologistViewController.h"
#import "HappinessViewController.h"
@interface PsychologistViewController ()
@property (nonatomic) int diagnosis;
@end

@implementation PsychologistViewController
@synthesize diagnosis = _diagnosis;
- (void) setAndShowDiagnosis:(int)diagnosis{
    // ? below
    //_diagnosis = diagnosis;
    // direct segue via code
    [self performSegueWithIdentifier:@"ShowDiagnosis" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowDiagnosis"]) {
        // run the sethappiness method in the ShowDiagnosis view
        [segue.destinationViewController setHappiness:self.diagnosis];
    } else if ([segue.identifier isEqualToString:@"woosy"]) {
        [segue.destinationViewController setHappiness:20];
    } else if ([segue.identifier isEqualToString:@"runny"]) {
        [segue.destinationViewController setHappiness:50]; 
    } else if ([segue.identifier isEqualToString:@"ned"]) {
        [segue.destinationViewController setHappiness:100]; 
        }
}
- (IBAction)flying {
    [self setAndShowDiagnosis:85];
}
- (IBAction)apple {
     [self setAndShowDiagnosis:100];
}
- (IBAction)gragons {
     [self setAndShowDiagnosis:20];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
