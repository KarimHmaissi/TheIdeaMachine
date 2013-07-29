<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="main">
    %{--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>--}%
    <r:require modules="jquery, application,bootstrap, backstretch, jscroll, jqueryui, sticky, waypoint, skrollr"/>

    <title>The Idea Machine</title>

</head>

<body>

<a href="https://github.com/KarimHmaissi"><img style="position: absolute; top: 0; right: 0; border: 0;"
                                               src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png"
                                               alt="Fork me on GitHub"></a>

<div class="container-fluid mainContainer" id="mainContainer">
    %{--<div class="row-fluid marginTop smallMarginBottom text-center"  data-stellar-background-ratio="0.1" data-slide="1">--}%

    %{--<div class="span12">--}%

    %{--<h1 class="mainTitle">The <span class="highlight ">Idea</span> Machine</h1>--}%

    %{--<p class="tagLine bounce">Tapping into the worlds stream of ideas</p>--}%
    %{--<g:img class="" dir="images" file="logo.png" width="200" height="200"/>--}%

    %{--</div>--}%
    %{--</div>--}%

    %{--<div class="row-fluid">--}%
    %{--<div id="bubble" class="span5 offset6 bubble">--}%
    %{--<div class="bubbleText">--}%
    %{--<div class="marginBottom">--}%
    %{--<h1 class="tline"><span class="highlight">What</span> is this?</h1>--}%

    %{--<p class="text tline">The idea machine downloads tweets from twitter that contain an idea for a new app or website. Some are insane, some are just awful and some are absolute gold.</p>--}%
    %{--</div>--}%

    %{--<div class="marginBottom " id="showThird">--}%
    %{--<h2 class="tline"><span class="highlight">Who</span> made this?</h2>--}%
    %{--<p class="text tline">This site was built by <a href="http://karimhmaissi.com">Karim Hmaissi</a> </p>--}%
    %{--</div>--}%
    %{--<div id="scrollDown" class="marginBottom">--}%
    %{--<h2 class="bounce"><i class="icon-arrow-down"></i>Scroll Down For Ideas!<i class="icon-arrow-down"></i>--}%
    %{--</h2>--}%
    %{--</div>--}%

    %{--</div>--}%
    %{--</div>--}%
    %{--</div>--}%

    %{--<div class="row text-right marginBottom" style="">--}%
    %{--<div class="span3"></div>--}%
    %{--<div class="span3"></div>--}%

    %{--<div class="span5 whiteBG">--}%
    %{--<div class="marginBottom">--}%
    %{--<h1><span class="highlight">What</span> is this?</h1>--}%

    %{--<p class="text">The idea machine downloads tweets from twitter that contain an idea for a new app or website. Some are insane, some are just awful and some are absolute gold.</p>--}%
    %{--</div>--}%
    %{--<div class="marginBottom " id="showThird">--}%
    %{--<h2>Who made this?</h2>--}%
    %{--<p class="text">This site was built by <a href="http://karimhmaissi.com">Karim Hmaissi</a> </p>--}%
    %{--</div>--}%
    %{--<div id="scrollDown" class="marginBottom">--}%
    %{--<h2 class="bounce"><i class="icon-arrow-down"></i>Scroll Down For Ideas!<i class="icon-arrow-down"></i>--}%
    %{--</h2>--}%
    %{--</div>--}%

    %{--</div>--}%

    %{--</div>--}%

    %{--<div class="row text-right marginBottom" style="margin-bottom: 150px">--}%
    %{--<div class="span3"></div>--}%
    %{--<div class="span3"></div>--}%

    %{--<div class="span5 whiteBG">--}%
    %{--<div class="marginBottom">--}%
    %{--<h1><span class="highlight">Who</span> made this?</h1>--}%

    %{--<p class="text">This site was built by <a href="http://karimhmaissi.com">Karim Hmaissi</a> </p>--}%
    %{--</div>--}%


    %{--</div>--}%

    %{--</div>--}%

    <div class="bubbleNav row-fluid">
        <a id="bubble1" href="#" class="span4 bubble" data-0="opacity: 1" data-800="opacity: 0"></a>
        <a id="bubble2" href="#" class="span4 bubble" data-0="opacity: 1" data-800="opacity: 0"></a>
        <a id="bubble3" href="#" class="span4 bubble" data-0="opacity: 1" data-800="opacity: 0"></a>
    </div>

    <div class="row-fluid" id="heading">
        <div class="span6 offset6 heading" data-0="opacity: 1" data-450="opacity: 0">

        </div>
    </div>

</div><!--/.container-->


