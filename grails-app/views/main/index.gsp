<%--
  Created by IntelliJ IDEA.
  User: Karim
  Date: 24/06/13
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
    <r:require modules="bootstrap, backstretch, jscroll, jqueryui, sticky, waypoint"/>

    <title>The Idea Machine</title>

    <style>

    .marginTop {
        margin-top: 25px;
    }

    .marginBottom {
        margin-bottom: 30px;
    }

    .smallMarginBottom {
        margin-bottom: 20px;
    }

    .removeMargin {
        margin: 0px;
    }

    ul {
        list-style: none !important;
    }

    .mainTitle {
        font-size: 60px;
        font-weight: 500;
        text-transform: uppercase;
        line-height: 70px;
        letter-spacing: 0.19em;
    }

    .text {
        font-family: 'Lato', sans-serif;
        font-size: 24px !important;
        line-height: 30px !important;
        font-weight: normal !important;

    }

    .highlight {
        color: #ed613d;
        font-size: 150%;
    }

    .hide {
        display: none
    }

    .text-center {
        text-align: center;
    }

    .tweetPromo {
        background-color: white;
        margin-left: 50%;
        position: fixed;
        top: 25%;
        left: 15%;
        margin-top: 141px;
        width: 400px;
    }

    p.tagLine {
        font-size: 26px;
        margin-bottom: 18px;
        line-height: 30px;
    }

        /* Controls
        */

    .controls {
        width: 100% !important;
    }

    .controlsMain {
        padding: 10px;
        text-align: center;
    }

    .share {
        padding: 25px;
        color: white;
        background: rgba(0, 0, 0, 0.5); /* 50% transparent */
    }

        /* Voting css
        */
    .voteHolder {
        padding-left: 75%;
        padding-top: 25%;
    }

    .voteCount {
        font-size: 200%;
    }

    .voteCountHolder {
        /*margin-bottom: 10px;*/
        /*margin-top: 10px;*/
        /*margin-left: 5px;*/
        margin-bottom: 3px;
        margin-top: -18px;
        /*margin-left: 3px;*/
    }

    .vote {
        width: 50px !important;
        height: 50px !important;
        cursor: pointer;
        border: none;
    }

    .upvote {
        background: url('../images/upvote.png') no-repeat;
    }

    .downvote {
        background: url('../images/downvote.png') no-repeat;
    }

    .upvote:hover {
        background: url('../images/upvoteSelected.png') no-repeat;
    }

    .downvote:hover {
        background: url('../images/downvoteSelected.png') no-repeat;
    }

    .upvoteSelected {
        background: url('../images/upvoteSelected.png') no-repeat;
    }

    .downvoteSelected {
        background: url('../images/downvoteSelected.png') no-repeat;
    }

    </style>
</head>

<body>

