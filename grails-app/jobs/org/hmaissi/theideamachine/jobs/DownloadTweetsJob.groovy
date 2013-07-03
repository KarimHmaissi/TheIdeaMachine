package org.hmaissi.theideamachine.jobs



class DownloadTweetsJob {
    def mainDownloadTweetsService

    static triggers = {
        simple repeatInterval: 180000000 // execute job once every hour
    }

    def execute() {
        mainDownloadTweetsService.start()
    }
}
