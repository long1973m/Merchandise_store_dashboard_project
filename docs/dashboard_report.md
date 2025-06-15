# Google Merchandise Store Dashboard 报告

本报告将对 Power BI 仪表盘中的各个可视化图表进行详细解析，说明其设计思路、核心指标和业务洞察。

---

## 1. 访问量与活跃用户数（KPI 指标）

- **访问量（Total Visits）**：统计选定时间范围内所有用户的访问事件次数。

  - 数据来源：`fact_events`
  - 筛选条件：不限类型
  - DAX 示例：`Total Visits = COUNT(fact_events[user_id])`

- **活跃用户数（Active Users）**：在指定时间范围内至少产生一次行为的唯一用户数。

  - DAX 示例：`Active Users = DISTINCTCOUNT(fact_events[user_id])`

- **付费用户占比（Purchase Rate）**：有过购买行为的用户占活跃用户的比例。

  - 筛选条件：`type = "purchase"`
  - DAX 示例：`Purchase Rate = DIVIDE([Paid Users], [Active Users])`

---

## 2. 每日访问趋势折线图（Visits Over Time）

- 展示访问事件的日变化趋势，反映用户活跃周期和推广效果。
- X轴：日期（dim\_date[date\_key]）
- Y轴：访问量（按天统计 fact\_events）
- 图表类型：折线图
- 工具提示自定义：展示日期、访问量等

---

## 3. 每日活跃用户（DAU）折线图

- 逻辑与访问趋势图类似，但度量为“日活用户数量”。
- DAX 示例：
  ```DAX
  Daily Active Users =
  CALCULATE(
    DISTINCTCOUNT(fact_events[user_id]),
    ALLEXCEPT(dim_date, dim_date[date_key])
  )
  ```

---

## 4. 不同国家的活跃用户数（Map）

- 图表类型：地图
- 数据来源：`dim_country`
- 修复：已将国家代码转换为英文全称
- 度量：活跃用户数（distinct user\_id）
- 注意事项：确保地理字段（国家）被识别为地理数据类型

---

## 5. 不同设备的活跃用户数（条形图）

- 维度：设备类型（`device`）
- 指标：活跃用户数
- 图表类型：条形图（设备为 X 轴，用户数为 Y 轴）

---

## 6. 商品 GMV Top10（横向条形图）

- 逻辑：筛选 type = purchase 的事件，按商品统计销售额（price\_in\_usd）
- DAX 示例：
  ```DAX
  Item GMV =
  CALCULATE(
    SUM(dim_item[price_in_usd]),
    fact_events[type] = "purchase"
  )
  ```
- TopN 逻辑：按 GMV 降序排列，取前10

---

## 7. 转化漏斗图（Funnel）

- 显示从“加入购物车”到“结算”再到“支付完成”的用户流失情况。
- 三个步骤：
  - Add to Cart
  - Begin Checkout
  - Purchase
- 每一步统计对应事件的用户数
- DAX 示例：
  ```DAX
  Users at Step =
  CALCULATE(
    DISTINCTCOUNT(fact_events[user_id]),
    fact_events[type] = "add_to_cart"  -- 替换为各步骤
  )
  ```

---

## 8. 时间切片器（Slicer）

- 目标：支持用户筛选仪表盘时间范围
- 字段：`dim_date[date_key]`
- 格式：范围选择器（Between）

---

## 结语

本仪表盘通过 Power BI 构建，完整展现了 Google Merchandise Store 在不同维度下的用户行为、渠道转化与 GMV 表现。通过合理的字段建模与 DAX 度量计算，使各项指标清晰直观，便于非技术背景用户解读。未来可考虑进一步引入用户生命周期分层、渠道分析与趋势预测模块。

如需扩展本报告，请联系作者或提交 issue 到 GitHub 项目仓库。

