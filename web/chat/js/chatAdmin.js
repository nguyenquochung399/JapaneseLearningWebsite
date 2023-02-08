var currentUID;
var currentSID;
var currentData;
var currentSessions;
var lastDate;
const inputMap = new Map();
var tmpInputValue;

$(document).ready(function () {
    loadAllSessionsInit("");

    currentUID = document.getElementById("chat-user-id").value;
    currentSID = document.getElementById("session-id").value;

    setInterval(function () {
        loadAllSessions($("#search-content").val());
        loadMessage(currentUID, currentSID); // this will run after every 3 seconds
    }, 1000);

    // Set newline key in textarea to SHIFT + ENTER
    $("textarea").keydown(function (e) {
        if (e.keyCode === 13 && !e.shiftKey)
        {
            e.preventDefault();
            // Set submit key in textarea to ENTER
            $(this).closest("form").submit();
        }
    });

    // Send message to Servlet
    $("#chat-form").on("submit", function (e) {
        var dataString = $("#chat-form").serialize();
        var map = deparam(dataString);
        var uid = map.chatUserID;
        var sid = map.sessionID;
        var chatContent = map.chatContent;

        if (chatContent !== "") {
            $.ajax({
                type: "POST",
                url: "ChatAdminController?" + dataString,
                success: function () {
                    $('#chat-content').val("");
                    inputMap.delete(sid);
                    loadMessage(uid, sid);
                }
            });
        }
        e.preventDefault();
    });

});

function loadMessage(uid, sid) {
    $.ajax({
        type: "GET",
        url: "ChatAdminContentController?cUID=" + uid,
        success: function (data) {
            if (data !== null) {
                // Only change message display if data is different
                if (currentData !== data) {
                    currentData = data;

                    // If loaded data is from different session
                    if (currentUID !== uid && currentSID !== sid) {
                        // save the last session input into a map
                        tmpInputValue = $('#chat-content').val();
                        inputMap.set(currentSID, tmpInputValue);
                        // remove other sessions highlight if have any
                        $('.user-list-item').removeClass("active-uli");
                        // highlight displaying session
                        $('#user-session-' + sid).addClass("active-uli");
                        if (!($('#user-session-' + sid).hasClass("init-session"))) {
                            $('#user-session-' + sid).removeClass("unseen-uli");
                        }
                        // set hidden input data
                        $('#session-id').val(sid);
                        $('#chat-user-id').val(uid);
                    }

                    // display current session
                    $('#message-list').html(data);

                    // display tmp input of session if has any
                    if (inputMap.has(sid)) {
                        $('#chat-content').val(inputMap.get(sid));
                    } else {
                        $('#chat-content').val("");
                    }

                    // Do not do animated scroll if display session is same as last session
                    if (currentUID !== uid && currentSID !== sid) {
                        // set display session to session of loaded data
                        currentUID = uid;
                        currentSID = sid;
                        hardScrollToBottom();
                    } else {
                        scrollToBottom();
                    }
                }
            }
        }
    });
}

function loadAllSessions(searchContent) {
    $.ajax({
        type: "GET",
        url: "ChatAdminSessionController?searchContent=" + searchContent,
        success: function (data) {
            if (data !== null) {
                // Only change message display if data is different
                if (currentSessions !== data) {
                    currentSessions = data;

                    lastDate = $('#init-session > div.user-list-item > div.uli-row > div.uli-info-container > div.uli-date').val();

                    // display all sessions
                    $('#session-container').html(data);
                    $('#user-session-' + currentSID).addClass("active-uli");
                }
            }
        }
    });
}

function loadAllSessionsInit(searchContent) {
    $.ajax({
        type: "GET",
        url: "ChatAdminSessionController?searchContent=" + searchContent,
        success: function (data) {
            if (data !== null) {
                // Only change message display if data is different
                if (currentSessions !== data) {
                    currentSessions = data;

                    lastDate = $('#init-session > div.user-list-item > div.uli-row > div.uli-info-container > div.uli-date').val();

                    // display all sessions
                    $('#session-container').html(data);
                    $('#user-session-' + currentSID).addClass("active-uli");
                }
                $("#init-session").click();
            }
        }
    });
}

function scrollToBottom() {
    const element = $(`#message-list`);
    element.animate({
        scrollTop: element.prop("scrollHeight")
    }, 500);
}

function hardScrollToBottom() {
    const element = $(`#message-list`);
    element.animate({
        scrollTop: element.prop("scrollHeight")
    }, 0);
}

function deparam(query) {
    var pairs, i, keyValuePair, key, value, map = {};
    // remove leading question mark if its there
    if (query.slice(0, 1) === '?') {
        query = query.slice(1);
    }
    if (query !== '') {
        pairs = query.split('&');
        for (i = 0; i < pairs.length; i += 1) {
            keyValuePair = pairs[i].split('=');
            key = decodeURIComponent(keyValuePair[0]);
            value = (keyValuePair.length > 1) ? decodeURIComponent(keyValuePair[1]) : undefined;
            map[key] = value;
        }
    }
    return map;
}