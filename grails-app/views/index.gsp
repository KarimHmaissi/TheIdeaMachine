<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="main">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <r:require modules="application,bootstrap, backstretch, jscroll, jqueryui, sticky, waypoint"/>

    <title>The Idea Machine</title>

</head>

<body>

<a href="https://github.com/KarimHmaissi"><img style="position: absolute; top: 0; right: 0; border: 0;"
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

            $.backstretch("${resource(dir: 'images', file: 'landscape.png')}");

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

    });

</g:javascript>
</body>
</html>