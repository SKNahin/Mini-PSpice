function value=mini_PSpice(circuit,type,num1,num2,initial,final)

length=size(circuit);
m=length(1,1);
node=0;

for k=1:m
    if( circuit(k,3)>node)
        node=circuit(k,3);
    end
    if( circuit(k,4)>node)
        node=circuit(k,4);
    end
end
%counts the number of nodes

matv=zeros(m+node-1,node-1);
mati=zeros(m+node-1,m);
constant=zeros(m+node-1,1);
%takes matv & mati to make the main matrix as mat=[matv,mati]
if(type~=11)
    
    for k=1:m
        %nodal equations for all node starts
        if(circuit(k,3)~=1)
            if(circuit(k,1)==2 || circuit(k,1)==4 || circuit(k,1)==5 || circuit(k,1)==10)
                mati(m+circuit(k,3)-1,k)=-1;
            else
                
                mati(m+circuit(k,3)-1,k)=1;
            end
            
        end
        if(circuit(k,4)~=1)
            if(circuit(k,1)==2 || circuit(k,1)==4 || circuit(k,1)==5 || circuit(k,1)==10)
                mati(m+circuit(k,4)-1,k)=1;
            else
                mati(m+circuit(k,4)-1,k)=-1;
            end
        end
        
        %nodal equation for all node ends
        
        %component's equation starts
        
        if(circuit(k,3)~=1 && (circuit(k,1)==1 || circuit(k,1)==2 || circuit(k,1)==4 || circuit(k,1)==5))
            matv(k,circuit(k,3)-1)=1;
        end
        %sets all positive the voltage
        
        if(circuit(k,4)~=1 && (circuit(k,1)==1 || circuit(k,1)==2 || circuit(k,1)==4 || circuit(k,1)==5))
            matv(k,circuit(k,4)-1)=-1;
        end
        %sets all the negative voltage
        
        if(circuit(k,1)==1)
            mati(k,k)=-circuit(k,2);
        end
        %sets the resistor value as current's coefficient
        
        if(circuit(k,1)==2)
            constant(k,1)=circuit(k,2);
        end
        %sets the Independent voltage source's value as equations constant
        
        if(circuit(k,1)==3 || circuit(k,1)==6 || circuit(k,1)==7)
            mati(k,k)=1;
            if(circuit(k,1)==3)
                constant(k,1)=circuit(k,2);
            end
        end
        %sets equatin for current sources
        
        if(circuit(k,1)==4 || circuit(k,1)==6)
            if(circuit(k,5)~=1)
                matv(k,circuit(k,5)-1)=matv(k,circuit(k,5)-1)-circuit(k,2);
            end
            
            if(circuit(k,6)~=1)
                matv(k,circuit(k,6)-1)=matv(k,circuit(k,6)-1)+circuit(k,2);
            end
        end
        %sets the dependent parts for the equation of VDVS & VDCS
        
        if(circuit(k,1)==5 || circuit(k,1)==7)
            mati(k,circuit(k,5))=mati(k,circuit(k,5))-circuit(k,2);
        end
        
        %sets the dependent parts for the equation of CDVS &CDCS
        
        if(circuit(k,1)==8)
            mati(k,k)=1;
        end
        
        %sets the value for capacitor
        
        
        if(circuit(k,1)==9)
            if(circuit(k,3)~=1)
                matv(k,circuit(k,3)-1)=1;
            end
            if(circuit(k,4)~=1)
                matv(k,circuit(k,4)-1)=-1;
            end
        end
        
        %sets the value for inductor
        
        if(circuit(k,1)==10)
            if(circuit(k,3)~=1)
                matv(k,circuit(k,3)-1)=1;
            end
            if(circuit(k,4)~=1)
                matv(k,circuit(k,4)-1)=-1;
            end
        end
        
        %sets the value for AC voltage source
        
        if(circuit(k,1)==11)
            mati(k,k)=1;
        end
        
        %sets the value for AC current source
        
        
        
    end
    matv;
    mat=[matv,mati]
    zero=zeros(node+m-1,1);
    if(constant==zero)
        DC=zeros(node+m-1,1);
        
    else
        DC=mat\constant;
    end
    %Analysis of the DC part of the circuit ends here
    
    %Analysis of the AC part starts here
    n=0;
    %initially the number of sin source=n=zero
    for j=1:m
        if(circuit(j,1)==10 || circuit(j,1)==11)
            n=n+1;
            %if there is any sin source n increases
            matv=zeros(m+node-1,node-1);
            mati=zeros(m+node-1,m);
            
            ac_sources(n,:)=circuit(j,:);
            frequency=ac_sources(n,5);
            phase=ac_sources(n,6);
            constant=zeros(m+node-1,1);
            %takes necessary matrix to determine mat for each sin source individually
            
            for k=1:m
                %nodal equations for all node starts
                if(circuit(k,3)~=1)
                    if(circuit(k,1)==2 || circuit(k,1)==4 || circuit(k,1)==5 || circuit(k,1)==10)
                        mati(m+circuit(k,3)-1,k)=-1;
                    else
                        
                        mati(m+circuit(k,3)-1,k)=1;
                    end
                    
                end
                
                if(circuit(k,4)~=1)
                    if(circuit(k,1)==2 || circuit(k,1)==4 || circuit(k,1)==5 || circuit(k,1)==10)
                        mati(m+circuit(k,4)-1,k)=1;
                    else
                        mati(m+circuit(k,4)-1,k)=-1;
                    end
                end
                
                %nodal equation for all node ends
                
                %component's equation starts
                
                if(circuit(k,3)~=1 && (circuit(k,1)==1 || circuit(k,1)==2 || circuit(k,1)==4 || circuit(k,1)==5 || circuit(k,1)==8 || circuit(k,1)==9 || circuit(k,1)==10))
                    matv(k,circuit(k,3)-1)=1;
                end
                %sets all the positive voltage
                
                if(circuit(k,4)~=1 && (circuit(k,1)==1 || circuit(k,1)==2 || circuit(k,1)==4 || circuit(k,1)==5 || circuit(k,1)==8 || circuit(k,1)==9 || circuit(k,1)==10))
                    matv(k,circuit(k,4)-1)=-1;
                end
                %sets all the negative voltage
                
                if(circuit(k,1)==1)
                    mati(k,k)=-circuit(k,2);
                end
                %sets the resistor value as current's coefficient
                
                if(circuit(k,1)==3 || circuit(k,1)==6 || circuit(k,1)==7 || circuit(k,1)==11)
                    mati(k,k)=1;
                end
                %sets equation for current sources
                
                if((circuit(k,1)==4 || circuit(k,1)==6) )
                    if(circuit(k,5)~=1)
                        matv(k,circuit(k,5)-1)=matv(k,circuit(k,5)-1)-circuit(k,2);
                        
                    end
                    
                    if(circuit(k,6)~=1)
                        matv(k,circuit(k,6)-1)=matv(k,circuit(k,6)-1)+circuit(k,2);
                    end
                end
                %sets the dependent parts for the equation of VDVS & VDCS
                
                if((circuit(k,1)==5 || circuit(k,1)==7))
                    mati(k,circuit(k,5))=mati(k,circuit(k,5))-circuit(k,2);
                end
                
                %sets the dependent parts for the equation of CDVS &CDCS
                
                if(circuit(k,1)==8)
                    mati(k,k)=1i*(1/(2*pi*frequency*circuit(k,2)));
                end
                
                %sets the value for capacitor
                
                
                if(circuit(k,1)==9)
                    mati(k,k)=-1i*(2*pi*frequency*circuit(k,2));
                end
                
                %sets the value for inductor
                
                if((circuit(k,1)==10 || circuit(k,1)==11) && j==k)
                    constant(k,1)=circuit(k,2)*exp(1i*phase);
                end
                
                %sets the value of constant for AC voltage & current source
                
            end
            
            mat=[matv,mati];
            temp=mat\constant;
            AC(n,:)=temp';
            
            %AC value(complex) for the sources is stored here one by one
        end
        
    end
    
    value=0;
    if(n>0)
        AC=AC';
        if(type==1)
            %start to find the voltage difference of given nodes
            if(num1~=1)
                valueDC1=DC(num1-1,1);
            else
                valueDC1=0;
            end
            if(num2~=1)
                valueDC2=DC(num2-1,1);
            else
                valueDC2=0;
            end
            value=valueDC1-valueDC2;
            
            %puts the DC voltage difference first in value
            
            if(n>0)
                k=initial:0.000001:final;
                if(num1~=1)
                    value1=AC(num1-1,:);
                else
                    value1=zeros(1,n);
                end
                
                if(num2~=1)
                    value2=AC(num2-1,:);
                else
                    value2=zeros(1,n);
                end
                
                all_value=value1-value2;
                p=angle(all_value);
                a=abs(all_value);
                %finds the AC voltage difference information first
                
                for add=1:n
                    if(add==1)
                        value=bsxfun(@plus,a(1,add)*sin((2*pi*ac_sources(add,5)*k)+p(1,add)),value);
                        %adds the dc value with first ac value
                    elseif(add~=1)
                        value=value+a(1,add)*sin((2*pi*ac_sources(add,5)*k)+p(1,add));
                        %adds other dc value with value
                    end
                end
            end
        end
        
        if(type==2)
            %starts to find the current of given component
            value=DC(node-1+num1,1);
            if(n>0)
                k=initial:0.000001:final;
                p=angle(AC);
                a=abs(AC);
                for add=1:n
                    if(add==1)
                        value=bsxfun(@plus,a(node-1+num1,add)*sin((2*pi*ac_sources(add,5)*k)+p(node-1+num1,add)),value);
                        %adds the dc value with first ac value
                    elseif(add~=1)
                        value=value+a(node-1+num1,add)*sin((2*pi*ac_sources(add,5)*k)+p(node-1+num1,add));
                        %adds the other dc value with value
                    end
                    
                end
            end
        end
    end
    
    if(n==0)
        %if there is no ac source this part will return required DC value
        for i=2:node
            Node_Voltage(i-1,1)=i;
            Node_Voltage(i-1,2)=DC(i-1,1);
            
        end
        for i=1:m
            Component_Current(i,1)=i;
            Component_Current(i,2)=DC(node-1+i,1);
        end
        if(type==1)
            if(num1~=1 && num2~=1)
                value=Node_Voltage(num1-1,2)-Node_Voltage(num2-1,2);
            elseif(num1==1)
                value=-Node_Voltage(num2-1,2);
            elseif(num2==1)
                value=Node_Voltage(num1-1,2);
            end
            
        elseif(type==2)
            value=Component_Current(num1,2);
            
        end
        Node_Voltage
        Component_Current
    end
    
    
    
    
    
