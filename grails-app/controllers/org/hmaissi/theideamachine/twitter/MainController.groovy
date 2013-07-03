package org.hmaissi.theideamachine.twitter

class MainController {

    def mainDownloadTweetsService

    def index() {

        render(view: "index")
    }

//    def list(Integer max) {
//        //TODO edit query to ensure html != empty and order by dataCreated
//        println("list mainController called ----------")
//        params.max = Math.min(max ?: 10, 100)
//
//        List<Message> messages = Message.list(params)
//
//        println "Messages size: " + messages.size()
//
//        render(template: "tweetContent",
//                //Shuffles list of messages randomly
//                model:[messageInstanceList: messages, messageInstanceTotal: Message.count()])
//    }

//    def list(Integer max) {
//        println("list mainController called ----------")
//
//        params.max = Math.min(max ?: 10, 100)
//
//        def criteria = Message.createCriteria()
//        List<Message> messages = criteria.list(params) {
//            order("dateTweetCreated", "desc")
//        }
//
//        println "Messages size: " + messages.size()
//
//        render(template: "tweetContent",
//                //Shuffles list of messages randomly
//                model:[messageInstanceList: messages, messageInstanceTotal: Message.count()])
//    }

    def getNewTweets(Integer max) {
        println("list getNewTweets called ----------")

        params.max = Math.min(max ?: 10, 100)

        def criteria = Message.createCriteria()
        List<Message> messages = criteria.list(params) {
            order("dateTweetCreated", "desc")
        }

        println "Messages size: " + messages.size()

        render(template: "newTweets",
                //Shuffles list of messages randomly
                model: [messageInstanceList: messages, messageInstanceTotal: Message.count()])
    }

    def getHotTweets(Integer max) {
        println("list getHotTweets called ----------")

        params.max = Math.min(max ?: 10, 100)

        def criteria = Message.createCriteria()
        List<Message> messages = criteria.list(params) {
            order("totalVotes", "desc")
        }

        println "Messages size: " + messages.size()

        render(template: "hotTweets",
                //Shuffles list of messages randomly
                model: [messageInstanceList: messages, messageInstanceTotal: Message.count()])
    }

    def upvote() {

        println "upvote"
        def tweetId = params.tweetId
        Message message = getMessageByTweetId(tweetId)

        if (message != null) {
            message.upvotes += 1
            message.save(flush: true)
            render message.totalVotes
        }

        render "error"
    }

    def downvote() {

        println "downvote"
        def tweetId = params.tweetId
        Message message = getMessageByTweetId(tweetId)

        if (message != null) {
            message.downvotes += 1
            message.save(flush: true)
            render message.totalVotes
        }

        render "error"

    }

    private Message getMessageByTweetId(String tweetId) {

        if (tweetId != null) {
            try {
                Long tweetIdParsed = Long.parseLong(tweetId)
                Message message = Message.findByTweetId(tweetId)
            } catch (NumberFormatException e) {
                println("Error upvote")
                return null
            } catch (Exception e) {
                println("Error upvote")
                return null
            }

        }
    }

//    def tempLoadTweetsFromTwitter() {
//        mainDownloadTweetsService.start()
//        redirect(action: "index")
//    }
}
