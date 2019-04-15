
import json
import os
import calendar
import time

##*************run thread***********

import threading

class Task(threading.Thread):
    """Thread chargé simplement d'afficher une lettre dans la console."""
    def __init__(self,region):
        threading.Thread.__init__(self)
        self.region = region

    def run(self):
        """Code à exécuter pendant l'exécution du thread."""
        filestep=self.region+'.sh'
        cmdline = r'"C:\Program Files\Git\bin\sh.exe" '+filestep
        os.system(cmdline)





def addfirst(file,line):
    with open(file, 'r+') as f:
        file_data = f.read()
        f.seek(0, 0)
        f.write(line.rstrip('\r\n') + '\n' + file_data)


def delfirst(file):
    with open(file, 'r') as fin:
        data = fin.read().splitlines(True)
    with open(file, 'w') as fout:
        fout.writelines(data[1:])








pathparameters="parameters.json"
pathtemplate="template.json"





fileregion="region.txt"
filelinedeploymentName="linedeploymentName.txt"
filelinesparms="linesparmsparametersjson.txt"

dataregion = [line.rstrip('\n') for line in open(fileregion)]

linedeploymentName = [line.rstrip('\n') for line in open(filelinedeploymentName)]
linedeploymentName=linedeploymentName[0]



dataparms = [line.rstrip('\n') for line in open(filelinesparms)]
param1=dataparms[0]
param2=dataparms[1]
param3=dataparms[2]






def deploy(dataregionvalue):

    #************parameters.json********
    jsonFile = open(pathparameters, "r") # Open the JSON file for reading
    data = json.load(jsonFile) # Read the JSON into the buffer
    jsonFile.close() # Close the JSON file

    ts = calendar.timegm(time.gmtime())
    timest=str(ts)

    ## Working with buffered content
    data["parameters"]["clusterName"]["value"]=dataregionvalue[0:6]+timest
    data["parameters"]["location"]["value"]=dataregionvalue

    ## Save our changes to JSON file
    jsonFile = open(pathparameters, "w+")
    jsonFile.write(json.dumps(data))
    jsonFile.close()






    #************template.json********

    ts = calendar.timegm(time.gmtime())
    timest=str(ts)
    idstore=dataregionvalue[0:6]+timest
    print(idstore)
    valueparam1=param1.replace("XXX",idstore)
    valueparam2=param2.replace("XXX",idstore)
    valueparam3=param3.replace("XXX",idstore)

    jsonFile2 = open(pathtemplate, "r") # Open the JSON file for reading
    data2 = json.load(jsonFile2) # Read the JSON into the buffer
    jsonFile2.close() # Close the JSON file

    ## Working with buffered content
    data2["resources"][0]["dependsOn"][0]=valueparam1
    data2["resources"][0]["properties"]["storageProfile"]["storageaccounts"][0]["name"]=valueparam2
    data2["resources"][0]["properties"]["storageProfile"]["storageaccounts"][0]["key"]=valueparam3
    data2["resources"][1]["name"]=idstore
    data2["resources"][1]["location"]=dataregionvalue
    data2["parameters"]["location"]["defaultValue"]=dataregionvalue

    ## Save our changes to JSON file
    jsonFile2 = open(pathtemplate, "w+")
    jsonFile2.write(json.dumps(data2))
    jsonFile2.close()



    #cmdline = r'"C:\Program Files\Git\bin\sh.exe" step.sh'
    #os.system(cmdline)





#for i in range(len(dataregion)):


# Append threads
threads = [Task(dataregion[i]) for i in range(0, len(dataregion))]



# Start all threads


# Start all threads
i=0
for t in threads:
    deploy(dataregion[i])
    print(dataregion[i])
    t.start()
    time.sleep(3)
    i=i+1
# Ensure all of the threads have finished
for t in threads:
    t.join()






#addfirst("test.txt","ok155")
#delfirst("test.txt")
#delfirst("step.sh")


















