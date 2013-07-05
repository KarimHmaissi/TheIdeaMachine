class BootStrap {

    def downloadStreamingTweetsService
    def downloadOldTweetsService
    def saveTweetsService

    def init = { servletContext ->


        saveTweetsService.initSavedTweetIds()

        downloadOldTweetsService.start()

        downloadStreamingTweetsService.connectToStream()
    }

    def destroy = {
    }
}
