/**
 * Karim Hmaissi
 *
 */


function init(bgImageUrl) {

    //init background image plugin
    $.backstretch(bgImageUrl);

    //cache elements
    var $controls = $("#controls"),
        $share = $('#share'),
        $controlsMain = $('#controlsMain'),
        $navbar = $('#navbar'),
        $heading = $('#heading'),
        $tweetContainer = $('.tweetContainer');

    skrollr.init();

    $controlsMain.sticky({topSpacing: 50});

    //load in tweets by ajax
    loadNewIdeas();

    //when $controls reach the top of the viewport run
    $controls.waypoint(function () {

        $share.show("slide", 1000);
        $controlsMain.show("bounce", 1000);
        $navbar.show("bounce", 1000);

        //close share add
        $('#closeShare').click(function () {
            $share.hide("slide", 1000);
            setTimeout(function () {
                $share.remove()
            }, 1000);

        });

    });

    $tweetContainer.waypoint(function () {
        $('.bubbleNav').css("display", "none");
    });

    $heading.waypoint(function () {
        $heading.show("bounce", 1000);
    });


    $('#viewNew').attr("disabled", "disabled");

    loadVoteHandlers();
    loadViewTypeHandlers();
    renderTwitterElements();
}

function loadNewIdeas() {
    console.log("loading new ideas");
    $('#tweetsContent').load('main/getNewTweets', function (responseTxt, statusTxt, xhr) {
        if (statusTxt == "success") {
            console.log("recieved tweets from server");
            loadHandlers();
            loadScrolling();
        } else if (statusTxt == 'error') {
            //Error
        }
    })
}

function loadHotIdeas() {
    console.log("loading hot ideas");
    $('#tweetsContent').load('main/getHotTweets', function (responseTxt, statusTxt, xhr) {
        if (statusTxt == "success") {
            console.log("recieved tweets from server");
            loadHandlers();
            loadScrolling();
        } else if (statusTxt == 'error') {
            //Error
        }
    })
}

function loadHandlers() {

    renderTwitterElements();
}

function loadViewTypeHandlers() {
    $('#viewHot').click(function () {
        console.log("new button clicked");
        var tweetContent = $('#tweetsContent');

        //remove jscroll from tweetContent
        tweetContent.removeData('jscroll');

        $('html, body').animate({
            scrollTop: $("#tweetsContent").offset().top - 60
        }, 500);

        loadHotIdeas();

        //switch buttons
        $('#viewHot').attr("disabled", "disabled");
        $('#viewNew').removeAttr("disabled");
    });

    $('#viewNew').click(function () {
        console.log("new button clicked");
        var tweetContent = $('#tweetsContent');

        //remove jscroll from tweetContent
        tweetContent.removeData('jscroll');

        $('html, body').animate({
            scrollTop: $("#tweetsContent").offset().top - 60
        }, 500);

        loadNewIdeas();

        $('#viewNew').attr("disabled", "disabled");
        $('#viewHot').removeAttr("disabled");
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
    console.log("adding vote handlers++");

    $('#tweetsContent').on('click', 'button.vote', function () {
        var $this = $(this);

        if ($this.hasClass('upvote')) {
            $this.removeClass('upvote');
            $this.addClass('upvoteSelected');
            $this.attr("disabled", "disabled");

            $.get("main/upvote", { tweetId: $this.attr('id') });

        } else {
            $this.removeClass('downvote');
            $this.addClass('downvoteSelected');
            $this.attr("disabled", "disabled");

            $.get("main/downvote", { tweetId: $this.attr('id') });
        }

    })
}

function renderTwitterElements() {
    $.getScript('//platform.twitter.com/widgets.js', function () {
        //calling method load
        console.log("rendering tweets");
        twttr.widgets.load();
    })
}