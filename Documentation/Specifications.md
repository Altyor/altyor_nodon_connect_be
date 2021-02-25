# SPECIFICATIONS 


## ARCHITECTURE 

The backend of the solution will be hosted on GCP (Google Cloud Plateform) and mostly use various tools offer by Firebase services. 

The list of Firebase tool that we are going to use is : 


|  Service |  Description  |   
|---|---|
| Cloud Firestore   | Document database type, we will use it to store a collection of the different available firmware for each type of product.  |
| Cloud Storage  |  The firmware binary file that is needed to perform the OTA (Update Over the Air) |
| Cloud Functions  | They are cloud functions that will be launch based on event in Cloud Firestore or base on Specific time frequencies   |
| Google analytics  |  GA will be use to store specific event of the user actions in the app to monitor the app usage (When a Update is performed, if there is an error, ect ...) |

<br>

**Global Architecture map of the Backend related to the Smartphone App "NodOn Connect".**

![](./NodonConnectArchitecture.png)


