<li>
    <g:each in="${messageInstanceList}" status="i" var="messageInstance">
        <div class="row">
            <div class="span3">
                <div class="voteHolder">

                    <g:formRemote class="removeMargin" name="upvote" url="[controller: 'main', action: 'upvote']">
                        <button class="vote upvote" name="upvoteSubmit" type="submit"/>
                        <input class="tweetId" type="hidden" name="tweetId" value="${messageInstance.tweetId}">
                    </g:formRemote>

                    <div class="voteCountHolder"><span class="voteCount"
                                                       id="voteCount">${messageInstance.totalVotes}</span></div>

                    <g:formRemote class="removeMargin" name="downvote" url="[controller: 'main', action: 'downvote']">
                        <button class="vote downvote" name="downvoteSubmit" type="submit"/>
                        <input class="tweetId" type="hidden" name="tweetId" value="${messageInstance.tweetId}">
                    </g:formRemote>

                </div>
            </div>

            <div class="span6">
                <blockquote
                        class="twitter-tweet"><p>${messageInstance.text}</p>&mdash; ${messageInstance.name} (&#64;${messageInstance.screenName}) <a
                        href="https://twitter.com/${messageInstance.screenName}/statuses/${messageInstance.tweetId}">${messageInstance.dateTweetCreated}</a>
                </blockquote>
                %{--<script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>--}%
            </div>

            <div class="span3">

            </div>
        </div>
    </g:each>
</li>
