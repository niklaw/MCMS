//
//  CreatureViewController.m
//  MCMS
//
//  Created by Yash Varma on 1/14/14.
//  Copyright (c) 2014 Yash Varma - Nicholas Petersen. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
{

    __weak IBOutlet UILabel *name;
    __weak IBOutlet UITextField *nameTextField;
    
}

@end



@implementation CreatureViewController

@synthesize creature;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    name.text = creature.name;
	// Do any additional setup after loading the view.
}

- (IBAction)onEditButtonPressed:(id)sender
{
    name.alpha = 0;
    nameTextField.alpha = 1;
    nameTextField.text = creature.name;
}


- (IBAction)onSaveButtonPressed:(id)sender
{
    name.text = nameTextField.text;
    creature.name = nameTextField.text;
    name.alpha = 1;
    nameTextField.alpha = 0;

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
