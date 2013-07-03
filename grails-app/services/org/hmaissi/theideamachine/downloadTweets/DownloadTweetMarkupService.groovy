package org.hmaissi.theideamachine.downloadTweets

import groovyx.net.http.ContentType
import groovyx.net.http.HTTPBuilder

import static groovyx.net.http.Method.GET

/**
 * Download the markup for each tweet from twitter api
 * https://api.twitter.com/1.1/statuses/oembed.json
 * Save markup to database
 */
class DownloadTweetMarkupService {

    def appOnlyAuthService

    /**
     * Returns the markup from a tweet from the oembed twitter api
     * Adds a throttle delay to ensure api request are not too frequent
     * @param id
     * @return
     */
    public String getTweetHtml(long id) {
        Thread.sleep(Config.MARKUP_DOWNLOAD_DELAY)
        println("waiting to download markup....")
        return downloadTweetHtml(id)
    }

    private String downloadTweetHtml(long id) {

        String authToken = appOnlyAuthService.loadToken()

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

                response.failure = {
                    return "error"
                }

            }
        } catch (Exception e) {
            return "error"
        }
    }
}
