$(document).ready(function(){

    //Ali--from editProfile.jsp when hit change passwor button
    $("#changePasswordBtn").click(function (event) {
        event.preventDefault();
        let old = $("#old-password").val();
        let newp = $("#new-password").val();
        let repeat = $("#repeat-password").val();

        let domain = document.URL;
        let url = domain.replace("view/user/editProfile.jsp","");
        url = url + "changePassword";

        $.post(url, {"old-password": old, "new-password": newp, "repeat-password": repeat})
            .then(function (response) {
                $("#errorMsg").text(response);
            })

    });

    // $("#saveInfo").click(function (event) {
    //     event.preventDefault();
    //     let firstName = $("#firstName").val();
    //     let lastName = $("#lastName").val();
    //     let description = $("#description").val();
    //     let email = $("#email").val();
    //
    //     let domain = document.URL;
    //     let url = domain.replace("view/user/editProfile.jsp","");
    //     url = url + "changeInfo";
    //
    //     $.post(url, {"firstName": firstName, "lastName": lastName, "description": description, "email": email})
    //         .then(function (response) {
    //             alert(response);
    //         })
    //
    // });

    $("#follow").on('click', 'span', function () {

        let self = $(this);
        let follower_id = self.attr("data-id");
        //get
        let domain = document.URL;
        let url = domain.replace("home","");
        url = url + "follow";
        $.get(url,{"follower_id": follower_id}).done(function (data) {

            self.append("<span>Followed</span>");

        }).fail(function (err) {
            console.log(err);
        })
    });

    $(".spinner").click(function () {

        let domain = document.URL;
        let url = domain.replace("home","");
        url = url + "loadMorePost";

        $.get(url)
            .then(function (response) {
                alert(response);
            })
    });


});