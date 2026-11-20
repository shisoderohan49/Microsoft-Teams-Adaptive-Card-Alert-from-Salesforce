# MICROSOFT TEAMS ADAPTIVE CARD WEBHOOK ALERT FROM SALESFORCE

* In the chat, create a workflow from the template - `Send webhook alerts to a chat`
* Copy the webhook URL from the created workflow
* In the Salesforce Org, deploy the webhook URL as Named Credential

API name of the Named Credential is used as parameter in the Controller Class method to send the alert.

```
//Creating Header Text Box Element for the Card 
AdaptiveCardTextBox header = new AdaptiveCardTextBox('Sample Header').setSize('Large').setWeight('Bolder');
AdaptiveCardTextBox footer = new AdaptiveCardTextBox('Sample Footer Text');

//Creating Table for the Card
AdaptiveCardTable table = new AdaptiveCardTable(true, false);
List<AdaptiveCardColumn> columns = new List<AdaptiveCardColumn>{new AdaptiveCardColumn(1), new AdaptiveCardColumn(1)};
table.addColumns(columns);

List<String> firstColumnList = new List<String>{'Name', 'Role', 'Github'};
List<String> secondColumnList = new List<String>{'Rohan Shisode', 'Salesforce Developer', 'shisoderohan49'};

//Adding Row Content to the Table
for(Integer index = 0; index < firstColumnList.size(); index++){
    AdaptiveCardRow row = new AdaptiveCardRow();

    AdaptiveCardCell firstCell = new AdaptiveCardCell();
    AdaptiveCardTextBox cellContent = new AdaptiveCardTextBox(firstColumnList.get(index)).setWeight('Bolder').setWrap(true);
    firstCell.addItem(cellContent);

    AdaptiveCardCell secondCell = new AdaptiveCardCell();
    AdaptiveCardTextBox cellContent2 = new AdaptiveCardTextBox(secondColumnList.get(index)).setWrap(true);
    secondCell.addItem(cellContent2);

    row.addCells(new List<AdaptiveCardCell>{firstCell, secondCell});

    table.addRow(row);
}

//Creating Open Url Action for the Card
AdaptiveCardOpenUrlAction action = new AdaptiveCardOpenUrlAction().setTitle('Open Github Profile').setUrl('https://github.com/shisoderohan49');

//Creating the final Content instance to be used for the Payload
AdaptiveCardContent content = new AdaptiveCardContent('1.5');
content.addBodyElements(new List<AdaptiveCardElement>{header, footer, table});
content.addActions(new List<AdaptiveCardAction>{action});

AdaptiveCardTeamsController.sendAlert('TEAMS_WEBHOOK',content);
```

![Adaptive Card Example](images/adaptive_card_example.png)