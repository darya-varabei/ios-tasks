let matrix = [
[0,2,5,6,7],
    [2,5,2,6,9],
    [3,5,1,9,6],
    [8,4,5,3,7],
    [3,6,4,8,2]
]

matrix[3][4]

let country = [
    "Italy": [
        "data": [
            "area": "301.23",
                "population": "59.55",
            "language": ["1": "Italian"],
            "flagColors": ["1": "Red", "2": "White", "3": "Green"]
        ],
        "nationalDishes": ["1": "Pizza", "2": "Pasta", "3": "Pita"]
    ],
    
    "Sweden": [
        "data": [
            "area": "450.29",
            "population": "10.402",
            "language": ["1": "Swedish", "2": "Finish"],
            "flagColors": ["1": "Blue", "2": "Yellow"]
        ],
        "nationalDishes": ["1": "Meatballs", "2": "Lingonberry Jam", "3": "Pyttipanna"]
    ]
]

let italian = country["Italy"]?["data"]?["area"]
let swedish = country["Sweden"]?["data"]?["language"]
