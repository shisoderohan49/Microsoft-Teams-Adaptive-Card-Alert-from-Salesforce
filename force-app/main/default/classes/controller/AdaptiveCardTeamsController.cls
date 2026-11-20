/**
 * @description: This class is used to send an alert to Microsoft Teams using Adaptive Cards.
 */
public without sharing class AdaptiveCardTeamsController {
    public static HttpResponse sendAlert(String webhookNamedCredential, AdaptiveCardContent content){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('callout:' + webhookNamedCredential);

        String payload = getPayloadString(content);
        request.setBody(payload);
        request.setHeader('Content-Type','application/json');
        request.setHeader('Accept','application/json');

        return http.send(request);
    }

    private static String getPayloadString(AdaptiveCardContent content){
        String result = '{"type": "message","attachments": [{"contentType": "application/vnd.microsoft.card.adaptive", "content": ' + JSON.serialize(content) + '}]}';
        result = result.replace('schema','$schema');
        return result;
    }
}