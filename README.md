# TeamA-4 
## :raising_hand:**成員**
- **蕭力慈** (M11203602)
- **陳韋硯** (M11203603)
- **胡珍姮** (M11203606)

## **Task 3：任意堆疊 + I/O整合各項任務**
### :dart:目標
使用I/O box操控所有任務，且利用記憶體記憶使用者選擇推疊順序，將其
利用x建選擇執行和項任務， 任務3中，利用x鍵指定堆高任務中的某一層，再利用x鍵指定該層的工件種類，並於 memory I/O 區塊顯示 按下x鍵後依序堆疊完成目標 完成堆疊目標後，再次按下x鍵可將堆好的工件放回feeder

### :heavy_check_mark:**我們達到的**
- [x] 利用 I/O box (三健)選擇並執行哪一個任務 (如圖x所示)
x建
x建
- [x] 用 I/O box (兩健) 決定
- [x] 利用 memory I/O 記憶
- [x] 利用 memory I/O 顯示取代 GUI
- [x] 可彈性變更堆疊數量 (容許範圍內)
- [x] 利用自設計雷射切割板固定工件
    - 於切割版上標記教導點，定位更精準
    - 便利定義 Local 的相對偏移
- [x] 根據教導的3點 Local 自動校正
    - 非使用 Robot Manager 內建功能
    - 解決內建的 Local 功能不可記憶的問題
- [x] 平台偏移後經 Local 校正後還是能完成任務
- [x] 利用標頭檔整合 Reference ，增加程式彈性
#### 圖1 I/O box 按鈕配置圖 
![螢幕擷取畫面 2023-12-17 211325](https://hackmd.io/_uploads/HJjWVu2Lp.png)

#### 圖2 cad檔截圖
![螢幕擷取畫面 2023-12-17 205447](https://hackmd.io/_uploads/HyPok_28p.png)

### **運行流程圖**


圖3 總流程圖 圖4 工件順序選擇流程

### 遺珠之憾
#### 氣壓缸治具
![螢幕擷取畫面 2023-12-17 212204](https://hackmd.io/_uploads/S1q-L_hL6.png)
#### 程式小巧思
#### 程式命名規範


### **Simulation Video**

![task 3 simulation video](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExdnd5MzBmYzdqb2ZsY2JxZTByOXc4NzJiZjYyYTR3eDRodmR1ZWRteCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/7UUdJhtRUw5uCS5PmB/giphy.gif)
