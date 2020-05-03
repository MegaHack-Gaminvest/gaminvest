# Gaminvest

# Modules

- Name
- Description
- Order: integer
- Score (computed from phases)
- 1:N Phases
  - Name
  - Content
  - Score
- 1:1 Survey
- 1:1 Module (Next Module)

# Achievement

- Extra Points
- Name
- Image URL

# Survey

- Name
- 1:N Questions

# Question

- Content
- Correct Option ID
- 1:N Options

# Option

- Content

# Human

- Name
- External ID

# Human Phases

- Human ID
- Phase ID
- Status

# Human Achievements 

- Human ID
- Achievement ID

# Human Points

- Human ID
- Points
- Points Added Date

# Human Conversions

- Human ID
- Amount Of Points Converted
- Amount Of Money Converted
- Conversion Date

# Human Savings

- Human ID
- Amount

totalPoints = humanPoints - amountOfPointsConverted
totalMoney = moneyConverted

{
  "user": {
    "name": "blah",
    ...
  },
  "achievements": [
    {
      "id": "<uuid>",
      "name": "Tal",
      "description": "blabla",
    },
    ...
  ],
  "completedModules": [
    {
      "id": "<uuid>>,
      "name": "Básico",
      "description": "Neste módulo...",
    },
    ...
  ]
}