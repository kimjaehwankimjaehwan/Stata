clear
set obs 100

* X축 값을 생성
gen q = _n

* 수요곡선 (D) 생성 (선형 수요곡선 예시)
gen p = 100 - 0.5*q

* 평균비용곡선 (AC) 생성 (U자 형태)
gen ac = 30 + 0.2*q + 50/q

* 한계비용곡선 (MC) 생성 (일정한 한계비용)
gen mc = 0.4*q + 10

* 독점 이윤을 최대화하는 최적 생산량과 가격 찾기 (교차점)
* 수요곡선과 MC 곡선이 교차하는 지점에서 가격 설정
gen optimal_p = 75 if q == 50
gen optimal_q = 50 if q == 50
gen optimal_ac = ac if q == 50

* 그래프 생성
twoway (line p q, lcolor(blue) lwidth(medium) lpattern(solid) ///
        ytitle("Price/Cost") xtitle("Quantity") ///
        title("Monopoly Profit")) ///
       (line ac q, lcolor(red) lwidth(medium) lpattern(dash)) ///
       (line mc q, lcolor(green) lwidth(medium) lpattern(dash_dot)) ///
       (scatter optimal_p optimal_q, mcolor(black) msymbol(O)) ///
       (scatter optimal_ac optimal_q, mcolor(red) msymbol(X)) ///
       , legend(order(1 "Demand Curve (D)" 2 "Average Cost Curve (AC)" 3 "Marginal Cost Curve (MC)" 4 "Optimal Price (P*)" 5 "Average Cost at Q* (AC)"))
