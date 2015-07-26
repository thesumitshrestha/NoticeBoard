<%@ page import="noticeboard.Notice" %>

<div class="ui form">
    <div class="fieldcontain ${hasErrors(bean: noticeInstance, field: 'category', 'error')} required">
        <label for="category">
            <g:message code="notice.category.label" default="Category" />
            <span class="required-indicator">*</span>
        </label>
        <select name="category" required="" value="${noticeInstance?.category}">
            <option value="clubActivities">Club Activities</option>
            <option value="administration">Administration</option>
            <option value="batch">Batch</option>
            <option value="other">Other</option>
        </select>
    </div>
    %{--<g:textField name="category" required="" value="${noticeInstance?.category}"/>--}%
    <div class="fieldcontain ${hasErrors(bean: noticeInstance, field: 'title', 'error')} required">
        <label for="title">
            <g:message code="notice.title.label" default="Title" />
            <span class="required-indicator">*</span>
        </label>
        <div class="field">
            <g:textField placeholder="Title of the Notice" name="title" required="" value="${noticeInstance?.title}"/>
        </div>
    </div>
    <div class="fieldcontain ${hasErrors(bean: noticeInstance, field: 'description', 'error')} required">
        <div class="ui form">
            <label for="description">
                <g:message code="notice.description.label" default="Description" />
                <span class="required-indicator">*</span>
            </label>
            <div class="field">
                <g:textField style="height:100px" name="description" required="" value="${noticeInstance?.description}" placeholder="Content of the Notice"/>
            </div>
        </div>
    </div>

    <div class="fieldcontain ${hasErrors(bean: noticeInstance, field: 'noticeDate', 'error')} required">
        <label for="noticeDate">
            <g:message code="notice.noticeDate.label" default="Notice Date" />
            <span class="required-indicator">*</span>
        </label>
        <g:datePicker name="noticeDate" precision="day"  value="${noticeInstance?.noticeDate}"  />

    </div>
</div>

