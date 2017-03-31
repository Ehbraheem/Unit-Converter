//
//  ViewController.m
//  UnitConverter
//
//  Created by AppsWorkforce 4 on 24/10/2016.
//  Copyright © 2016 Ehbraheem. All rights reserved.
//

#import "ViewController.h"

double convertUnit(double unitOneValue, int identifier) {
    double unitValue;
    switch (identifier) {
        case 1:
            unitValue = unitOneValue * 0.001;
            break;
        case 2:
            unitValue = unitOneValue * 0.000001;
            break;
        default:
            unitValue = unitOneValue * 0.000000001;
            break;
    }
  
    return unitValue;
}

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputField;

@property (weak, nonatomic) IBOutlet UILabel *outputField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;


@end

@implementation ViewController
- (IBAction)updateButton:(id)sender {
    NSMutableString *buf = [NSMutableString new];
    double userInput = [self.inputField.text doubleValue];
    
    if(self.segmentController.selectedSegmentIndex == 0){
        double unitValue = convertUnit(userInput, 1);
        [buf appendString: [@(unitValue) stringValue]];

    }
    else if (self.segmentController.selectedSegmentIndex == 1){
        double unitValue = convertUnit(userInput, 2);
        [buf appendString: [@(unitValue) stringValue]];

    }
    else {
        double unitTwoValue = convertUnit(userInput, 3);
        [buf appendString: [@(unitTwoValue) stringValue]];

    }
    
    self.outputField.text = buf;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)segmentController:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
