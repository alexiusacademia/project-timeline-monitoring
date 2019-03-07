## Content Format of Project File
```json
{
    "project_name" : "Name of the Project",
    "contract_id" : "Contract ID",
    "project_location" : "Location",
    "implementation_year" : "Implementation Year",
    "duration" : 0,                          // Contract Duration
    "original-schedule" : [
        {
            "day": 0,
            "accomp": 0
        }
    ],
    "suspensions" : [
        {
            "day": 25,
            "length": 30
        }
    ],
    "accomplishments" : [
        {
            "day": 0,
            "accomp": 0
        }
    ]
}
```
For the original_schedule, this is the definition of the construction s-curve. Each object entry shal contain the day elapsed and the correspongind target accomplishment in percent.

For the suspensions, each object shall contains the effective day of the suspensions and the length the work is suspended.