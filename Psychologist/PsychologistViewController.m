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
    [self performSegueWithIdentifier:@"ShowDiagnosis" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowDiagnosis"]) {
        // run the sethappiness method in the ShowDiagnosis view
        [segue.destinationViewController setHappiness:self.diagnosis];
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
