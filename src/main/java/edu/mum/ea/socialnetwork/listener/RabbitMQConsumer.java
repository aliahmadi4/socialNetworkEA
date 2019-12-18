package edu.mum.ea.socialnetwork.listener;

import edu.mum.ea.socialnetwork.config.RabbitMQDirectConfig;
import edu.mum.ea.socialnetwork.domain.Messages;
import edu.mum.ea.socialnetwork.domain.Notification;
import edu.mum.ea.socialnetwork.domain.Post;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.services.NotificationService;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class RabbitMQConsumer {

    @Autowired
    NotificationService notificationService;

    @RabbitListener(queues = RabbitMQDirectConfig.QUEUE)
    public void recievedMessage(Notification notification) {
        System.out.println("Recieved Message From RabbitMQ: " + notification.getPost().getText());



//        User user  = post.getUser();
//        List<User> users = user.getFollowing();
//        System.out.println("Following count: " + users.size());
//        users.forEach((u) -> System.out.println("User NAme is :" + u.getUsername()));
    }
}
