package org.hmaissi.theideamachine.downloadTweets

/**
 * Configuration -
 * User: Karim
 * Date: 28/06/13
 * Time: 10:44

 */
class Config {
    def static String[] SEARCH_QUERIES = [

            "should make an app", "should make a site", "should make a website",
            "should create an app", "should create a site", "should create a website",
            "I wish there was an app", "I wish there was a site", "I wish there was a website",
            "Why isn't there an app", "Why isn't there a site", "Why isn't there a website",
            "Why isnt there an app", "Why isnt there a site", "Why isnt there a website"
    ]

    //Number of tweets to return per request
    def static int COUNT = 100

    //Number of pages of tweets to download per search query
    def static int NUMBER_OF_PAGES = 15

    //Delay between search api requests
    def static int DOWNLOAD_DELAY = 5000

    //Delay between oembed api requests
    def static int MARKUP_DOWNLOAD_DELAY = 10000

}
