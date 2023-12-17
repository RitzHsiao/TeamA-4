#include "defs.inc"
Global Real choise '選token or block
Global Integer memNumber '第幾個位數

Function do_task3
	'parameters
	
	asobi = 5
	num_token = 6
	num_block = 6
	
	first_time()
	decide()
	
	Go my_home CP
	
	For id = amount To 1 Step -1
		t3_pick()
		t3_place()
	Next id
	
	Go my_home CP
Fend
Function first_time
	'intialize
	Integer i '單純給for迴圈用的
	Real status '檢查是否第一次執行
		
	
	status = MemIn(0)
	If status = 0 Then
		For i = 0 To 15
			MemOutW i, 0
		Next
		MemOutW (amount + 1), 1
	EndIf
	MemOut 0, 1
	memNumber = MemInW(amount + 1)
Fend
Function decide
	Do While True
		'when white pressed
		If Sw(white) = True Then
			If (memNumber < amount) Then
				memNumber = memNumber + 1
			Else
				memNumber = 1
			EndIf
			MemOutW (amount + 1), memNumber
			Wait waitForBut
		EndIf
		
		'when blue pressed
		If Sw(blue) = True Then
			choise = MemInW(MemInW(amount + 1))
			If choise = 0 Then
				MemOutW MemInW(amount + 1), 1
			Else
				MemOutW MemInW(amount + 1), 0
			EndIf
			Wait waitForBut
		EndIf
		
		'when  pressed green again>> start
		If Sw(green) = False Then
			Exit Do
		EndIf
	Loop
	
Fend
Function t3_pick
	 
	If MemInW(id) = token Then
		Go feeder_token +Z((num_token - 1) * thick + asobi * 2) /1 CP '到feeder上方2個asobi
		Move feeder_token +Z((num_token - 1) * thick) /1 CP '壓到feeder
		On vacuum '開吸
		Wait .1
		local_here = Here @1
		Move local_here +Z(asobi) /1 CP '原地往上1個asobi
		num_token = num_token - 1
	EndIf
	If MemInW(id) = block Then
		Go feeder_block +Z((num_block - 1) * thick + asobi * 2) /1 CP '到feeder上方2個asobi
		Move feeder_block +Z((num_block - 1) * thick) /1 CP '壓到feeder
		On vacuum '開吸
		Wait .1
		local_here = Here @1
		Move local_here +Z(asobi) /1 CP '原地往上1個asobi
		num_block = num_block - 1
	EndIf
Fend
Function t3_place
	local_here = Here @1
	If id > 4 Then
		Go local_here -Y(30) +Z(asobi) /1 CP
	Else
		If id = 1 Then
			Go local_here -Y(30) +Z(asobi * 5) /1 CP
		Else
			Go local_here -Y(30) +Z(asobi * 2) /1 CP
		EndIf
	EndIf
	
    
    
	Go stack +Z((6 - id) * thick + asobi + thick) /1 CP
	
	SpeedS 100
	AccelS 1000
	local_here = Here @1
	Move local_here -Z(asobi) /1 CP
	Off vacuum
	SpeedS 500
	AccelS 5000
	Wait .1
	local_here = Here @1
	Move local_here +Z(asobi) /1 CP
	local_here = Here @1

	Go local_here +Y(30) :Z(platform_height + height_feeder + thick * 5) /1 CP
	
Fend


