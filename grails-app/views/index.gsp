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

    <div class="bubbleNav row-fluid">
        <a id="bubble1" class="span4 bubble" href="#aboutModel" data-0="opacity: 1" data-800="opacity: 0"
           data-toggle="modal"></a>
        <a id="bubble2" class="span4 bubble" href="#meModel" data-0="opacity: 1" data-800="opacity: 0"
           data-toggle="modal"></a>
        <a id="bubble3" href="#" class="span4 bubble" data-0="opacity: 1" data-800="opacity: 0"></a>
    </div>

    <div class="row-fluid" id="heading">
        <div class="span6 offset6 heading" data-0="opacity: 1" data-450="opacity: 0">

        </div>
    </div>

</div><!--/.container-->

<g:render template="/main/about"></g:render>
<g:render template="/main/me"></g:render>


<div class="tweetContainer container">

    <a href="#" id="scrollDown" class="scrollDown" data-0="opacity: 1" data-800="opacity: 0"></a>


    <div id="controls">

        <div class="navbar navbar-fixed-top hide" id="navbar">
            <div class="navbar-inner">
                <div class="container">

                    <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>

                    <a class="logo" href="#"><h2>THE IDEA <span class="highlight">MACHINE</span></h2></a>

                    <!-- Everything you want hidden at 940px or less, place within here -->
                    <div class="nav-collapse collapse">

                        <ul class="nav pull-right">
                            <li><a href="#meModel" data-toggle="modal">Me</a></li>
                            <li><a href="#aboutModel" data-toggle="modal">About</a></li>
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

</div>


<g:javascript>

    $(document).ready(function() {
        init("${resource(dir: 'images', file: 'landscape.png')}");

    });

</g:javascript>
</body>
</html>