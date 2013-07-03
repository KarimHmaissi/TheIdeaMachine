package org.hmaissi.theideamachine.downloadTweetsDEPRECATED

import groovyx.net.http.ContentType
import groovyx.net.http.HTTPBuilder

import static groovyx.net.http.Method.GET


class GetTweetsService {

    //Initial load = flag for requesting page 1 off twitter feed
    public static String downloadTweets(String authToken, String searchQuery, boolean initalLoad, long maxId, int count) {

        try {
            def http = new HTTPBuilder()

            http.request('https://api.twitter.com/1.1/search/tweets.json', GET, ContentType.JSON) { req ->

                if (initalLoad) {
                    uri.query = [q: searchQuery, count: 10]
                } else {
                    println("request with max id: " + maxId)
                    uri.query = [q: searchQuery, count: 10, max_id: maxId]

                }

                headers.'User-Agent' = "The Idea Machine"
                headers.Accept = 'application/json'
                headers.'Authorization' = "Bearer " + authToken

                response.success = { resp, json ->
                    assert resp.statusLine.statusCode == 200
                    println "Got response: ${resp.statusLine}"
                    println "Content-Type: ${resp.headers.'Content-Type'}"
                    //println json
                    return json
                }

                response.failure = {
                    return 'error'
                }
            }
        } catch (Exception e) {
            return "error"
        }
    }

    //ToDO ensure widget.js script is not redundantly included
    public static String getTweetHtml(String authToken, long id) {

        try {
            println("attempting to download html-----")
            def http = new HTTPBuilder()
            http.request('https://api.twitter.com/1.1/statuses/oembed.json', GET, ContentType.JSON) { req ->

//                //Omits the widget.js script if already loaded
//                if (initialLoad) {
//                    uri.query = [id:id]
//                } else {
//                    uri.query = [id:id, omit_script:false]
//                }

                uri.query = [id: id]

                headers.'User-Agent' = "The Idea Machine"
                headers.Accept = 'application/json'
                headers.'Authorization' = "Bearer " + authToken

                response.success = { resp, json ->
                    assert resp.statusLine.statusCode == 200
                    println "Got response: ${resp.statusLine}"
                    println "Content-Type: ${resp.headers.'Content-Type'}"
                    //println json
                    return json.html
                }

            }
        } catch (Exception e) {

        }
    }


}