function td=distent_3(S_c,lbp_hist)%返回距离，a,b是向量
    ta=S_c-lbp_hist;
    tx=(ta).^2;
    ty=S_c+lbp_hist;
    ty=ty+10^(-4);
    tt=tx./ty;
    td=sum(tt);