function nonMaxI = toNonMax(Gmag, angle)

    rowCount = size(Gmag,1);
    colCount = size(Gmag,2);
    nonMaxI = zeros(rowCount,rowCount);
  
    for i=2:rowCount-1 
        for j=2:colCount-1
            if(angle(i,j)>=22.5 && angle(i,j)<=67.5)
                if (Gmag(i,j) >= Gmag(i+1,j+1))
                    nonMaxI(i,j)= Gmag(i,j);
                else
                    nonMaxI(i,j)=0;
                end
            elseif(angle(i,j)>=67.5 && angle(i,j)<=112.5)
                if (Gmag(i,j) >= Gmag(i+1,j))
                    nonMaxI(i,j)= Gmag(i,j);
                else
                    nonMaxI(i,j)=0;
                end
            elseif (angle(i,j)>=112.5 && angle(i,j)<=157.5)
                if (Gmag(i,j) >= Gmag(i+1,j-1))
                    nonMaxI(i,j)= Gmag(i,j);
                else
                    nonMaxI(i,j)=0;
                end 
            elseif (angle(i,j)<-157.5 && angle(i,j)>=-180)
                if (Gmag(i,j) >= Gmag(i,j-1))
                    nonMaxI(i,j)= Gmag(i,j);
                else
                    nonMaxI(i,j)=0;
                end
            elseif (angle(i,j)<-112.5 && angle(i,j)>=-157.5)
                if (Gmag(i,j) >= Gmag(i-1,j-1))
                    nonMaxI(i,j)= Gmag(i,j);
                else
                    nonMaxI(i,j)=0;
                end
            elseif (angle(i,j)<-67.5 && angle(i,j)>=-112.5)
                if (Gmag(i,j) >= Gmag(i-1,j))
                    nonMaxI(i,j)= Gmag(i,j);
                else
                    nonMaxI(i,j)=0;
                end
            elseif  (angle(i,j)<-22.5 && angle(i,j)>=-67.5)
                if (Gmag(i,j) >= Gmag(i-1,j+1))
                    nonMaxI(i,j)= Gmag(i,j);
                else
                    nonMaxI(i,j)=0;
                end
          elseif(angle(i,j)>=-22.5 && angle(i,j)<22.5)
                if (Gmag(i,j) >= Gmag(i,j+1))
                    nonMaxI(i,j)= Gmag(i,j);
                else
                    nonMaxI(i,j)=0;
                end
            end
  
        end
    end
end


         

