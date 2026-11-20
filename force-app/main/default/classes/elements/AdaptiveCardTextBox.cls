/**
 * This class represents a TextBox element in an Adaptive Card.
 * Link to Adaptive Card documentation: https://adaptivecards.microsoft.com/?topic=TextBlock
 */
public without sharing class AdaptiveCardTextBox implements AdaptiveCardElement {
    private String type;
    private String text;
    private String size;
    private String weight;
    private Boolean wrap;

    public AdaptiveCardTextBox(String text){
        this.text = text;
        this.type = 'TextBlock';
        this.size = 'Default';
        this.weight = 'Default';
        this.wrap = false;
    }

    public AdaptiveCardTextBox setSize(String size){
        this.size = size;
        return this;
    }

    public AdaptiveCardTextBox setWeight(String weight){
        this.weight = weight;
        return this;
    }

    public AdaptiveCardTextBox setWrap(Boolean wrap){
        this.wrap = wrap;
        return this;
    }
}