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
While checked out at your master branch, and located in the git root. Bundle to install all the dependency.

```sh
cd toy_robot_simulator
bundle

```

Usage
--------------
While checked out at your master branch, and located in the git root.
Run the toy_robot_simulator execution with instruction file path.
Please go to the instruction file section for more information about the structure.

```sh
./toy_robot_simulator instruction_file.txt
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
| PLACE     | x, y, direction | Place the robot in the grid and set the direction to where it is facing. |
| REPORT    |  | Print out the x, y and cardinal direction of the robot |
| MOVE      |  | Move the robot one grid to the cardinal direction of the robot|


License
----
