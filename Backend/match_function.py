def match_function(a):
    bucket_list=[]
    waiting_list=[]
    m=[]
    for i in a:
        
        if len(a)==0:
            break
        first_guy=i
        
        L=[]
        if first_guy[2]=="Y":
            a.remove(first_guy)
            L.append(first_guy)
        else:
            continue
        
        for j in a:
            
            if (first_guy[0]==j[0]) and (first_guy[1]==j[1]):
                L.append(j)
                
            else:
                if j not in waiting_list:
                    waiting_list.append(j)
                    
        bucket_list.append(L)   

    for x in bucket_list:
        for y in x:
            if y in waiting_list:
                waiting_list.remove(y)   

    return bucket_list,waiting_list
