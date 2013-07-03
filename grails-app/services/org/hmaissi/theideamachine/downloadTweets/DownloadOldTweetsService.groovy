package org.hmaissi.theideamachine.downloadTweets

import grails.converters.JSON
import groovyx.net.http.ContentType
import groovyx.net.http.HTTPBuilder
import org.json.simple.JSONObject

import static groovyx.net.http.Method.GET

class DownloadOldTweetsService {

    def appOnlyAuthService
    def saveTweetsService

    def start() {
        Config.SEARCH_QUERIES
        for (int x = 0; x < Config.SEARCH_QUERIES.length; x++) {
            String searchQuery = Config.SEARCH_QUERIES[x]

            println "New search query: " + searchQuery

            downloadPages(searchQuery)

        }
    }

    private void downloadPages(String searchQuery) {
        String authToken = appOnlyAuthService.loadToken()

        String jsonResponse = ""
        long maxId = 0

        for (int x = 0; x < Config.NUMBER_OF_PAGES; x++) {

            jsonResponse = throttleDownloads(authToken, searchQuery, false, maxId, Config.COUNT)

            if (jsonResponse != "" && jsonResponse != "error") {

                maxId = getLastId(jsonResponse)

                JSONObject jsonObject = JSON.parse(jsonResponse)

                //if response returns less tweets than Config.count then subsequent page requests will not return more tweets
                //break from loop
                if (jsonObject.statuses.size() < (Config.COUNT - 1)) {
                    println "No more pages to download"
                    println "Number of statuses returned: " + jsonObject.statuses.size()
                    break
                }

                for (JSONObject status : jsonObject.statuses) {
                    saveTweetsService.saveTweet(status)
                }

            }
        }
    }

    /**
     * Method placed between download and request to throttle downloads
     * @param authToken
     * @param searchQuery
     * @param initalLoad
     * @param maxId
     * @param count
     * @return
     */
    private String throttleDownloads(String authToken, String searchQuery, boolean initalLoad, long maxId, int count) {
        Thread.sleep(Config.DOWNLOAD_DELAY)
        println("waiting to download more pages....")
        return downloadTweets(authToken, searchQuery, initalLoad, maxId, count)
    }

    /**
     * Returns the id of the last tweet in a list
     * Last id used as max_id for subsequent calls to the twitter api
     * @param json
     * @return
     */
    private long getLastId(String json) {
        long id = 0
        JSONObject jsonObject = JSON.parse(json)

        if (jsonObject.statuses.size() == 0) {
            return id
        } else {
            id = jsonObject.statuses.get(jsonObject.statuses.size() - 1).id
            return id
        }


    }

    //Initial load = flag for requesting page 1 off twitter feed
    private String downloadTweets(String authToken, String searchQuery, boolean initalLoad, long maxId, int count) {

        try {
            def http = new HTTPBuilder()

            http.request('https://api.twitter.com/1.1/search/tweets.json', GET, ContentType.JSON) { req ->

                if (initalLoad) {
                    uri.query = [q: searchQuery, count: count]
                } else {
                    println("Downloading Tweets from search api")
                    println("request with max id: " + maxId)
                    uri.query = [q: searchQuery, count: count, max_id: maxId]

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
}
