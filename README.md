## :raising_hand:**成員**
- 蕭力慈 (M11203602)
- 陳韋硯 (M11203603)
- 胡珍姮 (M11203606)

## **Task 3：任意堆疊 + I/O整合各項任務**
### :dart:任務目標
- 使用按鈕選擇開始任務
- 再次按下按鈕自動整理工件
- 利用藍鍵、白鍵選擇疊疊樂的堆放順序
### :memo:操作說明
#### 程式流程圖
![teama4.drawio](https://hackmd.io/_uploads/H1QC5dnIT.png)
#### 按鈕圖
![螢幕擷取畫面 2023-12-17 211325](https://hackmd.io/_uploads/HJjWVu2Lp.png)

- 按下紅鍵開始 task1，任務完成後再次按下自動整理工件
- 按下橘鍵開始 task2，任務完成後再次按下自動整理工件
- 按下綠鍵進入 task3，此時按下藍鍵可選擇層數，按下白鍵選擇該層是BLOCK/TOKEN ，再次按下綠鍵開始作動
#### 補充說明 : 
- 層數顯示於 Memery I/O 第7字組
- 選擇結果於 Memery I/O 該字組顯示 ， 0 代表 TOKEN 、1 代表 BLOCK

以下為 Memery I/O 與實際堆疊之對照示意圖
![Memory IO Example 1](https://hackmd.io/_uploads/SJ9Esd28a.png)
![Memory IO Example 2](https://hackmd.io/_uploads/HJdrjuhIa.png)


### :hammer:自製制具
#### 底板
![螢幕擷取畫面 2023-12-17 205447](https://hackmd.io/_uploads/HyPok_28p.png)
#### 氣壓缸
![螢幕擷取畫面 2023-12-17 212204](https://hackmd.io/_uploads/S1q-L_hL6.png)


### :heavy_check_mark:**加分小亮點**
- [x] 利用 I/O box 選擇任務開始
- [x] 利用 I/O box 自動整理工件
- [x] 利用 I/O box 選擇疊疊樂順序
- [x] 利用 Memory I/O 顯示取代 GUI
- [x] 利用自製雷射切割板固定工件
    - 標記教導點，定位更精準
    - 便利定義 Local 的相對偏移
- [x] 根據教導的 3 點自動校正 Local 
    - 非使用 Robot Manager 內建功能
    - 解決內建的 Local 教導功能不可記憶的問題
- [x] 平台位移後經校正還是能完成任務
- [x] 利用標頭檔整合 Reference ，增加程式彈性
- [x] 將所有任務整合在同一程式，增加完整度


### :movie_camera:**Simulation Video**
![task 3 simulation video](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExdnd5MzBmYzdqb2ZsY2JxZTByOXc4NzJiZjYyYTR3eDRodmR1ZWRteCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/7UUdJhtRUw5uCS5PmB/giphy.gif)

