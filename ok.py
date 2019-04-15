import json
import os
import calendar
import time
import random
import subprocess
import datetime
import time
import sys
import string
from threading import Thread



allreg=['centralus','eastus','eastus2','northcentralus','southcentralus','westcentralus','westus','westus2']  
    
tablocation=['eastus']




pathrun='C:/dev/run.bat'
pathtemplate='C:/dev/init.json'

#login="user711928@cloudplatimmersionlabs.onmicrosoft.com"
#passwd="CWo5B=(Qs_]k"
#region="rg711928"


def getloginpass(file):
    lines = open(file).read().splitlines()
    linelogin=lines[0]
    linepass=lines[1]



    pos1=linelogin.index(' ')
    pos2=linepass.index(' ')
    varlogin=linelogin[pos1+1:]
    varpass=linepass[pos2+1:]
    return [varlogin,varpass]




def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))







cpt=0

sizetab=["Standard_DS15_v2","Standard_D15_v2","Standard_F16s"]
size2=[16,20,16]

Standard_DS_v2=[1,1,1,1,1,1,1]

Standard_D_v2=[1,1,1,1,1,1,1]

Standard_F16s=[1,1,1,1,1,1,1]


Total_Cpu=[1,1,1,1,1,1,1]


Process_Total_Cpu=[0,0,0,0,0,0,0]





def setlogin(login,passwd):
    cmd0='az login -u "'+login+'"'+' -p'+' "'+passwd+'"'
    print (cmd0)
    process =os.popen(cmd0)
    preprocessed = process.read()
    process.close()
    print(preprocessed)


#set meta auth
file0="C:/1/1.txt"
auth=getloginpass(file0)
varlogin=auth[0]
varpass=auth[1]



setlogin(varlogin,varpass)


    
    
    
class task(Thread):
    def __init__(self,location,cptp):
        Thread.__init__(self)
        self.cptlocation = location
        self.cpt = cptp

    def run(self):
        try:
            loc=self.cptlocation
            i=self.cpt
            cmd1="az vm list-usage --location "+loc+ " -o json"
            process =os.popen(cmd1)
            preprocessed = process.read()
            process.close()
            output = json.loads(preprocessed)
            for x in output:
                name=x['localName']
                if name.find("Total Regional vCPUs") != -1:
                    a=x['limit']
                    b=x['currentValue']
                    limit=int(a)
                    currentValue=int(b)
                    val=limit-currentValue
                    res=val
                    Total_Cpu[i]=res
                if name.find("Standard DSv2 Family vCPUs") != -1:
                    a=x['limit']
                    b=x['currentValue']
                    limit=int(a)
                    currentValue=int(b)
                    val=limit-currentValue
                    res=val//16
                    Standard_DS_v2[i]=res
                if name.find("Standard Dv2 Family vCPUs") != -1:
                    a=x['limit']
                    b=x['currentValue']
                    limit=int(a)
                    currentValue=int(b)
                    val=limit-currentValue
                    res=val//20
                    Standard_D_v2[i]=res
                if name.find("Standard FS Family vCPUs") != -1:
                    a=x['limit']
                    b=x['currentValue']
                    limit=int(a)
                    currentValue=int(b)
                    val=limit-currentValue
                    res=val//16
                    Standard_F16s[i]=res
               
                    
                    
        except:
            print ("error "+loc)
            
            
def update(sizetabel,nbrwork,nameclst):
    #************parameters.json********
    jsonFile = open(pathtemplate, "r") # Open the JSON file for reading
    data = json.load(jsonFile) # Read the JSON into the buffer
    jsonFile.close() # Close the JSON file
    
    data["num_workers"]=nbrwork
    data["cluster_name"]=nameclst
    data["node_type_id"]=sizetabel
    ## Save our changes to JSON file
    jsonFile = open(pathtemplate, "w+")
    jsonFile.write(json.dumps(data))
    jsonFile.close()
    
def rundb():
    filestep='C:/dev/run.bat'
    print(filestep)
    p = subprocess.Popen(filestep, shell=True, stdout = subprocess.PIPE)
    stdout, stderr = p.communicate()
    print(stdout)
    print (p.returncode)
    


 
                
tabth=[]
i=0
for e in tablocation:
    thread_1 = task(tablocation[i],i)
    tabth.append(thread_1)
    i=i+1

i=0
for e in tablocation:
    thread_1 =tabth[i]
    thread_1.start()
    i=i+1

i=0
for e in tablocation:
    thread_1 =tabth[i]
    thread_1.join()
    i=i+1
        
    

"""
print (Total_Cpu[0])
print (Standard_DS_v2[0])
print (Standard_D_v2[0])
"""


  
a=0
for locationp in tablocation:
    tabadd=[Standard_DS_v2[a],Standard_D_v2[a],Standard_F16s[a]]
    bcl=len(sizetab)
    sizetab=["Standard_DS15_v2","Standard_D15_v2","Standard_F16s"]
    
    for x in range(bcl):
        print(x)
        
                        
        
        admis=Total_Cpu[a]-Process_Total_Cpu[a]
        Process_Total_Cpu[a]=Process_Total_Cpu[a]+size2[x]*tabadd[x]
        tabs=sizetab[x]
        print("_____"+tabs)
        
        #cpt=cpt+1
        #if cpt>total:
            #sys.exit()
        #if cpt==limit1 or cpt==limit2 or cpt==limit3 :
            #time.sleep(tsleep)
        resta=Total_Cpu[a]-Process_Total_Cpu[a]
        divx=20
        if resta<=0:
            #print(tabs)
            add=admis//size2[x]
            add=add-1
            print("_____"+str(add))
            resdev=add//divx
            resmod=add%divx
                
            for i in range(resdev):
                print("_______desv "+str(resdev))
                print("_______resmod "+str(resmod))
                namecls=id_generator()
                update(tabs,19,namecls)
                rundb() 
            if resmod>1:    
                namecls=id_generator()
                res=resmod-1
                print("_________"+str(res))
                update(tabs,res,namecls)
                rundb()
            
            sys.exit()
        else:
            add=tabadd[x]
            add=add-1
            print("_____"+str(add))
            resdev=add//divx
            resmod=add%divx
            for i in range(resdev):
                print("_______desv "+str(resdev))
                print("_______resmod "+str(resmod))                
                namecls=id_generator()
                update(tabs,19,namecls)
                rundb() 
            if resmod>2:    
                namecls=id_generator()
                res=resmod-1
                print("_________"+str(res))
                update(tabs,res,namecls)
                rundb()
                 # run here subprocess.Popen(["bash", "./ok.sh", "1", region, size[0], locationp])
    a=a+1