<div class="tweetContainer container">

    <a href="#" id="scrollDown" class="scrollDown" data-0="opacity: 1" data-800="opacity: 0"></a>

    %{--<div id="navbar" class="navbar navbar-inverse navbar-fixed-top" style="display: none">--}%
    %{--<div class="navbar-inner">--}%
    %{--<div class="container-fluid">--}%
    %{--<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">--}%
    %{--<span class="icon-bar"></span>--}%
    %{--<span class="icon-bar"></span>--}%
    %{--<span class="icon-bar"></span>--}%
    %{--</button>--}%
    %{--<a class="brand" href="#">Project name</a>--}%
    %{--<div class="nav-collapse collapse">--}%
    %{--<p class="navbar-text pull-right">--}%
    %{--Logged in as <a href="#" class="navbar-link">Username</a>--}%
    %{--</p>--}%
    %{--<ul class="nav">--}%
    %{--<li class="active"><a href="#">Home</a></li>--}%
    %{--<li><a href="#about">About</a></li>--}%
    %{--<li><a href="#contact">Contact</a></li>--}%
    %{--</ul>--}%
    %{--</div><!--/.nav-collapse -->--}%
    %{--</div>--}%
    %{--</div>--}%
    %{--</div>--}%

    <div id="controls">

        %{--<div id="logo" class="logo">--}%
        %{--<g:img class="" dir="images" file="logo.png" width="200" height="200"/>--}%
        %{--</div>--}%

        %{--<div class="span12 hide controlsMain" id="controlsMain">--}%
        %{--<div>--}%
        %{--<button id="viewHot" class="btn btn-large btn-primary" type="button">View Hot Ideas</button>--}%
        %{--<button id="viewNew" class="btn btn-large btn-primary" type="button">View New Ideas</button>--}%
        %{--</div>--}%
        %{--</div>--}%

        %{--<div class="span3 share hide" id="share">--}%
        %{--<h2>Follow--}%
        %{--<br/>--}%
        %{--<span class="highlight">The Idea Machine</span> on twitter</h2>--}%
        %{----}%
        %{--<p><a href="https://twitter.com/twitterapi" class="twitter-follow-button" data-show-count="false"--}%
        %{--data-lang="en">Follow @twitterapi</a></p>--}%
        %{----}%
        %{--<p>The Highest voted/most re-tweeted ideas are automatically tweeted by the idea machine</p>--}%
        %{--</div>--}%

        %{--<div class="navbar navbar-inverse navbar-fixed-top hide" id="navbar">--}%
        %{--<div class="navbar-inner">--}%
        %{--<div class="container">--}%
        %{--<a class="brand" href="http://www.bootply.com"><g:img class="" dir="images" file="logo.png" width="300" height="100"/></a>--}%
        %{--<a class="brand" href="http://www.bootply.com">THE IDEA MACHINE</a>--}%
        %{--<div class="nav">--}%
        %{--<ul class="nav">--}%
        %{--<li><button id="viewNew" class="btn btn-large btn-primary viewTypeButton" type="button"  >View New Ideas</button></li>--}%
        %{--<li><button id="viewHot" class="btn btn-large btn-primary viewTypeButton" type="button">View Hot Ideas</button></li>--}%

        %{--</ul>--}%
        %{--<ul class="nav pull-right">--}%
        %{--<li><a href="#">About</a></li>--}%
        %{--<li><a href="#">Contact</a></li>--}%
        %{--<li><a href="#">Sign Out</a></li>--}%
        %{--</ul>--}%
        %{--</div><!--/.nav-collapse -->--}%
        %{--</div>--}%
        %{--</div>--}%
        %{--</div>--}%

        <div class="navbar navbar-fixed-top hide" id="navbar">
            <div class="navbar-inner">
                <div class="container">

                    <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>

                    <!-- Be sure to leave the brand out there if you want it shown -->
                    %{--<a class="brand" href="#"><g:img class="logo" dir="images" file="logo.png"/></a>--}%
                    <a class="logo" href="#"><h2>THE IDEA <span class="highlight">MACHINE</span></h2></a>

                    <!-- Everything you want hidden at 940px or less, place within here -->
                    <div class="nav-collapse collapse">
                        <!-- .nav, .navbar-search, .navbar-form, etc -->
                        %{--<ul class="nav">--}%
                        %{--<li><button id="viewNew" class="btn btn-large btn-primary viewTypeButton" type="button"  >View New Ideas</button></li>--}%
                        %{--<li><button id="viewHot" class="btn btn-large btn-primary viewTypeButton" type="button">View Hot Ideas</button></li>--}%

                        %{--</ul>--}%
                        <ul class="nav pull-right">
                            <li><a href="#">About</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Sign Out</a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>

        <div class="row-fluid controlsMain hide" id="controlsMain">
            <div class="span12" style="text-align: center">
                <div>
                    <button id="viewHot" class="btn btn-large btn-primary viewTypeButton"
                            type="button">View Hot Ideas</button>
                    <button id="viewNew" class="btn btn-large btn-primary viewTypeButton"
                            type="button">View New Ideas</button>
                </div>
            </div>
        </div>

        <div class="row-fluid">
            <div id="sidebar" class="sidebar span3">
                <div class="share hide" id="share">
                    <h2>Follow <br/>
                        <span class="highlight-big">The Idea Machine</span> on twitter</h2>

                    <p><a href="https://twitter.com/twitterapi" class="twitter-follow-button" data-show-count="false"
                          data-lang="en">Follow @twitterapi</a></p>

                    <p>The Highest voted/most re-tweeted ideas are automatically tweeted by the idea machine</p>
                    <button id="closeShare" class="btn btn-large btn-primary" type="button">Close</button>
                </div>

            </div>

            <div id="tweetsContentWrapper" class="span9" style="margin-top: 60px;">
                <ul id="tweetsContent">

                </ul>
            </div>
        </div>

    </div>

    %{--<div class="row-fluid" style="margin-top: 60px;">--}%

    %{--</div>--}%
</div>


<g:javascript>

    $(document).ready(function() {
        init("${resource(dir: 'images', file: 'landscape.png')}");

    });

</g:javascript>
</body>
</html>