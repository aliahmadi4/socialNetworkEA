package edu.mum.ea.socialnetwork.services;

import edu.mum.ea.socialnetwork.domain.User;

public interface MailService {

    void sendEmail(User user, String subject, String body);

}
