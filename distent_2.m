function td=distent_2(S_c,lbp_hist)%返回距离，a,b是向量
lbp_hist=lbp_hist+10^(-5);
ta=log(lbp_hist);
tb=S_c.*ta;
td=-sum(tb);