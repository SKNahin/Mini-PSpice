function x=pointx(type,initial,final)

if(type==11)
    for i=0:15
        if( floor(initial/10^i)<=9 && floor(initial/10^i)>=1)
            start=i;
        end
        if( floor(final/10^i)<=9 && floor(final/10^i)>=1)
            ending=i;
        end
    end
    ini=initial;
    fin=final;
    fix=1;
    for i=start+1:ending
        xt=linspace(ini,10^i,500);
        ini=10^i+0.000001;
        if(fix)
            x=xt;
            fix=0;
        else
            x=[x,xt];
        end
        
    end
    
elseif(type==1 || type==2)
    
    x=initial:0.000001:final;
end
