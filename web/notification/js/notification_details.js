var currentPage = 1;
var loadLimit = -1;
var pageLimit = -1;
var pageCount = -1;

$(document).ready(function () {
    document.title = $('#title').text();
    loadLimit = $('#load-limit').text();
    pageLimit = $('#page-limit').text();
    pageCount = $('#page-count').text();
    let displayCount = 0;

    for (let i = 1; i <= pageCount; i++) {
        if (i >= 1) {
            displayCount = displayCount + 1;
            if (displayCount <= pageLimit) {
                $('#page-num-' + i).css("display", "block");
            } else {
                $('#page-num-' + i).css("display", "none");
            }
        } else {
            $('#page-num-' + i).css("display", "none");
        }
    }

    var initActivePage = $('#page-num-1');

    if (initActivePage.prev().hasClass("prevNext")) {
        initActivePage.prev().css("pointer-events", "none");
        initActivePage.prev().css("cursor", "default");
        initActivePage.prev().css("background-color", "#e6e6e6");
        initActivePage.prev().css("color", "#c5c5c5");
    }

    if (initActivePage.next().hasClass("prevNext")) {
        initActivePage.next().css("pointer-events", "none");
        initActivePage.next().css("cursor", "default");
        initActivePage.next().css("background-color", "#e6e6e6");
        initActivePage.next().css("color", "#c5c5c5");
    }
});

function prevPage() {
    var lastActivePage = $('.pagination > .active');
    var currentActivePage = $('.pagination > .active').prev();

    // re-enable prev and next button
    $('.prevNext').css("pointer-events", "auto");
    $('.prevNext').css("cursor", "pointer");
    $('.prevNext').css("background-color", "#fff");
    $('.prevNext').css("color", "#000");

    if (currentActivePage.prev().hasClass("prevNext")) {
        currentActivePage.prev().css("pointer-events", "none");
        currentActivePage.prev().css("cursor", "default");
        currentActivePage.prev().css("background-color", "#e6e6e6");
        currentActivePage.prev().css("color", "#c5c5c5");
    }

    lastActivePage.removeClass("active");
    currentActivePage.addClass("active");

    currentPage = currentPage - 1;
    loadPage(currentPage);
}

function nextPage() {
    var lastActivePage = $('.pagination > .active');
    var currentActivePage = $('.pagination > .active').next();

    // re-enable prev and next button
    $('.prevNext').css("pointer-events", "auto");
    $('.prevNext').css("cursor", "pointer");
    $('.prevNext').css("background-color", "#fff");
    $('.prevNext').css("color", "#000");

    if (currentActivePage.next().hasClass("prevNext")) {
        currentActivePage.next().css("pointer-events", "none");
        currentActivePage.next().css("cursor", "default");
        currentActivePage.next().css("background-color", "#e6e6e6");
        currentActivePage.next().css("color", "#c5c5c5");
    }

    lastActivePage.removeClass("active");
    currentActivePage.addClass("active");

    currentPage = currentPage + 1;
    loadPage(currentPage);
}

function loadPage(pageNum) {
    // display none all child
    $('#notif-container > .notif-title-container').css("display", "none");

    // re-enable prev and next button
    $('.prevNext').css("pointer-events", "auto");
    $('.prevNext').css("cursor", "pointer");
    $('.prevNext').css("background-color", "#fff");
    $('.prevNext').css("color", "#000");

    var lastActivePage = $('.pagination > .active');
    var currentActivePage = $('#page-num-' + pageNum);
    var startNum = ((pageNum - 1) * loadLimit) + 1;
    var endNum = pageNum * loadLimit;

    for (let i = startNum; i <= endNum; i++) {
        $('#notif-title-container-id-' + i).attr("style", "display: block !important");
    }

    if (currentActivePage.prev().hasClass("prevNext")) {
        currentActivePage.prev().css("pointer-events", "none");
        currentActivePage.prev().css("cursor", "default");
        currentActivePage.prev().css("background-color", "#e6e6e6");
        currentActivePage.prev().css("color", "#c5c5c5");
    }

    if (currentActivePage.next().hasClass("prevNext")) {
        currentActivePage.next().css("pointer-events", "none");
        currentActivePage.next().css("cursor", "default");
        currentActivePage.next().css("background-color", "#e6e6e6");
        currentActivePage.next().css("color", "#c5c5c5");
    }

    lastActivePage.removeClass("active");
    currentActivePage.addClass("active");
    let tmpCount = 0;

    for (let i = 1; i <= pageCount; i++) {
        if (i >= pageNum) {
            tmpCount = tmpCount + 1;
            if (tmpCount <= pageLimit) {
                $('#page-num-' + i).css("display", "block");
            } else {
                $('#page-num-' + i).css("display", "none");
            }
        } else {
            $('#page-num-' + i).css("display", "none");
        }
    }
    
    let offset = pageLimit - tmpCount;
    
    while (offset > 0) {
        $('#page-num-' + (pageNum - offset)).css("display", "block");
        offset = offset - 1;
    }
    
    currentPage = pageNum;
}