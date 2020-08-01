*insert directory for dataset
use "Dataset 2020-05-02.dta", clear

*DESCRIPTIVES AND CORRELATIONS
mkcorr complaints disorder violence jh_GPA jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime mimlog orgform jh_ctea jh_sctea s_sizelog if school_type==1 & year>1998, log("kkv1_corr2.txt") cdec(3) mdec(3) lab means num casewise replace
mkcorr complaints disorder violence hs_GPA hs_herf hs_density hs_sistud hs_forbac jh_edupar minclog crime mimlog orgform hs_ctea hs_sctea s_sizelog if school_type==2 & year>1998, log("kkv2_corr2.txt") cdec(3) mdec(3) lab means num casewise replace

*MAIN
	*jh
xtmixed complaints jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime mimlog i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year if school_type==1 & year>1998, || municipality:, || school_id:, ml var
outreg2 using "main1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) replace  ctitle(Complaints)
xtmixed disorder jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime  mimlog i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year if school_type==1 & year>1998, || municipality:, || school_id:, ml var
outreg2 using "main1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(Disorder)
xtmixed violence  jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime mimlog i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year if school_type==1 & year>1998, || municipality:, || school_id:, ml var
outreg2 using "main1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(Violence)
xtmixed jh_GPA jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime mimlog i.orgform jh_ctea jh_sctea s_sizelog i.year if school_type==1 & year>1998, || municipality:, || school_id:, ml var
outreg2 using "main1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(GPA)
xtreg jh_GPA jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime mimlog jh_ctea jh_sctea s_sizelog i.year if school_type==1 & year>1998, fe i(school_id) cl(municipality)
outreg2 using "main1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(GPA FE)

seeout using "main1.txt", label

	*hs
xtmixed complaints hs_herf hs_density hs_sistud hs_forbac hs_edupar minclog crime mimlog i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year if school_type==2 & year>1998, || municipality:, || school_id:, ml var
outreg2 using "main2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) replace  ctitle(Complaints)
xtmixed disorder hs_herf hs_density hs_sistud hs_forbac hs_edupar minclog crime mimlog i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year if school_type==2 & year>1998, || municipality:, || school_id:, ml var
outreg2 using "main2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(Disorder)
xtmixed violence hs_herf hs_density hs_sistud hs_forbac hs_edupar minclog crime mimlog i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year if school_type==2 & year>1998, || municipality:, || school_id:, ml var
outreg2 using "main2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(Violence)
xtmixed hs_GPA hs_herf hs_density hs_sistud hs_forbac hs_edupar minclog crime mimlog i.orgform hs_ctea hs_sctea s_sizelog i.year if school_type==2 & year>1998, || municipality:, || school_id:, ml var
outreg2 using "main2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(GPA)
xtreg hs_GPA hs_herf hs_density hs_sistud minclog crime mimlog hs_forbac hs_edupar hs_ctea hs_sctea s_sizelog i.year if school_type==2 & year>1998, fe i(school_id) cl(municipality)
outreg2 using "main2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(GPA FE)

seeout using "main2.txt", label	



