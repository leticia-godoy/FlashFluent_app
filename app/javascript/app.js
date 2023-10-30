document.addEventListener('DOMContentLoaded', function () {
    var commentIcon = document.getElementById('comment-icon');
    var commentRow = document.getElementById('comment-row');

    if (commentIcon && commentRow) {
        commentIcon.addEventListener('click', function () {
            commentRow.style.display = commentRow.style.display === 'none' ? 'block' : 'none';
        });
    }
});  