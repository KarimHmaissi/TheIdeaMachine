<%@ page import="org.hmaissi.theideadmachine.twitter.Message" %>



<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'tweetId', 'error')} required">
    <label for="tweetId">
        <g:message code="message.tweetId.label" default="Tweet Id"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="tweetId" type="number" value="${messageInstance.tweetId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'retweetCount', 'error')} required">
    <label for="retweetCount">
        <g:message code="message.retweetCount.label" default="Retweet Count"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="retweetCount" type="number" value="${messageInstance.retweetCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'text', 'error')} ">
    <label for="text">
        <g:message code="message.text.label" default="Text"/>

    </label>
    <g:textField name="text" value="${messageInstance?.text}"/>
</div>

