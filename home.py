import json
import os
import calendar
import time
import random


##*************run thread***********

import threading

class Task(threading.Thread):
    """Thread chargé simplement d'afficher une lettre dans la console."""
    def __init__(self,region):
        threading.Thread.__init__(self)
        self.region = region

    def run(self):
        """Code à exécuter pendant l'exécution du thread."""
        filestep='C:/scale/home/'+self.region+'/'+self.region+'.sh'
        cmdline = r'"C:\Program Files\Git\bin\sh.exe" '+filestep
        cmdline = filestep
        os.system(cmdline)





fileregion="region.txt"


dataregion = [line.rstrip('\n') for line in open(fileregion)]




#for i in range(len(dataregion)):
def deploy(dataregionvalue):
    pathparameters="home/"+dataregionvalue+"/parameters.json"
    #pathtemplate="home/"+dataregionvalue+"/template.json"


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



# Append threads
threads = [Task(dataregion[i]) for i in range(0, len(dataregion))]




# Start all threads
i=0
for t in threads:
    deploy(dataregion[i])
    print(dataregion[i])
    t.start()
    i=i+1
# Ensure all of the threads have finished
for t in threads:
    t.join()