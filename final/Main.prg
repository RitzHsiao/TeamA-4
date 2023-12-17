#include "defs.inc"

' make sure align my_home and real_ori
Function main
	
	robot_initial()
	point_initial()
	
	Do While True
		task_selecting()
	Loop
	
	
Fend
Function robot_initial
	'Initialize
	Off vacuum
	Motor On
	Power High
	Speed 100
	Accel 50, 50
	SpeedS 500
	AccelS 5000
	Tool 1
Fend
Function point_initial
	Tool 1
	LocalClr 1
	Local 1, local_ori, local_x, local_y, X
	
	real_ori = local_ori :Z(platform_height) -Y(1.5) +X(0.5)
	
	ori = real_ori @1
	
	feeder_token = ori + XY(40, 160, 16, 0) /1
	feeder_block = ori + XY(66.34, 162.34, 16, 0) /1
	cali_token = ori + XY(40, 90, 16, 0) /1
	cali_block = ori + XY(66.34, 92.34, 16, 0) /1
	tray_token = ori + XY(130 - 0.6, 90 + 0.4, 10, 0) /1
	tray_block = ori + XY(160, 90 + 0.4, 10, 0) /1
	stack = ori + XY(54, 80, 10, 0) /1
	
	tem_token = ori + XY(40, 10, 6, 0) /1
	tem_block = ori + XY(66.34, 10, 6, 0) /1
	
	SavePoints "Points.pts"
Fend
Function task_selecting
	
	'when red pressed >> choise task 1
	If Sw(red) = True Then
		do_task1()
	EndIf
	'when orange pressed  >> choise task 2
	If Sw(orange) = True Then
		do_task2()
	EndIf
	'when green pressed >> choise task 3
	If Sw(green) = True Then
		do_task3()
	EndIf

Fend

