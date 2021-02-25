# SPECIFICATIONS 

This document gives an overview of the backend of the SmartPhone app **NodOn Connect**, it will specify the services we are going to use and for what purpose.
This document is versioned and can change over time. 

## ARCHITECTURE 

The backend of the solution will be hosted on GCP (Google Cloud Platform) and mostly use various tools offer by Firebase services. 

The list of Firebase tool that we are going to use is : 


|  Service |  Description  |   
|---|---|
| Cloud Firestore   | Document database type, we will use it to store a collection of the different available firmware for each type of product.  |
| Cloud Storage  |  The firmware binary file that is needed to perform the OTA (Update Over the Air) |
| Cloud Functions  | They are cloud functions that will be launch based on an event in Cloud Firestore or base on Specific time frequencies   |
| Google analytics  |  GA will be used to store specific event of the user actions in the app to monitor the app usage (When an Update is performed if there is an error, etc ...) |

<br>

**Global Architecture map of the Backend related to the Smartphone App "NodOn Connect".**

![](./NodonConnectArchitecture.png)


## Devices

A device will advertise pieces of information in the BLE frame, those information will be necessary to perform the right query on the Cloud Firestore collection to know if there is a firmware update that needs to be done. Those pieces of information will at least be : 

- The type of device
- The unique ID of the device
- The actual version of the First firmware in the device
- The actual version of the Second firmware in the device
  
  Since the device contains two firmware, it is possible that it's will be necessary to perform a firmware update twice in a row. 


  ## Cloud Firestore 

  A collection of the document will be used as a database that needs to be requested for each device discovered from the app. 

  That document will give the information of the latest available firmware for firmware One and Two for a specific device and its location to be downloaded from Firebase Cloud storage. 

  A collection for each device will be created and the document will be updated when the device is scanned somewhere including some basic information about the smartphone being used. It will be a log for a specific device that we can use to track the life of a device. Those documents won't be publicly accessible by the public for reading but only for an update. 


  ## Cloud Storage 

  Based on the information's given from cloud Firestore, Firmware will be stored and ready to be downloaded into the app from  Cloud storage. Firmware files mustn't be cached locally in the app. (except if it's done automatically by the Firebase SDK).


  ## Cloud functions 

  Cloud functions will be managed by NodOn, which we will use to keep track of the global activities related to devices being scanned and updated. 
  They will probably send some automatic reports into a specific O365 Teams channel so the NodOn Team can get a regular overview. 

  ## Google analytics 

  GA will be used mostly to register anonymous events such as a successful device update or failure to do so. 

