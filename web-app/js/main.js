function loadNewIdeas() {
    console.log("loading new ideas")
    $('#tweetsContent').load('main/getNewTweets', function (responseTxt, statusTxt, xhr) {
        if (statusTxt == "success") {
            console.log("recieved tweets from server")
            loadHandlers()
            loadScrolling()
        } else if (statusTxt == 'error') {
            //Error
        }
    })
}

function loadHotIdeas() {
    console.log("loading hot ideas")
    $('#tweetsContent').load('main/getHotTweets', function (responseTxt, statusTxt, xhr) {
        if (statusTxt == "success") {
            console.log("recieved tweets from server")
            loadHandlers()
            loadScrolling()
        } else if (statusTxt == 'error') {
            //Error
        }
    })
}

function loadHandlers() {

    loadVoteHandlers()
    renderTwitterElements()
}

function loadViewTypeHandlers() {
    $('#viewHot').click(function () {
        console.log("new button clicked")
        var tweetContent = $('#tweetsContent')

        //remove jscroll from tweetContent
        tweetContent.removeData('jscroll')

        $('html, body').animate({
            scrollTop: $("#tweetsContent").offset().top - 60
        }, 500);

        loadHotIdeas()

        //switch buttons
        $('#viewHot').attr("disabled", "disabled")
        $('#viewNew').removeAttr("disabled")
    })

    $('#viewNew').click(function () {
        console.log("new button clicked")
        var tweetContent = $('#tweetsContent')

        //remove jscroll from tweetContent
        tweetContent.removeData('jscroll')

        $('html, body').animate({
            scrollTop: $("#tweetsContent").offset().top - 60
        }, 500);

        loadNewIdeas()

        $('#viewNew').attr("disabled", "disabled")
        $('#viewHot').removeAttr("disabled")
    })
}

function loadScrolling() {
    $('#tweetsContent').jscroll({
        loadingHtml: '<img src="../images/loading.gif" alt="Loading"/> Loading...',
        padding: 10,
        nextSelector: '.nextLink',
        callback: renderTwitterElements
    });
}

function loadVoteHandlers() {
    console.log("adding vote handlers++")

    $('.upvote').each(function (index) {
        console.log("found upvote button adding listerner")

        var $this = $(this)

        $this.click(function () {
            console.log("upvote clicked")
            var $this = $(this)
            $this.removeClass('upvote')
            $this.addClass('upvoteSelected')
            $this.attr("disabled", "disabled");

            $.get("main/upvote", { tweetId: $this.attr('id') });
        })
    })

    $('.downvote').each(function (index) {
        console.log("found downvote button adding listerner")
        var $this = $(this)

        $this.click(function () {
            console.log("downvote clicked")
            var $this = $(this)
            $this.removeClass('downvote')
            $this.addClass('downvoteSelected')
            $this.attr("disabled", "disabled");

            $.get("main/downvote", { tweetId: $this.attr('id') });
        })
    })
}

function renderTwitterElements() {
    $.getScript('//platform.twitter.com/widgets.js', function () {
        //calling method load
        console.log("rendering tweets")
        twttr.widgets.load();
    })
}