Feature: json feature
Scenario: json scenario

* def jsonObject = 
"""
[
{
"name" : "Hashim",
"city" : "Lahore",
"Age"  : 25
},
{
"name" : "Farooq",
"city" : "Lahore",
"Age"  : 30
}
]
"""

* print jsonObject
* print jsonObject[0]
* print jsonObject[0].name
* print jsonObject[1].name + " " + jsonObject[1].city + " " + jsonObject[1].Age


Scenario: complex json scenario

* def jsonObject = 

"""
{
"menu": {
  "id": "file",
  "value": "File",
  "popup": {
    "menuitem": [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
    ]
  }
}
}

"""

* print jsonObject
* print jsonObject.menu
* print jsonObject.menu.popup
* print jsonObject.menu.popup.menuitem
* print jsonObject.menu.popup.menuitem[0].value
* print jsonObject.menusp.popup.menuitem[0].onclick