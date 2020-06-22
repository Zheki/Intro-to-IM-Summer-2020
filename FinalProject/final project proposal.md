## Final Project: Autonomous Rover

For the final project I will be making an autonomous robot that acts like a rover. The main function of the robot will be to freely move 
through a space and avoiding obstacles.

## Arduino 
The robot will be controlled by an Arduino (Sparkfun RedBoard). An ultrasonic distance measuring sensor will be attached to two digital pins 
of the arduino and will serve as the sensor that gives information on obstacles. If there is an object within a certain treshold, the arduino will give
process it and would react by controlling two DC motors. For example if there is an obstace in front of the robot, it will turn only the left or the right
motor to make the robot change direction. The DC motors will be connected to a motor driver, which will be connected to 6 digital arduino pins.
The ultrasonic distance sensor will be mounted on a servo which will constantly rotate between two sides. This will make sure that the sensor has a 
larger FOV making it less prone to colliding with obstacles. The sensor and actuators will constantly be communicating with each other to determine
the actions of the robot.