%{--<div id="navBar" class="navbar navbar-inverse">--}%
%{--<div class="navbar-inner">--}%
%{--<div class="container">--}%
%{--<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">--}%
%{--<span class="icon-bar"></span>--}%
%{--<span class="icon-bar"></span>--}%
%{--<span class="icon-bar"></span>--}%
%{--</button>--}%
%{--<a class="brand" href="#">Project name</a>--}%
%{--<div class="nav-collapse collapse">--}%
%{--<ul class="nav">--}%
%{--<li class="active"><a href="#">Home</a></li>--}%
%{--<li></li>--}%
%{--</ul>--}%
%{--</div><!--/.nav-collapse -->--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="tweetPromo">--}%
%{--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed turpis placerat, posuere magna eget, tempor dui. Vestibulum rhoncus placerat ultrices. Aenean consequat mauris id feugiat facilisis. Quisque sed rhoncus sem. Vivamus lacinia nulla sed felis rutrum aliquam. Etiam at augue eros. Donec sed malesuada metus, ut commodo risus. Vestibulum interdum, leo eget ultricies tincidun</p>--}%
%{--</div>--}%

<a href="https://github.com/you"><img style="position: absolute; top: 0; right: 0; border: 0;"
                                      src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png"
                                      alt="Fork me on GitHub"></a>

<div class="container" id="mainContainer">
    <div class="row marginTop smallMarginBottom text-center">
        <div class="span3"></div>

        <div class="span6">

            <h1 class="mainTitle">The <span class="highlight ">Idea</span> Machine</h1>

            <p class="tagLine bounce">Tapping into the worlds stream of ideas</p>
            <g:img class="" dir="images" file="logo.png" width="200" height="200"/>

        </div>

        <div class="span3"></div>
    </div>

    %{--<div class="marginBottom">--}%
    %{--<g:remoteLink class="btn btn-primary btn-large" id="tweetButton" controller="main" action="list"--}%
    %{--update="tweetsContent" onSuccess="loadScrolling()">New IDea!</g:remoteLink>--}%

    %{--<g:remoteLink action="tempLoadTweetsFromTwitter" class="btn btn-primary btn-large">LOAD TWEETS</g:remoteLink>--}%
    %{--<br />--}%
    %{--</div>--}%

    <div class="row text-center marginBottom">
        <div class="span3"></div>

        <div class="span6">
            <div class="marginBottom">
                <h2>What is this?</h2>

                <p class="text">The idea machine downloads tweets from twitter that contain an idea for a new app or website. Some are insane, some are just awful and some are absolute gold.</p>
            </div>
            %{--<div class="marginBottom " id="showThird">--}%
            %{--<h2>Who made this?</h2>--}%
            %{--<p class="text">This site was built by <a href="http://karimhmaissi.com">Karim Hmaissi</a> </p>--}%
            %{--</div>--}%
            <div id="scrollDown" class="marginBottom">
                <h2 class="bounce"><i class="icon-arrow-down"></i>Scroll Down For Ideas!<i class="icon-arrow-down"></i>
                </h2>
            </div>

        </div>

        <div class="span3"></div>

    </div>

    <div class="row controls" id="controls">

        <div class="span3"></div>

        <div class="span6 hide controlsMain" id="controlsMain">
            <div>
                <button id="viewHot" class="btn btn-large btn-primary" type="button">View Hot Ideas</button>
                <button id="viewNew" class="btn btn-large btn-primary" type="button">View New Ideas</button>
            </div>
        </div>

        %{--<div class="span3 share hide" id="share">--}%
        %{--<h2>Follow--}%
        %{--<br/>--}%
        %{--<span class="highlight">The Idea Machine</span> on twitter</h2>--}%

        %{--<p><a href="https://twitter.com/twitterapi" class="twitter-follow-button" data-show-count="false"--}%
        %{--data-lang="en">Follow @twitterapi</a></p>--}%

        %{--<p>The Highest voted/most re-tweeted ideas are automatically tweeted by the idea machine</p>--}%
        %{--</div>--}%

    </div>

</div><!--/.container-->



<div class="container">
    <div class="row" style="margin-top: 60px;">
        <ul id="tweetsContent">

        </ul>
    </div>
</div>



<g:javascript>

    $(document).ready(function() {

          console.log("document ready called")

        //Slide in elements of page
                %{--$( ".hide" ).each(function( index, element ) {--}%
%{--//            setTimeout(function() {--}%

%{--var element = $(element)--}%

%{--if(element.hasClass('bounce')) {--}%
%{--setTimeout(function() {--}%
%{--element.show("bounce", 1000)--}%
%{--},1800)--}%

%{--} else {--}%
%{--setTimeout(function() {--}%
%{--element.show("bounce", 1000)--}%
%{--}, 600)--}%

%{--}--}%

%{--//            }, 800 + ( index * 800 ))--}%
%{--//            $(this).removeClass('hide')--}%

%{--});--}%


    //Delay loading tweets until animation is complete
    //setTimeout(function() {

    //}, 2400)
    $.backstretch("${resource(dir: 'images', file: 'landscape.jpg')}");

            loadHotIdeas()

            var $controls = $("#controls")

            $controls.sticky({topSpacing:0});

            $controls.waypoint(function() {

                 $('#share').show("bounce", 1000)
                 $('#controlsMain').show("bounce", 1000)
            });

            $('#viewHot').attr("disabled", "disabled")

            loadViewTypeHandlers()
            renderTwitterElements()

%{--$('.bounce').each(function() {--}%
%{--var $this = $(this)--}%
%{--setTimeout(function() {--}%
%{--$this.show('bounce', 1000)--}%
%{--},1000)--}%
%{--})--}%

    });

    function loadNewIdeas() {
        console.log("loading new ideas")
        $('#tweetsContent').load('getNewTweets', function (responseTxt,statusTxt,xhr) {
           if(statusTxt == "success") {
                console.log("recieved tweets from server")
                loadHandlers()
                loadScrolling()
            } else if(statusTxt == 'error') {
                //Error
            }
        })
    }

    function loadHotIdeas() {
        console.log("loading hot ideas")
        $('#tweetsContent').load('getHotTweets', function (responseTxt,statusTxt,xhr) {
           if(statusTxt == "success") {
                console.log("recieved tweets from server")
                loadHandlers()
                loadScrolling()
            } else if(statusTxt == 'error') {
                //Error
            }
        })
    }

    function loadHandlers() {

        loadVoteHandlers()
        renderTwitterElements()
    }

    function loadViewTypeHandlers() {
        $('#viewHot').click(function() {
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

        $('#viewNew').click(function() {
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

        $('.upvote').each(function(index) {
            console.log("found upvote button adding listerner")

            var $this = $(this)

            $this.click(function() {
               console.log("upvote clicked")
               var $this  = $(this)
               $this.removeClass('upvote')
               $this.addClass('upvoteSelected')
               $this.attr("disabled", "disabled");

               $.get("upvote", { tweetId: $this.attr('id') } );
            })
        })

        $('.downvote').each(function(index) {
            console.log("found downvote button adding listerner")
            var $this = $(this)

            $this.click(function() {
               console.log("downvote clicked")
               var $this  = $(this)
               $this.removeClass('downvote')
               $this.addClass('downvoteSelected')
               $this.attr("disabled", "disabled");

               $.get("downvote", { tweetId: $this.attr('id') } );
            })
        })
    }

    function renderTwitterElements() {
         $.getScript('//platform.twitter.com/widgets.js', function(){
             //calling method load
             console.log("rendering tweets")
             twttr.widgets.load();
        })
    }

</g:javascript>
</body>
</html>