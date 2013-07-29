<li>
    <g:each in="${messageInstanceList}" status="i" var="messageInstance">
        <div class="row-fluid">

            %{--<div class="span8 offset3">            --}%
            <div class="span8">
                <blockquote
                        class="twitter-tweet"><p>${messageInstance.text}</p>&mdash; ${messageInstance.name} (&#64;${messageInstance.screenName}) <a
                        href="https://twitter.com/${messageInstance.screenName}/statuses/${messageInstance.tweetId}">${messageInstance.dateTweetCreated}</a>
                </blockquote>
            </div>

            <div class="span1">
                <div class="voteHolder">
                    <button class="vote upvote" id="${messageInstance.tweetId}" name="upvoteSubmit" type="submit"/>

                    <div class="voteCountHolder"><span class="voteCount"
                                                       id="voteCount">${messageInstance.totalVotes}</span></div>
                    <button class="vote downvote" id="${messageInstance.tweetId}" name="downvoteSubmit" type="submit"/>
                </div>
            </div>

        </div>
    </g:each>
</li>
