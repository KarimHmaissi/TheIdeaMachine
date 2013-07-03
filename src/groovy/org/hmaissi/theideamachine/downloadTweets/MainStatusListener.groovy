package org.hmaissi.theideamachine.downloadTweets

import twitter4j.Status
import twitter4j.StatusDeletionNotice
import twitter4j.StatusListener

/**
 * User: Karim Hmaissi
 * Date: 27/06/13
 * Time: 16:19
 */
class MainStatusListener implements StatusListener {

    def saveTweetsService

    @Override
    void onStatus(Status status) {
        println "New tweet came in through stream"
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
