function [connectivity] = toConnectivity8(inputImage)
%Every pixel visit one by one according to 8 - neigbhour

    connectivity = {};
    k =1;
    row = size(inputImage,1);
    col = size(inputImage,2);
    for r =1: row
        for c=1 : col 
            if(inputImage(r, c) == 1) 
                   set(0,'RecursionLimit',50000);
                   [inputImage, pList] = visitConnected(inputImage, r, c);
                   [pRow,pCol] = size(pList);
                   if(pRow ~= 0)
                       connectivity{1,k} = pList;
                       k = k +1;
                   end
                     
                        
            end
        end
    end
end


function  [inputImage, pList] = visitConnected(inputImage,i,j)
    pList = {};
    if ( isReachedToEdgeOfImage ( inputImage, i, j ) )
         return;
    end

    if(inputImage(i, j) == 0) 
        return;
    end
    
    strCurrent = strcat( int2str(i) , ',' );
    strCurrent = strcat( strCurrent ,int2str(j) );
    pList{1,1} = strCurrent;

    %visited pixel set to 0
    inputImage(i, j)  = 0;
    
    [inputImage,p1] = visitConnected(inputImage, i - 1, j+1);           
    pList = catArrays ( pList, p1 );                 
    [inputImage, p1]= visitConnected(inputImage, i - 1, j);        
    pList = catArrays ( pList, p1 );              
    [inputImage, p1] = visitConnected(inputImage, i-1, j - 1);        
    pList = catArrays ( pList, p1 );          
    [inputImage, p1] = visitConnected(inputImage, i, j - 1);        
    pList = catArrays ( pList, p1 );          
    [inputImage, p1] = visitConnected(inputImage, i, j + 1);        
    pList = catArrays ( pList, p1 );           
    [inputImage, p1] = visitConnected(inputImage, i+1, j +1); 
    pList = catArrays ( pList, p1 );      
    [inputImage, p1] = visitConnected(inputImage, i+1, j);    
    pList = catArrays ( pList, p1 );     
    [inputImage, p1] = visitConnected(inputImage, i+1, j-1);       
    pList = catArrays ( pList, p1 );

end

function [pList] = catArrays(pList,temp)
    [r,c] = size(temp);
    if(r ~= 0)
        pList = cat(1,pList,temp);
    end
end

function [res] = isReachedToEdgeOfImage(inputImage,i,j)
    row = size(inputImage,1);
    col = size(inputImage,2);
    
    res = false;
    if( i < 0 || i == row+1 || j<0 ||  j==col+1)
        res = true;
    end
end

