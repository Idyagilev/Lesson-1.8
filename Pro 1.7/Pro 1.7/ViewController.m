//
//  ViewController.m
//  Pro 1.7
//
//  Created by T on 04.03.16.
//  Copyright © 2016 T. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

// не забываем подписаться на табличные протоколы
@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

- (IBAction)addAction:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

//массив с событиями
@property (nonatomic,strong) NSMutableArray * arrayEvents;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addAction:(id)sender {
//    Прикручиваем наш вью к методу конпки эдд
    DetailViewController * detail = [self.storyboard instantiateViewControllerWithIdentifier:@"detailView"];
    [self.navigationController pushViewController:detail animated:YES];
}

//  копируем 2 метода, так как они рекуаред
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arrayEvents.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * identifier = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    return cell;
}
@end
