function td=distent_2(S_c,lbp_hist)%���ؾ��룬a,b������
lbp_hist=lbp_hist+10^(-5);
ta=log(lbp_hist);
tb=S_c.*ta;
td=-sum(tb);