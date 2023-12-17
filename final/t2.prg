#include "defs.inc"

Function do_task2
	num_token = 6
	num_block = 6
	asobi = 4
	
	Go my_home CP
	
	For id = num_token To 1 Step -1
		t2_pick_block()
		t2_place_block()
		
		t2_pick_token()
		t2_place_token()
	Next id
	
	Do While True
		'when  pressed orange again>> backward
		If Sw(orange) = False Then
			Exit Do
		EndIf
	Loop
	
	For id = num_token To 1 Step -1
		t2_back()
	Next id
	
	Go my_home CP
Fend
Function t2_pick_block
	Go feeder_block +Z((id - 1) * thick + asobi * 2) /1 CP '到feeder上方2個asobi
	Move feeder_block +Z((id - 1) * thick) /1 CP '壓到feeder
	On vacuum '開吸
	Wait .1
	local_here = Here @1
	Move local_here +Z(asobi) /1 CP '原地往上1個asobi
Fend
Function t2_pick_token
	Go feeder_token +Z((id - 1) * thick + asobi * 2) /1 CP '到feeder上方2個asobi
	Move feeder_token +Z((id - 1) * thick) /1 CP '壓到feeder
	On vacuum '開吸
	Wait .1
	local_here = Here @1
	Move local_here +Z(asobi) /1 CP '原地往上1個asobi
Fend
Function t2_place_block
	local_here = Here @1
	If id > 3 Then
    	Go local_here -Y(30) -X(8) +Z(asobi) /1 CP
    Else
    	Go local_here -Y(30) -X(8) +Z(asobi * 4.1 * (4 - id)) /1 CP
    EndIf
	Go stack +Z((6 - id) * 2 * thick + asobi + thick) /1 CP
	SpeedS 100
	AccelS 1000
	Move stack +Z((6 - id) * 2 * thick + thick) /1 CP
	Off vacuum
	SpeedS 500
	AccelS 5000
	Wait .1
	Move stack +Z((6 - id) * 2 * thick + asobi + thick) /1 CP
	local_here = Here @1
	If id > 4 Then
		Go local_here -X(8) +Y(30) +Z(asobi * id) /1 CP
	Else
		Go local_here -X(8) +Y(60) /1 CP
	EndIf
Fend
Function t2_place_token
	local_here = Here @1
	If id > 3 Then
    	Go local_here -Y(30) +X(8) +Z(asobi) /1 CP
    Else
    	Go local_here -Y(30) +X(8) +Z(asobi * 5 * (4 - id)) /1 CP
    EndIf
	Go stack +Z(((6 - id) * 2 + 1) * thick + asobi + thick) /1 CP
	SpeedS 100
	AccelS 1000
	Move stack +Z(((6 - id) * 2 + 1) * thick + thick) /1 CP
	Off vacuum
	Wait .1
	SpeedS 500
	AccelS 5000
	Move stack +Z(((6 - id) * 2 + 1) * thick + asobi + thick) /1 CP
	local_here = Here @1
	If id > 3 Then
		Go local_here +X(8) +Y(30) +Z(asobi * id) /1 CP
	ElseIf id > 1 Then
		Go local_here -X(8) +Y(60) /1 CP
	EndIf
Fend
Function t2_back
	'pick token
	Go stack +Z((id * 2) * thick + asobi) /1 CP
	SpeedS 100
	AccelS 1000
	local_here = Here @1
	Move local_here -Z(asobi) /1 CP
	On vacuum
	Wait .1
	local_here = Here @1
	Move local_here +Z(asobi) /1 CP
	SpeedS 500
	AccelS 5000
	local_here = Here @1
	Go local_here -Y(35) +Z(10) /1 CP
	
	'palce token
	Go tem_token +Z(7 * thick) /1 CP
	Move tem_token +Z((6 - id) * thick + 0.2 + asobi) /1 CP
	
	Move tem_token +Z((6 - id) * thick + 0.2) /1 CP
	
	Off vacuum
	Wait .1
	Move tem_token :Z(platform_height + 11 * thick) /1 CP
	
	'pick block
	Go stack +Z((id * 2 - 1) * thick + asobi) /1 CP
	SpeedS 100
	AccelS 1000
	local_here = Here @1
	Move local_here -Z(asobi) /1 CP
	On vacuum
	Wait .1
	local_here = Here @1
	Move local_here +Z(asobi) /1 CP
	SpeedS 500
	AccelS 5000
	local_here = Here @1
	Go local_here -Y(35) +Z(10) /1 CP
	
	'palce block
	Go tem_block +Z(7 * thick) /1 CP
	Move tem_block +Z((6 - id) * thick + 0.2 + asobi) /1 CP

	Move tem_block +Z((6 - id) * thick + 0.2) /1 CP

	Off vacuum
	Wait .1
	Move tem_block :Z(platform_height + 11 * thick) /1 CP
	
Fend

