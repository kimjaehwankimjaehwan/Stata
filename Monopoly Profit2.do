clear
set obs 100

* 수량(Q) 값 생성
gen q = _n

* 수요곡선 생성 (Demand Curve, D)
gen p = 100 - 0.5*q

* 한계수입곡선 생성 (Marginal Revenue Curve, MR)
gen mr = 100 - q

* 한계비용곡선 생성 (Marginal Cost Curve, MC)
gen mc = 20 + 0.5*q

* 평균비용곡선 생성 (Average Cost Curve, AC)
gen ac = 20 + 0.3*q + 50/q

* 최적 가격과 생산량을 표시하기 위해 교차점 생성
gen optimal_p = 75 if q == 50
gen optimal_q = 50 if q == 50
gen optimal_ac = ac if q == 50

* 그래프 생성
twoway (line p q, lcolor(blue) lwidth(medium) lpattern(solid)) ///
       (line mr q, lcolor(red) lwidth(medium) lpattern(dash)) ///
       (line mc q, lcolor(green) lwidth(medium) lpattern(dash_dot)) ///
       (scatter optimal_p optimal_q, mcolor(black) msymbol(O)) ///
       (scatter optimal_ac optimal_q, mcolor(red) msymbol(X)), ///
       ytitle("Price/Cost") xtitle("Quantity") ///
       title("Monopoly Profit") ///
       legend(order(1 "Demand Curve (D)" 2 "Marginal Revenue Curve (MR)" 3 "Marginal Cost Curve (MC)" 4 "Optimal Price (P*)" 5 "Average Cost at Q* (AC)"))
