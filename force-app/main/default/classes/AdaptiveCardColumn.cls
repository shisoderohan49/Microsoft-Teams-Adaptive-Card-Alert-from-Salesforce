/**
 * This class represents a column definition in Table in Adaptive Card.
 * Link to Adaptive Card documentation: https://adaptivecards.microsoft.com/?topic=ColumnDefinition
 */
public without sharing class AdaptiveCardColumn {
    private Integer width;

    public AdaptiveCardColumn(Integer width){
        this.width = width;
    }
}