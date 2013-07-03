package org.hmaissi.theideamachine.downloadTweets

import org.codehaus.groovy.grails.commons.ApplicationHolder as AH
import twitter4j.*

/**
 * Connects to the twitter streaming api
 * Filters tweets based on search queries in config
 * User: Karim
 * Date: 27/06/13
 * Time: 15:54
 */
class DownloadStreamingTweetsService {
    def twitter4jService
    def saveTweetsService

    def connectToStream() {
        println "Connecting to stream"

        TwitterStream twitterStream =
            new TwitterStreamFactory(twitter4jService.getConfiguration()).getInstance();

        SimpleStatusListener listener = new SimpleStatusListener()

        twitterStream.addListener(listener);

        twitterStream.filter(initQuery())

    }

    def FilterQuery initQuery() {

        FilterQuery query = new FilterQuery()
        query.track(Config.SEARCH_QUERIES)

        return query
    }

}
/**
 * http://grails.org/FAQ#Q: How do I get access to the application context from sources in src/groovy?
 * May be out of date code snippet to get access to grails service in StatusListener
 */
class SimpleStatusListener implements StatusListener {


    @Override
    void onStatus(Status status) {

        def ctx = AH.application.mainContext
        def saveTweetsService = ctx.saveTweetsService

        println "New tweet came in through stream ++++++"
        println status.text

        saveTweetsService.saveTweet(status)
    }

    @Override
    void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    void onTrackLimitationNotice(int i) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    void onScrubGeo(long l, long l1) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    void onException(Exception e) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

}


