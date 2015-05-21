<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Projects Overview</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
<link rel="stylesheet" href="/easyscrumweb/resources/css/card.css">
<link rel="stylesheet" href="/easyscrumweb/resources/css/card.min.css">
<link rel="stylesheet" href="/easyscrumweb/resources/css/screenshare.css">
<link rel="chrome-webstore-item" href="https://chrome.google.com/webstore/detail/ajhifddimkapgcifgcodmmfdlknahffk">
        <script>
            document.createElement('article');
            document.createElement('footer');
        </script>
        
        <!-- scripts used for screen-sharing -->
        <script src='/easyscrumweb/resources/js/screenshare/firebase.js'> </script>
        <script src="/easyscrumweb/resources/js/screenshare/getScreenId.js"> </script>
        <script src="/easyscrumweb/resources/js/screenshare/screen.js"> </script>
</head>
<body>

	<!-- Main navbar -->
	
	<%@ include file="../Component/UserMenupage.jsp"%>

	<div id="cover" class="backprofil">

		<div class="panel panel-default clientPanel">
			<div class="panel-heading">Demo Presentation</div>
			<div class="panel-body">
			<!-- just copy this <section> and next script -->
			
            <section class="experiment">
                 <section  <c:if test="${sessionScope.user.type!='4'}">style="visibility: hidden;"</c:if>>
                    <span>
                        Private ?? <a href="/screen-sharing/" target="_blank" title="Open this link for private screen sharing!"><code><strong id="unique-token">#123456789</strong></code></a>
                    </span>
                    <input type="text" id="user-name" placeholder="Your Name">
                    <button id="share-screen" class="setup">Share Your Screen</button>
                </section>
                <center>
                <!-- list of all available broadcasting rooms -->
                <table id="rooms-list"></table>
                </center>
                <!-- local/remote videos container -->
                <center>
                <div id="videos-container"></div>
                </center>
            </section>
        
            <script>
                // Muaz Khan     - https://github.com/muaz-khan
                // MIT License   - https://www.webrtc-experiment.com/licence/
                // Documentation - https://github.com/muaz-khan/WebRTC-Experiment/tree/master/screen-sharing
                
                var videosContainer = document.getElementById("videos-container") || document.body;
                var roomsList = document.getElementById('rooms-list');
                
                var screensharing = new Screen();
                
                screensharing.onscreen = function(_screen) {
                    var alreadyExist = document.getElementById(_screen.userid);
                    if (alreadyExist) return;

                    if (typeof roomsList === 'undefined') roomsList = document.body;

                    var tr = document.createElement('tr');
                    
                    tr.id = _screen.userid;
                    tr.innerHTML = '<td>' + _screen.userid + ' shared his screen.</td>' +
                            '<td><button class="join">Preview His Screen</button></td>';
                    roomsList.insertBefore(tr, roomsList.firstChild);

                    var button = tr.querySelector('.join');
                    button.setAttribute('data-userid', _screen.userid);
                    button.setAttribute('data-roomid', _screen.roomid);
                    button.onclick = function() {
                        var button = this;
                        button.disabled = true;
                        
                        var _screen = {
                            userid: button.getAttribute('data-userid'),
                            roomid: button.getAttribute('data-roomid')
                        };
                        alert("going");
                        screensharing.view(_screen);
                        alert("going");
                    };
                };

                // on getting each new screen
                screensharing.onaddstream = function(media) {
                    media.video.id = media.userid;
                    
                    var video = media.video;
                    video.setAttribute('controls', true);
                    videosContainer.insertBefore(video, videosContainer.firstChild);
                    video.play();
                };

                // using firebase for signaling
                // screen.firebase = 'signaling';

                // if someone leaves; just remove his screen
                screensharing.onuserleft = function(userid) {
                    var video = document.getElementById(userid);
                    if (video && video.parentNode) video.parentNode.removeChild(video);
                };

                // check pre-shared screens
                screensharing.check();

                document.getElementById('share-screen').onclick = function() {
                    screensharing.share();
                    this.disabled = true;
                };
                
                document.getElementById('share-screen').onclick = function() {
                    var username = document.getElementById('user-name');
                    username.disabled = this.disabled = true;
                    
                    screensharing.isModerator = true;
                    screensharing.userid = username.value;
                    
                    screensharing.share();
                };
                
                (function() {
                    var uniqueToken = document.getElementById('unique-token');
                    if (uniqueToken)
                        if (location.hash.length > 2) uniqueToken.parentNode.parentNode.parentNode.innerHTML = '<Label style="text-align:center;"><a href="' + location.href + '" target="_blank">Share this link</a></Label>';
                        else uniqueToken.innerHTML = uniqueToken.parentNode.parentNode.href = '#' + (Math.random() * new Date().getTime()).toString(36).toUpperCase().replace( /\./g , '-');
                })();
                
                screensharing.onNumberOfParticipantsChnaged = function(numberOfParticipants) {
                    if(!screensharing.isModerator) return;
                    
                    document.title = numberOfParticipants + ' users are viewing your screen!';
                    var element = document.getElementById('number-of-participants');
                    if (element) {
                        element.innerHTML = numberOfParticipants + ' users are viewing your screen!';
                    }
                };
            </script>
            <section class="extentions">
                <h2>Prerequisites</h2>
                <ol>
                    <li>
                        Chrome? 
                        <a href="https://chrome.google.com/webstore/detail/screen-capturing/ajhifddimkapgcifgcodmmfdlknahffk" target="_blank">Install chrome extension</a>.
                   
                         / <a href="https://github.com/muaz-khan/Chrome-Extensions/tree/master/desktopCapture">Source Code</a>
                    </li>
                    
                    <li>
                        Firefox? <a href="https://www.webrtc-experiment.com/store/firefox-extension/enable-screen-capturing.xpi">Install Firefox Extension</a> / <a href="https://github.com/muaz-khan/Firefox-Extensions/tree/master/enable-screen-capturing">Source Code</a>
                    </li>
                </ol>
            </section>
			</div>
		</div>
	</div>
	<div class="stickfoot">
		<center>CHAT SPACE</center>
	</div>
	<content tag="bottom_javascript">

</content>
</body>
</html>