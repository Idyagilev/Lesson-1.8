//
//  DetailViewController.h
//  Pro 1.7
//
//  Created by T on 04.03.16.
//  Copyright © 2016 T. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

//Это свойство обьявляем в хедере, потому что будем обращаться к нему из другого класса
@property (nonatomic, strong) NSDate * eventDate;

@end
