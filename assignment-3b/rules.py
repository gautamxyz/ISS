import csv
import json


with open('rules.json', 'r') as abc:
    list = json.load(abc)   # list is a list of dictionaries in rules.json

# Derive the rules from rules.json

with open('rules.csv','w') as rules:
    csvWriter = csv.writer(rules)
    for dict in list:
        # Get dictionary attributes like profession, travel etc for each dict
        profession = dict.get('fields').get('profession')
        travel = dict.get('fields').get('travel')
        symptomatic = dict.get('fields').get('symptomatic')
        chronic = dict.get('fields').get('chronic')
        status = dict.get('status')
        result = dict.get('results')

        line = [profession] + [travel] + [symptomatic] + [chronic] + [status] + [result]
        
        csvWriter.writerow(line) # writing the rules in rules.csv 
