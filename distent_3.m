function td=distent_3(S_c,lbp_hist)%���ؾ��룬a,b������
    ta=S_c-lbp_hist;
    tx=(ta).^2;
    ty=S_c+lbp_hist;
    ty=ty+10^(-4);
    tt=tx./ty;
    td=sum(tt);