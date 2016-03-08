//
//  DetailViewController.m
//  Pro 1.7
//
//  Created by T on 04.03.16.
//  Copyright © 2016 T. All rights reserved.
//

#import "DetailViewController.h"

//  протокол текстфилда
@interface DetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UIButton *buttonSave;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datePicker.minimumDate = [NSDate date];
    
//  У каждого UIэлемента есть свойство userInteractionEnabled - может он воспринимать тач касание или нет
    self.buttonSave.userInteractionEnabled = NO;
    
//  Создаем обьект жестрекогнайзер и пишем на какой вью надо его применить
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleBackgroundTap:)];
    [self.view addGestureRecognizer:tap];
    
//  делаем клавиатуру активной сразу при загрузке приложения
    [self.textField becomeFirstResponder];
    
    [self.datePicker addTarget:self action:@selector(datePickerAction) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) datePickerAction {
    
    self.eventDate = self.datePicker.date;
}

//  метод сворачивающий текстфилд по касанию на бэкграунд 
-(void) handleBackgroundTap: (UITapGestureRecognizer *) tap {
    
    [self.view endEditing:YES];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//  Первый вариант  -  спрашиваем равен ли обьект текстфилду, на случай если много текстовых полей на вью
//    if (textField == self.textField) {
// 
//    }
    
//    Второй вариант - типа правильней, также проверяем текстфилд и задаем условие при котором текстфилд свернется тогда когда длина будет не равна нолю
    if ([textField isEqual:self.textField]  && self.textField.text.length !=0) {
    
        [self resignFirstResponder];
        return YES;
    }
    else {
        
        [self showAlertMessage:@"Введите значение для события"];
        return NO;

        
    }
    
    return NO;
}

-(void) showAlertMessage : (NSString *) message {
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Внимание!" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alert show];
}



@end