*DIFFERENCE IN DIFFERENCE
	*JUNIOR HIGH SCHOOLS
	*JH complaints
	xtreg complaints jh_post i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) replace  ctitle(Complaints)
	xtreg complaints jh_post jh_ctea jh_sctea jh_forbac jh_edupar jh_GPA s_sizelog i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Complaints)
	xtreg complaints jh_post minclog crime mimlog poplog politics i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Complaints)
	xtreg complaints jh_post jh_ctea jh_sctea jh_forbac jh_edupar jh_GPA s_sizelog minclog crime mimlog poplog politics i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Complaints)
	seeout using "did1.txt", label	
	*JH disorder
	xtreg disorder jh_post i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1b", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) replace  ctitle(Disorder)
	xtreg disorder jh_post jh_ctea jh_sctea jh_forbac jh_edupar jh_GPA s_sizelog i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1b", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Disorder)
	xtreg disorder jh_post minclog crime mimlog poplog politics i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1b", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Disorder)
	xtreg disorder jh_post jh_ctea jh_sctea jh_forbac jh_edupar jh_GPA s_sizelog minclog crime mimlog poplog politics i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1b", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Disorder)
	seeout using "did1b", label
	*JH violence
	xtreg violence jh_post i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1c", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) replace  ctitle(Violence)
	xtreg violence jh_post jh_ctea jh_sctea jh_forbac jh_edupar jh_GPA s_sizelog i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1c", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Violence)
	xtreg violence jh_post minclog crime mimlog poplog politics i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1c", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Violence)
	xtreg violence jh_post jh_ctea jh_sctea jh_forbac jh_edupar jh_GPA s_sizelog minclog crime mimlog poplog politics i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1c", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Violence)
	seeout using "did1c", label	
	*JH GPA
	xtreg jh_GPA jh_post i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1d", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) replace  ctitle(GPA)
	xtreg jh_GPA jh_post jh_ctea jh_sctea jh_forbac jh_edupar s_sizelog i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1d", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(GPA)
	xtreg jh_GPA jh_post minclog crime mimlog poplog politics i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1d", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(GPA)
	xtreg jh_GPA jh_post jh_ctea jh_sctea jh_forbac jh_edupar s_sizelog minclog crime mimlog poplog politics i.year if year>1998 & school_type==1 & jh_comp==0 | jh_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did1d", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(GPA)
	seeout using "did1d", label	

	*HIGH SCHOOLS
	*HS complaints
	xtreg complaints hs_post i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) replace  ctitle(Complaints)
	xtreg complaints hs_post hs_ctea hs_sctea hs_forbac hs_edupar hs_GPA s_sizelog i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Complaints)
	xtreg complaints hs_post minclog crime mimlog poplog politics i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Complaints)
	xtreg complaints hs_post hs_ctea hs_sctea hs_forbac hs_edupar hs_GPA s_sizelog minclog crime mimlog poplog politics i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Complaints)
	seeout using "did2.txt", label	
	*HS disorder
	xtreg disorder hs_post i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2b", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) replace  ctitle(Disorder)
	xtreg disorder hs_post hs_ctea hs_sctea hs_forbac hs_edupar hs_GPA s_sizelog i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2b", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Disorder)
	xtreg disorder hs_post minclog crime mimlog poplog politics i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2b", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Disorder)
	xtreg disorder hs_post hs_ctea hs_sctea hs_forbac hs_edupar hs_GPA s_sizelog minclog crime mimlog poplog politics i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2b", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Disorder)
	seeout using "did2b", label	
	*HS violence
	xtreg violence hs_post i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2c", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) replace  ctitle(Violence)
	xtreg violence hs_post hs_ctea hs_sctea hs_forbac hs_edupar hs_GPA s_sizelog i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2c", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Violence)
	xtreg violence hs_post minclog crime mimlog poplog politics i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2c", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Violence)
	xtreg violence hs_post hs_ctea hs_sctea hs_forbac hs_edupar hs_GPA s_sizelog minclog crime mimlog poplog politics i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2c", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(Violence)
	seeout using "did2c", label	
	*HS GPA
	xtreg hs_GPA hs_post i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2d", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) replace  ctitle(GPA)
	xtreg hs_GPA hs_post hs_ctea hs_sctea hs_forbac hs_edupar s_sizelog i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2d", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(GPA)
	xtreg hs_GPA hs_post minclog crime mimlog poplog politics i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2d", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(GPA)
	xtreg hs_GPA hs_post hs_ctea hs_sctea hs_forbac hs_edupar s_sizelog minclog crime mimlog poplog politics i.year if year>1998 & school_type==2 & hs_comp==0 | hs_comp==1, fe i(school_id) cl(municipality)
	outreg2 using "did2d", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Municipality FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(GPA)
	seeout using "did2d", label	


***************************
******ROBUSTNESS TEST******
***************************

*ANALYSIS OF SCHOOLS IN MUNICIPALITIES WITH AT LEAST 1 CORPORATE SCHOOL
xtmixed complaints lsm_herf lsm_density lsm_sistud hs_forbac hs_edupar lsm_minclog lsm_crime lsm_mimlog i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
outreg2 using "robust1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) replace  ctitle(Complaints)
xtmixed disorder lsm_herf lsm_density lsm_sistud hs_forbac hs_edupar lsm_minclog lsm_crime lsm_mimlog i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
outreg2 using "robust1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(Disorder)
xtmixed violence lsm_herf lsm_density lsm_sistud hs_forbac hs_edupar lsm_minclog lsm_crime lsm_mimlog i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
outreg2 using "robust1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(Violence)
xtmixed hs_GPA lsm_herf lsm_density lsm_sistud hs_forbac hs_edupar  lsm_minclog lsm_crime lsm_mimlog i.orgform hs_ctea hs_sctea s_sizelog i.year if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
outreg2 using "robust1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(GPA)
xtreg hs_GPA lsm_herf lsm_density lsm_sistud hs_forbac hs_edupar lsm_minclog lsm_crime lsm_mimlog hs_ctea hs_sctea s_sizelog i.year if school_type==2 & year>1998, fe i(school_id) cl(lsmarket)
outreg2 using "robust1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(GPA FE)

