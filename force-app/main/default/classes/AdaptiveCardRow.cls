/**
 * This class represents a row in an table in Adaptive Card.
 * Link to Adaptive Card documentation: https://adaptivecards.microsoft.com/?topic=TableRow
 */
public without sharing class AdaptiveCardRow {
    private String type;
    private List<AdaptiveCardCell> cells;

    public AdaptiveCardRow(){
        this.type = 'TableRow';
        this.cells = new List<AdaptiveCardCell>();
    }

    public void addCell(AdaptiveCardCell cell){
        this.cells.add(cell);
    }

    public void addCells(List<AdaptiveCardCell> cells){
        this.cells.addAll(cells);
    }
}