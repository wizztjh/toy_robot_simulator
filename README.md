Toy Robot Simulator
=========

Description:

This application is a simulation of a toy robot moving on a square tabletop, with a dimension of 5 units x 5 units.

No other obstructions are on the table surface.

The robot is free to roam around on the surface of the table, but must be prevented from falling to destruction.


Requirement
------------

- rvm
- bundler gem

Installation
--------------
Check out at master branch, and locate the git root.
Bundle to install all the dependency.

```sh
cd toy_robot_simulator
bundle

```

Usage
--------------
Check out at master branch, and locate the git root.
Run the toy_robot_simulator execution with instruction file path.
Please go to the instruction file section for more information about the structure.

A test data has been prepared to be used.

```sh
./toy_robot_simulator test_data.txt
```

Instruction file
--------------
The simulator will read the instruction file line by line to extract the information.
Each line of the file will be read by the simulator as an instruction.

```
PLACE 1,2,NORTH
MOVE
REPORT
```

#####available instruction
Below is the list of all the available instruction and its usage:

| Instruction | Arguments     | Description|
| :-----------|:--------------| :-----|
| PLACE     | x, y, direction | Places the robot in the grid and sets the direction to where it is facing. |
| REPORT    |  | Prints out the x, y and cardinal direction of the robot. ie. 0,1,NORTH  |
| LEFT      |  | Rotates the robot counter clockwise |
| RIGHT     |  | Rotates the robot clockwise |
| MOVE      |  | Moves the robot one grid to the cardinal direction of the robot|

#####Notes
The grid is 5 units X 5 units

The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command.

The application will discard all commands in the sequence until a valid PLACE command has been executed.

The origin (0,0) is SOUTH WEST most corner.

Any instruction that will cause the robot to fall out the grid will be ignored.
