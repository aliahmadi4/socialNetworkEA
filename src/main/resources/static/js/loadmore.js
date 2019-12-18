$(document).ready(function() {

    $("#fucker").click(function() {
        alert("oh you clicked")
    })

    $(document).on("click", "clickme", (function () {
        alert("shit")
    }))

    let page = 0;
    $("#loadmore").click(function () {
        page += 1;
        loadMorePost(page);
    })

    function loadMorePost(page) {
        console.log("page" + page);
        $.ajax({
            type: "GET",
            url: "/" + page,
            dataType: 'json',
            success: function (data) {
                // console.log(data.content)
                let result2 = "";
                $(data.content).each(function (index, post) {

                    result2 +=
                        '<div class="post-bar">' +

                        '<div class="post_topbar">' +
                        '<div class="usy-dt">';


                    if (post.user.profile.profilePhoto) {

                        result2 += '<img src="/media/profile/' + post.user.profile.profilePhoto + '" alt="" width="45px" height="45px"/>';
                    } else {
                        result2 += '<img src="/images/user.jpg" alt="" width="45px" height="45px"/>';
                    }
                    result2 +=
                        '<div class="usy-name">' +
                        '<a href="/profile/' + post.user.id + '" />' +
                        '<h3>' + post.user.profile.firstName + ' ' + post.user.profile.lastName + '</h3></a>' +
                        '<span><img src="/images/clock.png" alt=""/>' + post.creationDate + '</span>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '<div class="epi-sec">' +
                        '&nbsp' +
                        '</div>' +
                        '<div class="job_descp">' +
                        '<p>' + post.text + '</p>' +
                        '</div>';


                    if (post.photo) {
                        result2 +=
                            '<div class="job_descp">' +
                            '<img src="/media/post/' + post.photo + ' "/>' +
                            '</div>';
                    }
                    ;

                    if (post.video) {
                        result2 +=
                            '<div class="job_descp">' +
                            '<video width="100%" controls>' +
                            '<source src="/media/post/' + post.video + '" type="video/mp4"/>' +
                            'Your browser does not support HTML5 video.' +
                            '</video>' +
                            '</div>';

                    }
                    ;


                    let count = 0;
                    let likeid = 0;
                    let curUser = $(".load-area").data("id");
                    console.log("curUser" + curUser);

                    post.likes.forEach(function (like) {

                        if (like.user.id == curUser) {
                            count += 1;
                            likeid = like.user.id;
                        }
                    })


                    result2 +=
                        '<div class="job-status-bar">' +
                        '<ul class="like-com">' +
                        '<li>';

                    if (count == 0) {
                        result2 += '<a href="javascript:;" class="addlike ' + post.id + '-likes-wrap not-active" data-likeid="' + likeid + '" data-id="' + post.id + '" data-post="' + post + '">';
                    } else {
                        result2 += '<a href="javascript:;" class="addlike ' + post.id + '-likes-wrap active" data-likeid="' + likeid + '" data-id="' + post.id + '" data-post="' + post + '">';
                    }
                    result2 +=
                        '<i class="fas fa-heart"></i><span class="' + post.id + '-likes">' + post.likeCount + '</span> Like</a>' +
                        '</li>' +
                        '<li>' +
                        '<a href="javascript:;" class="addcomment " data-id="' + post.id + '" data-post="' + post + '"><i class="fas fa-comment-alt"></i><span class="' + post.id + '-comments">' + post.commentCount + '</span> Comments</a>' +

                        '</li>' +
                        '</ul>' +

                        '</div>' +


                        '<div>' +
                        '<form class="post-comment" data-id="' + post.id + ' data-post="' + post + '">' +

                        '<div class="cp-field">' +
                        '<div class="cpp-fiel">' +
                        '<input type="text" name="text" class="comment-text ' + post.id + '-text" placeholder="write your comment here" required   />' +
                        '</div>' +
                        '</div>' +
                        '<input type="submit" class="comment-submit" value="Submit" style="display: none">' +
                        '</form>' +
                        '</div>' +
                        '<div class="job-status-bar">' +
                        '<ul class="comments-list ' + post.id + '-commentlist">' +
                        '</ul>' +

                        '</div>';

                    result2 += '</div>';

                })
                console.log(result2);
                $(".posts-section").append(result2)
            }
        })
    }





})