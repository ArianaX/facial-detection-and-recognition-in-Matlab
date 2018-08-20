function td=distent_1(S_c,lbp_hist)%返回距离，a,b是向量
td=abs(S_c-lbp_hist);
td=sum(td);