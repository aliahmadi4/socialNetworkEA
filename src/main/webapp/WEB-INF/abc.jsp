'<div class="post-bar">'+

'<div class="post_topbar">'+
'<div class="usy-dt">'+
'<img src="/media/profile/' + post.user.profile.profilePhoto + '" alt="" width="45px" height="45px">'+
'<div class="usy-name">'+
'<a href="/profile/'+ post.user.id + '" />'+
'<h3>'+post.user.profile.firstName+' '+post.user.profile.lastName+'</h3></a>'+
'<span><img src="/images/clock.png" alt="">'+post.creationDate+'"/></span>'+
'</div>'+
'</div>'+
'</div>'+
'<div class="epi-sec">'+
'&nbsp'+
'</div>'+
'<div class="job_descp">'+
'<p>'+post.text+'</p>'+
'</div>'+
'<div class="job_descp">'+
'<img src="/media/post/'+post.photo+' "/>'+
'</div>'+
'<div class="job_descp">'+
'<video width="100%" controls>'+
'<source src="/media/post/'+post.video+'" type="video/mp4">'+
'Your browser does not support HTML5 video.'+
'</video>'+
'</div>'+

'<div class="job-status-bar">'+
'<ul class="like-com">'+
'<li>'+

'<a href="javascript:;" class="addlike" data-id="'+post.id+' data-post='+post+'">'+
'<i class="fas fa-heart"></i>'+
'<span class="'+post.id+'-likes">'+post.likeCount+'</span> Like'+
'</a>'+
'</li>'+
'<li>'+
'<a href="javascript:;" class="addcomment " data-id="'+post.id+' data-post='+post+'"><i class="fas fa-comment-alt"></i><span class="'+post.id+'-comments">'+post.commentCount+'</span> Comments</a>'+

'</li>'+
'</ul>'+

'</div>'+
'<div>'+
'<form class="post-comment" data-id="'+post.id+' data-post="'+post+'">'+

'<div class="cp-field">'+
'<div class="cpp-fiel">'+
'<input type="text" name="text" class="comment-text '+post.id+'-text" placeholder="write your comment here" required   />'+
'</div>'+
'</div>'+
'<input type="submit" class="comment-submit" value="Submit" style="display: none">'+
'</form>'+
'</div>'+
'<div class="job-status-bar">'+
'<ul class="comments-list '+post.id+'-commentlist">'+

'</ul>'+
'</div>'+
'</div>'