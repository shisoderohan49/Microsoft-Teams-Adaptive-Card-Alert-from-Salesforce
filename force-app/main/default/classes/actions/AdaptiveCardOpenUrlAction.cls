/**
 * This class represents an OpenUrl action in Adaptive Card.
 * Link to Adaptive Card documentation: https://adaptivecards.microsoft.com/?topic=Action.OpenUrl
 */
public without sharing class AdaptiveCardOpenUrlAction implements AdaptiveCardAction{
    private String type;
    private String url;
    private String title;

    public AdaptiveCardOpenUrlAction(){
        this.type = 'Action.OpenUrl';
    }

    public AdaptiveCardOpenUrlAction setUrl(String url){
        this.url = url;
        return this;
    }

    public AdaptiveCardOpenUrlAction setTitle(String title){
        this.title = title;
        return this;
    }
}