elseif(type==11)
    
    
    for k=1:m
        
        %nodal equations for all node starts
        if(circuit(k,3)~=1)
            if(circuit(k,1)==12)
                mati(m+circuit(k,3)-1,k)=-1;
            else
                
                mati(m+circuit(k,3)-1,k)=1;
            end
            
        end
        if(circuit(k,4)~=1)
            if(circuit(k,1)==12)
                mati(m+circuit(k,4)-1,k)=1;
            else
                mati(m+circuit(k,4)-1,k)=-1;
            end
        end
        
        %nodal equation for all node ends
        
        %component's equation starts
        
        if(circuit(k,3)~=1)
            matv(k,circuit(k,3)-1)=1;
        end
        %sets all the positive voltage
        
        if(circuit(k,4)~=1)
            matv(k,circuit(k,4)-1)=-1;
        end
        %sets all the negative voltage
        
        if(circuit(k,1)==12)
            constant(k,1)=circuit(k,2)*exp(1i*circuit(k,5));
        end
        
        %sets the value of constant for VAC
        
        if(circuit(k,1)==1)
            mati(k,k)=-circuit(k,2);
        end
        %sets the resistor value as current's coefficient
    end
    
    
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
    %gets the value for semilog plot
    
    length=size(x);
    for j=1:length(1,2)
        frequency=x(1,j);
        for k=1:m
            if(circuit(k,1)==8)
                mati(k,k)=1i*(1/(2*pi*frequency*circuit(k,2)));
            end
            
            %sets the value for capacitor for each frequency
            
            
            if(circuit(k,1)==9)
                mati(k,k)=-1i*(2*pi*frequency*circuit(k,2));
            end
            
            %sets the value for inductor for each frequency
            
            mat=[matv,mati];
            temp=mat\constant;
            all_value(j,:)=temp';
        end
        
    end
    
    
    all_value=all_value';
    
    if(num1~=1 && num2~=1)
        %starts to find required voltage difference's absolute value
        value=all_value(num1-1,:)-all_value(num2-1,:);
    elseif(num1==1)
        value=-all_value(num2-1,:);
    elseif(num2==1)
        value=all_value(num1-1,:);
    end
    
    value=abs(value);
    %returns absolute value
    
end

