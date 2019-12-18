package edu.mum.ea.socialnetwork.services.impl;

import edu.mum.ea.socialnetwork.domain.User;

public interface MailService {

    void sendEmail(User user, String subject, String body);

}
