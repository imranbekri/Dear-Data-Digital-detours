# Digital Detours

## About the Project

Digital Detours is my Dear Data project for the Creative Coding module at City St George's, University of London.

My project investigates how planned phone use can turn into unexpected distractions. I am collecting data from my own phone-use sessions to explore the relationship between what I originally intended to do, how long I spent on my phone, and whether I became distracted.

The aim is to turn these everyday observations into a visual representation using Processing (Java mode).

## Data Collection

I record individual phone-use sessions based on my actual phone activity.

**Current progress:**
- **35 genuine individual observations** collected
- **11 collection days** represented in the main dataset
- Part 1 target of 25 observations achieved
- Final project target: 100 observations

My data is stored in `DigitalDetours/data/observations.csv`.

### Data Fields

Each observation contains 12 fields:

| Field | Description |
|---|---|
| `id` | Unique observation number |
| `day` | Numbered day of data collection |
| `period` | Time of day: AM, PM or EVE |
| `intended` | Original purpose of using my phone |
| `ended` | Category of activity at the end of the session |
| `detour` | Whether a distraction occurred (yes/no) |
| `minutes` | Total session duration in minutes |
| `completed` | Whether the intended task was completed |
| `provenance` | How the observation was obtained |
| `start_app` | Application used at the beginning |
| `end_app` | Application used at the end |
| `detour_minutes` | Time spent on the distraction |

I have also reviewed iPhone Screen Time data for 27 and 28 October to support my ongoing data collection. These additional app-duration records are maintained separately from the 35 individual observations in the main CSV.

## Processing Visualisation

The project uses Processing in Java mode to read the CSV file and display the observations visually.

Each phone-use session is represented by a circle.

### Visual Design

- **Red circles** represent sessions where a detour occurred.
- **Green circles** represent sessions without a detour.
- **Circle size** represents the duration of the phone-use session.
- **Labels** identify individual observations and their durations.
- Circles are arranged in rows of five to make comparisons easier.

This allows me to compare sessions visually and identify patterns in phone use and distraction.

## Project Structure

```text
DigitalDetours/
├── DigitalDetours.pde
└── data/
    └── observations.csv
```

The `.pde` file contains the Processing sketch, while the `.csv` file contains my collected observations.

## How to Run

1. Download or clone this GitHub repository.
2. Open `DigitalDetours/DigitalDetours.pde` in Processing.
3. Make sure Processing is set to **Java mode**.
4. Check that `observations.csv` is inside the sketch's `data` folder.
5. Press **Run** to launch the visualisation.

The sketch reads the CSV using Processing's `loadTable()` function.

## Development Progress

So far, I have:

- Collected and organised 35 genuine individual phone-use observations.
- Created a CSV dataset containing 12 fields.
- Stored my project on GitHub.
- Developed a Processing sketch that reads external CSV data.
- Used colours and circle sizes to represent different aspects of the data.
- Created a custom Java method that returns a value.
- Worked on improving the visual layout as the dataset grows.
