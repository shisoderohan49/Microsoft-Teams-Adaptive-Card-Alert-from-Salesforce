/**
 * This class represents a Cell in an Table element in an Adaptive Card.
 * Link to Adaptive Card documentation: https://adaptivecards.microsoft.com/?topic=TableCell
 */
public without sharing class AdaptiveCardCell {
    private String type;
    private List<AdaptiveCardTextBox> items;

    public AdaptiveCardCell(){
        this.type = 'TableCell';
        this.items = new List<AdaptiveCardTextBox>();
    }

    public void addItem(AdaptiveCardTextBox item){
        this.items.add(item);
    }
}