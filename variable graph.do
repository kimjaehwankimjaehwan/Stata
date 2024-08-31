clear
set obs 100

gen q = _n
gen demand = 100 - 0.5*q
gen supply = 0.5*q + 20

twoway (line demand q, lcolor(blue)) ///
       (line supply q, lcolor(red)), ///
       legend(order(1 "Demand Curve" 2 "Supply Curve")) ///
       ytitle("Price") xtitle("Quantity") ///
       title("Demand and Supply Curves")

clear
set obs 100

gen q = _n
gen ac = 30 + 0.2*q + 50/q
gen mc = 0.4*q + 10

twoway (line ac q, lcolor(red)) ///
       (line mc q, lcolor(green)), ///
       legend(order(1 "Average Cost (AC)" 2 "Marginal Cost (MC)")) ///
       ytitle("Cost") xtitle("Quantity") ///
       title("Average and Marginal Cost Curves")
	   
clear
set obs 100

gen income = _n * 1000
gen quantity = 10 + 0.002*income

twoway (line quantity income, lcolor(blue)), ///
       ytitle("Quantity Consumed") xtitle("Income") ///
       title("Engel Curve")
	   
clear
set obs 100

gen q = _n
gen p = 100 - 0.5*q
gen ac = 30 + 0.2*q + 50/q
gen mc = 0.4*q + 10

twoway (line p q, lcolor(blue)) ///
       (line ac q, lcolor(red) lpattern(dash)) ///
       (line mc q, lcolor(green) lpattern(dash_dot)), ///
       legend(order(1 "Demand Curve (D)" 2 "Average Cost (AC)" 3 "Marginal Cost (MC)")) ///
       ytitle("Price/Cost") xtitle("Quantity") ///
       title("Monopoly Profit")
	   
clear
set obs 100

gen x = _n
gen y = 100 - 0.5*x^2

twoway (line y x, lcolor(blue)), ///
       ytitle("Good Y") xtitle("Good X") ///
       title("Production Possibility Curve")


	   