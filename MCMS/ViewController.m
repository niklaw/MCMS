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
//    MagicalCreature *description;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    creatures = [NSMutableArray array];
    
    creature = [[MagicalCreature alloc]init];
    creature.name = @"Dhalsim";
    creature.description = @"Indian Fighter with long stretchy apendages and many rings around his neck";
    creature.image = [UIImage imageNamed:@"Dhalsim.jpg"];
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Blanka";
    creature.description = @"Nasty Green fighter with orange hair and a bad temper!";
    creature.image = [UIImage imageNamed:@"Blanka.jpg"];
    [creatures addObject:creature];

    creature = [MagicalCreature new];
    creature.name = @"M.Bison";
    creature.description = @"Power hungry dictator with a badass Military Hat.";
    creature.image = [UIImage imageNamed:@"M.Bison.jpg"];
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Guile";
    creature.description = @"USAF Major that shoots sonic booms and couldn't fly a plane to save his life.";
    creature.image = [UIImage imageNamed:@"Guile.jpg"];
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Chun-Li";
    creature.description = @"Veluptuous fighter with legs of steel.";
    creature.image = [UIImage imageNamed:@"Chun Li.png"];
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Ryu";
    creature.description = @"HADOUKEEEEEEEEEEEN!!!!!!!!!!!!!!!";
    creature.image = [UIImage imageNamed:@"Ryu.jpg"];
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Ken";
    creature.description = @"Pretty Boy version of Ryu.";
    creature.image = [UIImage imageNamed:@"Ken.jpg"];
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Sagat";
    creature.description = @"Massive Concrete wall.";
    creature.image = [UIImage imageNamed:@"Sagat.jpg"];
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Akuma";
    creature.description = @"Has a pink ponytail.  Dark and pink.";
    creature.image = [UIImage imageNamed:@"Akuma.jpg"];
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Vega";
    creature.description = @"Wolverine's Spanish cousin and Matador hobbyist.";
    creature.image = [UIImage imageNamed:@"Vega.jpg"];
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Cammy";
    creature.description = @"Dangerous and kind of inappropriate.  Don't Bring the kids.";
    creature.image = [UIImage imageNamed:@"Cammy.jpg"];
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Maki";
    creature.description = @"Dang.  Maki.  She has a short temper and obviously doesn't buy enough clothing.";
    creature.image = [UIImage imageNamed:@"Maki.png"];
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Sakura";
    creature.description = @"Ditched School to kick ass!";
    creature.image = [UIImage imageNamed:@"Sakura.jpg"];
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
