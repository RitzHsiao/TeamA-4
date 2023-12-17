#include "defs.inc"
Function do_task1
	num_token = 3
	num_block = 3
	asobi = 5
	
	

	
	Go my_home CP
	
	For id = num_token To 1 Step -1
		t1_infeed_token()
		t1_align_token()
		t1_place_token()
	Next id
	
	For id = num_block To 1 Step -1
		t1_infeed_block()
		t1_align_block()
		t1_place_block()
	Next id
	
	Go my_home CP
	
	Do While True
		'when red pressed again>> back
		If Sw(red) = False Then
			Exit Do
		EndIf
	Loop

	For id = num_token To 1 Step -1
		t1_back_token()
	Next id
	
	For id = num_block To 1 Step -1
		t1_back_block()
	Next id
	
Fend

Function t1_infeed_token
	Go feeder_token +Z(asobi + 50) /1 CP
	Move feeder_token +Z((id - 1) * thick + 0.2 + asobi) /1 CP
	SpeedS 100
	AccelS 1000
	Move feeder_token +Z((id - 1) * thick + 0.2) /1 CP
	SpeedS 500
	AccelS 5000
	On vacuum
	Wait .1
	Move feeder_token +Z(asobi + ((id - 1) * thick)) /1 CP
Fend
Function t1_infeed_block
	Go feeder_block +Z(asobi + 50) /1 CP
	Move feeder_block +Z((id - 1) * thick + 0.2 + asobi) /1 CP
	SpeedS 100
	AccelS 1000
	Move feeder_block +Z((id - 1) * thick + 0.2) /1 CP
	SpeedS 500
	AccelS 5000
	On vacuum
	Wait .1
	Move feeder_block +Z(asobi + ((id - 1) * thick)) /1 CP
Fend

Function t1_align_token
	Go cali_token +Z(asobi + thick) /1 CP
	Move cali_token /1 CP
	Off vacuum
	Move cali_token +Y(1.5) /1 CP
	SpeedS 100
	AccelS 1000
	Move cali_token +Y(1.5) +Z(asobi) /1 CP
	Move cali_token +Z(asobi) /1 CP
	SpeedS 500
	AccelS 5000
	Move cali_token /1 CP
	On vacuum
	Wait .1
	Move cali_token +Z(asobi + thick * 2) /1 CP
Fend
Function t1_align_block
	Go cali_block +Z(asobi + thick) /1 CP
	Move cali_block /1 CP
	Off vacuum
	
	Move cali_block +Y(1.5) +X(1.5) /1 CP
	SpeedS 100
	AccelS 1000
	Move cali_block +Y(1.5) +X(1.5) +Z(asobi) /1 CP
	Move cali_block +Z(asobi) /1 CP
	SpeedS 500
	AccelS 5000
	Move cali_block /1 CP
	On vacuum
	Wait .1
	Move cali_block +Z(asobi + thick * 2) /1 CP
Fend
Function t1_place_token
	Go tray_token +Y((id - 1) * offset_y) +Z(asobi + thick) /1 CP
	Move tray_token +Y((id - 1) * offset_y) /1 CP
	Off vacuum
	Wait .1
	Move tray_token -X(20) +Y(2 * offset_y) +Z(asobi + 50) /1 CP
Fend

Function t1_place_block
	Go tray_block +Y((id - 1) * offset_y) +Z(asobi + thick) /1 CP
	Move tray_block +Y((id - 1) * offset_y) /1 CP
	Off vacuum
	Wait .1
	If id > 1 Then
		Move tray_block -X(20) +Y(2 * offset_y) +Z(asobi + 50) /1 CP
	EndIf
Fend
Function t1_back_token
	Go tray_token +Y((id - 1) * offset_y) +Z(asobi + thick) /1 CP
	Move tray_token +Y((id - 1) * offset_y) /1 CP
	On vacuum
	Wait .1
	local_here = Here @1
	Move local_here +Z(asobi + 50) /1 CP
	
	Go feeder_token +Z(asobi + 50) -Y(2.5) /1 CP
	Move feeder_token +Z((3 - id) * thick + 0.2 + asobi) /1 CP
	SpeedS 100
	AccelS 1000
	Move feeder_token +Z((3 - id) * thick + 0.2) /1 CP
	SpeedS 500
	AccelS 5000
	Off vacuum
	Wait .1
	Move feeder_token +Z(asobi + 50) -Y(20) /1 CP
	
Fend
Function t1_back_block
	Go tray_block +Y((id - 1) * offset_y) +Z(asobi + thick) /1 CP
	Move tray_block +Y((id - 1) * offset_y) /1 CP
	On vacuum
	Wait .1
	local_here = Here @1
	Move local_here +Z(asobi + 50) /1 CP
	
	Go feeder_block +Z(asobi + 50) -Y(2.5) -X(2) /1 CP
	Move feeder_block +Z((3 - id) * thick + 0.2 + asobi) /1 CP
	SpeedS 100
	AccelS 1000
	Move feeder_block +Z((3 - id) * thick + 0.2) /1 CP
	SpeedS 500
	AccelS 5000
	Off vacuum
	Wait .1
	Move feeder_block +Z(asobi + 50) -Y(20) -X(10) /1 CP

Fend