seeout using "robust1.txt", label

*ANALYSIS OF SCHOOLS IN MUNICIPALITIES WITH AT LEAST 1 CORPORATE SCHOOL
*JH
xtmixed complaints jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime mimlog i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year if school_type==1 & year>1998 & jh_1corp==1, || municipality:, || school_id:, ml var
outreg2 using "robust2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) replace  ctitle(Complaints)
xtmixed disorder jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime mimlog i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year if school_type==1 & year>1998 & jh_1corp==1, || municipality:, || school_id:, ml var
outreg2 using "robust2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(Disorder)
xtmixed violence jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime mimlog i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year if school_type==1 & year>1998 & jh_1corp==1, || municipality:, || school_id:, ml var
outreg2 using "robust2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(Violence)
xtmixed jh_GPA jh_herf jh_density jh_sistud minclog crime mimlog jh_forbac jh_edupar i.orgform jh_ctea jh_sctea s_sizelog i.year if school_type==1 & year>1998 & jh_1corp==1, || municipality:, || school_id:, ml var
outreg2 using "robust2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(GPA)
xtreg jh_GPA jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime mimlog jh_ctea jh_sctea s_sizelog i.year if school_type==1 & year>1998 & jh_1corp==1, fe i(school_id) cl(municipality)
outreg2 using "robust2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(GPA FE)

seeout using "robust2.txt", label

		/*HS
		xtmixed complaints hs_herf hs_density hs_sistud hs_forbac hs_edupar minclog crime mimlog i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year if school_type==2 & year>1998 & hs_1corp==1, || municipality:, || school_id:, ml var
		outreg2 using "robust2b.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) replace  ctitle(Complaints)
		xtmixed disorder hs_herf hs_density hs_sistud hs_forbac hs_edupar minclog crime mimlog i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year if school_type==2 & year>1998 & hs_1corp==1, || municipality:, || school_id:, ml var
		outreg2 using "robust2b.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(Disorder)
		xtmixed violence hs_herf hs_density hs_sistud hs_forbac hs_edupar minclog crime mimlog i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year if school_type==2 & year>1998 & hs_1corp==1, || municipality:, || school_id:, ml var
		outreg2 using "robust2b.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(Violence)
		xtmixed hs_GPA hs_herf hs_density hs_sistud hs_forbac hs_edupar minclog crime mimlog i.orgform hs_ctea hs_sctea s_sizelog i.year if school_type==2 & year>1998 & hs_1corp==1, || municipality:, || school_id:, ml var
		outreg2 using "robust2b.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(GPA)
		xtreg hs_GPA hs_herf hs_density hs_sistud hs_forbac hs_edupar minclog crime mimlog hs_ctea hs_sctea s_sizelog i.year if school_type==2 & year>1998 & hs_1corp==1, fe i(school_id) cl(municipality)
		outreg2 using "robust2b.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(GPA FE)
		seeout using "robust2b.txt", label
		*/

*ANALYSIS OF HIGH SCHOOL EDUCATIONAL TRACK IN 94 SCHOOL MARKETS
xtmixed complaints lsm_herf lsm_density lsm_sistud i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime lsm_mimlog i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
outreg2 using "robust3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) replace  ctitle(Complaints)
xtmixed disorder lsm_herf lsm_density lsm_sistud i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime lsm_mimlog i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
outreg2 using "robust3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(Disorder)
xtmixed violence lsm_herf lsm_density lsm_sistud i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime lsm_mimlog i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
outreg2 using "robust3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(Violence)
xtmixed hs_GPA lsm_herf lsm_density lsm_sistud i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime lsm_mimlog i.orgform hs_ctea hs_sctea s_sizelog i.year if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
outreg2 using "robust3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("ICC L1", e(rho1), "ICC L2", e(rho2),"-2LL",e(ll),"df",e(df_m)) append  ctitle(GPA)
xtreg hs_GPA lsm_herf lsm_density lsm_sistud i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime lsm_mimlog hs_ctea hs_sctea s_sizelog i.year if school_type==2 & year>1998, fe i(school_id) cl(lsmarket)
outreg2 using "robust3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Model chi-square, e(chi2), Root MSE, e(rmse)) append  ctitle(GPA FE)

seeout using "robust3.txt", label


















