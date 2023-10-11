# Traffic Light Controller
- Here is our cross road:
```
                       ┌────┐
                       │    │
                       │    │
                       │Farm│
                       │Road│
                       │    │
                       │    │
                       │cow │
┌──────────────────────┘    └─────────────────────┐
│                                                 │
│ Super Massive         Stop           Highway    │
│                      Lights                     │
│                                                 │
└──────────────────────┐    ┌─────────────────────┘
                       │    │
                       │    │
                       │    │
                       │    │
                       │    │
                       │    │
                       │    │
                       └────┘
```
- We must design a traffic light controller to save the cows.
- Here is the state diagram:

![FSM](FSM.png)

- FSM description:

| Input | Description |
| :----: | :------------------: |
| reset | Place FSM in initial state |
| C | Detect vehicle on farm road |
| TS | Short time interval expired |
| TL | Long time interval expired |


| Outputs | Description |
| :--------: | :--------------: |
| HG, HY, HR | Assert green/yellow/red highway lights |
| FG, FY, FR | Assert green/yellow/red farm lights |
| ST | Start timing a short or long interval |


| State | Description |
| :---: | :-------------------: |
| S0 | Highway Green / Farm road Red |
| S1 | Highway Yellow / Farm road Red |
| S2 | Farm road Green / Highway Red |
| S3 | Farm road Yellow / Highway Red |


- Design a Mealy FSM for the traffic light controller.
- Write a test bench and verify the FSM.
- Upload the code to this folder.
