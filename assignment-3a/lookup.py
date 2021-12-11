from rules import rules     #getting the dict from rules.py
import csv
import os

import pandas as pd
def see(p,t,s):
    p=p.replace("'","")  # remove single quotes if any
    t=t.replace("'","")
    s=s.replace("'","")
    for item in rules:   #item is a dictionary containg keys "fields" and "results"
        
        
        
        count=0 # to check how many fields get matched
        
        for field in item["fields"]:     #field will be one of profession,travel,symptomatic
            c=item['fields']
            
            if(p==c[field]):           #if profession entry matches 
                #print(c[field],p)
                count=count+1
                
                #continue
            elif t==c[field] and count==1:  #if travel entry matches
                count+=1
                
            elif s==c[field] and count==2:  #if symptomatic entry matches
                count+=1
                
        if count==3:                    #if all 3 entries match we are done
            return item["results"]
            


           
input_file=csv.DictReader(open('data.csv','r')) # to read csv file as a dict. First row headings act as key while cols in subsequent rows behave as val

out_file=open('results.csv' ,'a')
header=['email','profession','travel','symptomatic','chronic','results'] # headings to be written in results.csv
writer=csv.writer(out_file)
if os.stat('results.csv').st_size ==0:      # write headings only if the results.csv is empty
    writer.writerow(header)
for row in input_file:         # read results.csv row by row
    result=see(row["profession"],row["travel"],row["symptomatic"])  #obtain result from see function
    
    data=[row["email"],row["profession"],row["travel"],row["symptomatic"],row["chronic"],result]   #data to be printed for the current row in results.csv
    
    writer.writerow(data) #print data into results.csv

out_file.close() # close results.csv
