/**
 * @description: This class is used to create the Adaptive Card content in the Payload Schema
 */
public without sharing class AdaptiveCardContent {
    private String schema;
    private String type;
    private String version;
    private CardWidth msteams;
    public List<AdaptiveCardElement> body;
    public List<AdaptiveCardAction> actions;

    public AdaptiveCardContent(String version){
        this.schema = 'http://adaptivecards.io/schemas/adaptive-card.json';
        this.type = 'AdaptiveCard';
        this.version = version;
        this.msteams = new CardWidth('full');
        this.body = new List<AdaptiveCardElement>();
        this.actions = new List<AdaptiveCardAction>();
    }

    public void addBodyElement(AdaptiveCardElement element){
        this.body.add(element);
    }

    public void addBodyElements(List<AdaptiveCardElement> elements){
        this.body.addAll(elements);
    }

    public void addAction(AdaptiveCardAction action){
        this.actions.add(action);
    }

    public void addActions(List<AdaptiveCardAction> actions){
        this.actions.addAll(actions);
    }

    public void addTemplate(AdaptiveCardTemplate template){
        this.body.addAll(template.getElements());
    }

    public void addTemplates(List<AdaptiveCardTemplate> templateList){
        for(AdaptiveCardTemplate template: templateList){
            this.body.addAll(template.getElements());
        }
    }

    private class CardWidth {
        private String width;

        public CardWidth(String width){
            this.width = width;
        }
    }
}