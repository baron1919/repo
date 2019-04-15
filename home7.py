import json
import os
import calendar
import time
import random
import subprocess

def replacemotinfile(file,searchExp,replaceExp):
    lines = open(file).read().splitlines()
    i=0
    for line in lines:
        if searchExp in line:
            lines[i] = replaceExp
        i=i+1
    open(file,'w').write('\n'.join(lines))


def getloginpass(file):
    lines = open(file).read().splitlines()
    linelogin=lines[0]
    linepass=lines[1]



    pos1=linelogin.index(' ')
    pos2=linepass.index(' ')
    varlogin=linelogin[pos1+1:]
    varpass=linepass[pos2+1:]
    return [varlogin,varpass]

def runcmdline1(varlogin,varpass):

    cmdline1='az login -u"'+varlogin+'" -p "'+varpass+'"'
    print(cmdline1)
    process =os.popen(cmdline1)
    preprocessed = process.read()
    process.close()
    output = json.loads(preprocessed)
    return(output[0]['id'])


def runcmdline2():
    cmdline2='az group list'
    process =os.popen(cmdline2)
    preprocessed = process.read()
    process.close()
    output = json.loads(preprocessed)
    return(output[0]['name'])



##*************run thread***********

import threading

class Task(threading.Thread):
    """Thread chargĂ© simplement d'afficher une lettre dans la console."""
    def __init__(self,region):
        threading.Thread.__init__(self)
        self.region = region

    def run(self):
        filestep='C:/scale/home/'+self.region+'/'+self.region+'.bat'
        print(filestep)
        p = subprocess.Popen(filestep, shell=True, stdout = subprocess.PIPE)
        stdout, stderr = p.communicate()
        print(stdout)
        print (p.returncode) # is 0 if success





fileregion="region.txt"
#filelinedeploymentName="linedeploymentName.txt"
#filelinesparms="linesparmsparametersjson.txt"

dataregion = [line.rstrip('\n') for line in open(fileregion)]

#linedeploymentName = [line.rstrip('\n') for line in open(filelinedeploymentName)]
#linedeploymentName=linedeploymentName[0]



#dataparms = [line.rstrip('\n') for line in open(filelinesparms)]
#param1=dataparms[0]
#param2=dataparms[1]
#param3=dataparms[2]

#for i in range(len(dataregion)):
def deploy(dataregionvalue,parsubid,parresid):
    pathparameters="home/"+dataregionvalue+"/parameters.json"
    #pathtemplate="home/"+dataregionvalue+"/template.json"
    pathstep="home/"+dataregionvalue+"/"+dataregionvalue+".bat"
    #pathstep="home/"+dataregionvalue+"/"+dataregionvalue+".bat"
    #print(pathparameters)

    #***********step.sh******
    searchExp1="subscriptionId="
    replacemotinfile(pathstep,searchExp1,parsubid)
    searchExp2="resourceGroupName="
    replacemotinfile(pathstep,searchExp2,parresid)



    #************parameters.json********
    jsonFile = open(pathparameters, "r") # Open the JSON file for reading
    data = json.load(jsonFile) # Read the JSON into the buffer
    jsonFile.close() # Close the JSON file

    ts = calendar.timegm(time.gmtime())
    timest=str(ts)
    x=random.randint(1,1000)
    strx=str(x)
    
    

    ## Working with buffered content
    data["parameters"]["workspaceName"]["value"]=dataregionvalue[0:6]+timest+strx
    data["parameters"]["location"]["value"]=dataregionvalue

    ## Save our changes to JSON file
    jsonFile = open(pathparameters, "w+")
    jsonFile.write(json.dumps(data))
    jsonFile.close()
    
    



    #************template.json********

    ts = calendar.timegm(time.gmtime())
    timest=str(ts)

    x=random.randint(1,1000)
    strx=str(x)






# Append threads
threads = [Task(dataregion[i]) for i in range(0, len(dataregion))]



#set meta auth
file0="C:/1/1.txt"
auth=getloginpass(file0)
varlogin=auth[0]
varpass=auth[1]

subid=runcmdline1(varlogin,varpass)
resid=runcmdline2()
parsubid ='set subscriptionId="'+subid+'"'
parresid='set resourceGroupName="'+resid+'"'




# Start all threads
i=0
for t in threads:
    try:
        deploy(dataregion[i],parsubid,parresid)
        print(dataregion[i])
        t.start()
        i=i+1
        time.sleep(3)
    except :
        print("Exp "+dataregion[i])







# Ensure all of the threads have finished
#for t in threads:
    #t.join()