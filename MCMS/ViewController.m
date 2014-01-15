//
//  ViewController.m
//  MCMS
//
//  Created by Yash Varma on 1/14/14.
//  Copyright (c) 2014 Yash Varma - Nicholas Petersen. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

//atstoryboard "Use StoryBoard ID" box checked

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *creatures;
    __weak IBOutlet UITextField *magicalCreatureTextField;
    IBOutlet UITableView *myTableView;
    MagicalCreature *creature;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    creatures = [NSMutableArray array];
    
    creature = [[MagicalCreature alloc]init];
    creature.name = @"Dhalsim";
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Blanka";
    [creatures addObject:creature];

    creature = [MagicalCreature new];
    creature.name = @"M.Bison";
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Guile";
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Chun-Li";
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Ryu";
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Ken";
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Sagat";
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Akuma";
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Vega";
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Cammy";
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Maki";
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Sakura";
    [creatures addObject:creature];

    
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return creatures.count;
}


//Alters cell from queue
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Identifies the prototype cell we created earlier
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MCMSCellID"];
    MagicalCreature *myCreature = creatures[indexPath.row];
    
    cell.textLabel.text = myCreature.name;
    
    return cell;
}




- (IBAction)onAddButtonPressed:(id)sender
{
    creature = [MagicalCreature new];
    creature.name = magicalCreatureTextField.text;
    [creatures addObject:creature];
    
    [myTableView reloadData];
    magicalCreatureTextField.text = nil;
    [magicalCreatureTextField resignFirstResponder];
    NSLog(@"%@", creatures);
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *creatureSelect = segue.destinationViewController;
    NSIndexPath *indexPath = [myTableView indexPathForCell:sender];
    creatureSelect.creature = creatures[indexPath.row];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
