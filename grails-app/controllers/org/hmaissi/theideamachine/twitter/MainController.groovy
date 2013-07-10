package org.hmaissi.theideamachine.twitter

/**
 * Main controller
 * Due to the simplicity of this app this controller handles all requests coming in
 */
class MainController {

    static List<Long> idsReturned = new ArrayList<Long>()

    def index() {

        render(view: "index")
    }

    def getNewTweets(Integer max) {
        println("list getNewTweets called ----------")

        params.max = 10

        def criteria = Message.createCriteria()
        List<Message> messages = criteria.list(params) {
            resultTransformer org.hibernate.Criteria.DISTINCT_ROOT_ENTITY
            order("dateTweetCreated", "desc")
        }

        println "Messages size: " + messages.size()

        render(template: "newTweets",
                //Shuffles list of messages randomly
                model: [messageInstanceList: messages, messageInstanceTotal: Message.count()])
    }

    def getHotTweets(Integer max) {
        println("list getHotTweets called ----------")

        params.max = 10

        if (params.offset == null) {
            params.offset = 0
        }

        def queryParams = [
                max: params.max,
                offset: params.offset
        ]

        //Query changed to HQL to ensure no duplicate entries are returned
        List<Message> messages = Message.executeQuery(
                " SELECT DISTINCT a FROM Message a ORDER BY a.totalVotes desc",
                queryParams)

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

    /**
     * Debug method used to check for duplicate tweets returned by getHotTweets query
     */
    private void checkForDups() {

        Set<Long> set = new HashSet<>(idsReturned.size(), 1);
        List<Long> dupIds = new ArrayList<>()

        for (Long id : idsReturned) {
            boolean unique = set.add(id);

            if (!unique) {
                dupIds.add(id)
            }
        }
        if (set.size() != idsReturned.size()) {
            println "++++++++++ERROR!!!!!!+++++++++"
            println "++++++++++Duplicate tweets detected!!!!!!+++++++++"
            println "++++++++++ERROR!!!!!!+++++++++"
            println "Size of idsReturned: " + idsReturned.size()
            println "Size of set: " + set.size()

            println "dupIds size: " + dupIds.size()
            for (Long id : dupIds) {
                Message message = Message.findByTweetId(id)
                println " "
                println "Message Details:"
                println message.tweetId
                println message.id
                println message.upvotes
                println message.downvotes
                println message.totalVotes
                println message.text
                println "End Message Details:"
                println " "

            }
        }
    }

}
