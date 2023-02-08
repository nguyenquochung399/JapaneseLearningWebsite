var currentData;
const inputMap = new Map();

$(document).ready(function () {
    loadMessage(); // This will run on page load
    setInterval(function () {
        loadMessage(); // this will run after every 3 seconds
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

    $("#chat-form").on("submit", function (e) {
        var dataString = $("#chat-form").serialize();
        var map = deparam(dataString);
        var chatContent = map.chatContent;
        //var uid = map.chatUserID;
        //var sid = map.sessionID;
        if (chatContent !== "") {
            $.ajax({
                type: "POST",
                url: "ChatController?" + dataString,
                success: function () {
                    $('#chat-content').val("");
                    loadMessage();
                }
            });
        }
        e.preventDefault();
    });
});

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

function loadMessage() {
    $.ajax({
        type: "GET",
        url: "ChatContentController",
        success: function (data) {
            if (data !== null) {
                // Only change message display if data is different
                if (currentData !== data) {
                    currentData = data;

                    $('#message-list').html(data);
                    scrollToBottom();
                }
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