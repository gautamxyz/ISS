import csv
import os
reader1 = csv.reader(open('data.csv', 'r'), delimiter=',', quotechar='"') # reading data.csv


out_file=open('results.csv' ,'w')
header=['email','profession','travel','symptomatic','chronic','results'] # headings to be written in results.csv
writer=csv.writer(out_file)
if os.stat('results.csv').st_size ==0:      # write headings only if the results.csv is empty
    writer.writerow(header)

i=0

for row1 in reader1:       #reading data.csv row by row
    i+=1
    count=0  #to check if the rule combination is present in rules.json or not
    if i==1:
        continue # skip the headers line in data.csv
    reader2=csv.reader(open('rules.csv', 'r'), delimiter = ',', quotechar = '"') #reading rules.csv, starting from first line everytime
    for row2 in reader2:        #reading rules.csv row by row

        if row1[1]==row2[0] and row1[2]==row2[1] and row1[3]==row2[2] and row1[4]==row2[3] :  # if profession,travel,symptomatic,chronic fields of current row of data.csv match with a combination in rules.csv
            if row2[4]=="In Active":                                        # if status In Active then results=No Access
                data=[row1[0],row1[1],row1[2],row1[3],row1[4],"No Access"]
                writer.writerow(data)  # writing the records and the obtained result for the entry in data.csv into results.csv
                count+=1
                break

    
            else:
                data=[row1[0],row1[1],row1[2],row1[3],row1[4],row2[5]]  # add the result if status is not In Active
                writer.writerow(data)
                count+=1
                break
    if count==0: #if rule combination not present in rules.json then print No Access
        data=[row1[0],row1[1],row1[2],row1[3],row1[4],"No Access"]
        writer.writerow(data)  # writing the records and the obtained result for the entry in data.csv into results.csv
        count+=1

out_file.close() 
