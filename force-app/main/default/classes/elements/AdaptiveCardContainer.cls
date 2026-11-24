/*
* @description: This class is used to create an Adaptive Card Container for Teams Notification
*/
public without sharing class AdaptiveCardContainer implements AdaptiveCardElement {
    private String type;
    private Boolean showBorder;
    private Boolean roundedCorners;
    private String style;
    private List<AdaptiveCardElement> items;

    public AdaptiveCardContainer(Boolean showBorder, Boolean roundedCorners){
        this.type = 'Container';
        this.showBorder = showBorder;
        this.roundedCorners = roundedCorners;
        this.style = 'default';
        this.items = new List<AdaptiveCardElement>();
    }

    public AdaptiveCardContainer setStyle(String style){
        this.style = style;
        return this;
    }

    public void addItem(AdaptiveCardElement item){
        this.items.add(item);
    }

    public void addItems(List<AdaptiveCardElement> items){
        this.items.addAll(items);
    }
}