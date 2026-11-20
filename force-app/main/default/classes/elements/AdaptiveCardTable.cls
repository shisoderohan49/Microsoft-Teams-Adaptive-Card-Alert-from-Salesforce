/**
 * This class represents a table element in Adaptive Card.
 * Link to Adaptive Card documentation: https://adaptivecards.microsoft.com/?topic=Table
 */
public without sharing class AdaptiveCardTable implements AdaptiveCardElement {
    private String type;
    private Boolean roundedCorners;
    private Boolean firstRowAsHeaders;
    private List<AdaptiveCardColumn> columns;
    private List<AdaptiveCardRow> rows;

    public AdaptiveCardTable(Boolean roundedCorners, Boolean firstRowAsHeaders){
        this.type = 'Table';
        this.roundedCorners = roundedCorners;
        this.firstRowAsHeaders = firstRowAsHeaders;
        this.columns = new List<AdaptiveCardColumn>();
        this.rows = new List<AdaptiveCardRow>();
    }

    public void addRow(AdaptiveCardRow newRow){
        this.rows.add(newRow);
    }

    public void addColumn(AdaptiveCardColumn newColumn){
        this.columns.add(newColumn);
    }

    public void addColumns(List<AdaptiveCardColumn> newColumns){
        this.columns.addAll(newColumns);
    }
}