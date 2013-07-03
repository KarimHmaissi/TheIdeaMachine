package org.hmaissi.theideamachine.downloadTweetsDEPRECATED

import grails.converters.JSON
import groovyx.net.http.ContentType
import groovyx.net.http.HTTPBuilder
import groovyx.net.http.Method
import org.apache.commons.codec.binary.Base64
import org.json.simple.JSONObject

/**
 * Downloads a bearer token from twitter for authorising search api requests with app only oauth
 */
class GetAuthService {

    // twitter consumer key and secret
    static String TWITTER_CONSUMER_KEY = "HTLrlPEfRfVMVN30eoSA";
    static String TWITTER_CONSUMER_SECRET = "ZJZqVYvKJ5qsQO4XHhdg38qhxVRsDMZDHmg5owE";

    static String BEARER_TOKEN = ""



    public static String loadToken() {

        if (BEARER_TOKEN.equals("")) {
            String token = getBearerToken()
            JSONObject json = JSON.parse(token)
            if (json.token_type == "bearer") {
                BEARER_TOKEN = json.access_token
                return BEARER_TOKEN
            }
        } else {
            return BEARER_TOKEN
        }
    }

    //http://www.coderslexicon.com/demo-of-twitter-application-only-oauth-authentication-using-java/
    // Encodes the consumer key and secret to base64 as per twitters oauth requirements
    private static String encodeKeys(String consumerKey, String consumerSecret) {
        try {
            String encodedConsumerKey = URLEncoder.encode(consumerKey, "UTF-8");
            String encodedConsumerSecret = URLEncoder.encode(consumerSecret, "UTF-8");

            String fullKey = encodedConsumerKey + ":" + encodedConsumerSecret;
            byte[] encodedBytes = Base64.encodeBase64(fullKey.getBytes());
            return new String(encodedBytes);
        }
        catch (UnsupportedEncodingException e) {
            return new String();
        }
    }

    private static String getBearerToken() {

        def http = new HTTPBuilder("https://api.twitter.com")

        http.request(Method.POST) {
            send ContentType.URLENC, "grant%5Ftype=client%5Fcredentials"
            uri.path = "/oauth2/token"
            headers.'User-Agent' = "The Idea Machine"
            headers.'Authorization' = "Basic " + encodeKeys(TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET) + "=="

            response.success = { resp, json ->

                println json

                return json

            }

        }


    }


}
