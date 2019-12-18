package edu.mum.ea.socialnetwork.services.impl;

import edu.mum.ea.socialnetwork.config.RabbitMQDirectConfig;
import edu.mum.ea.socialnetwork.domain.Notification;
import edu.mum.ea.socialnetwork.domain.Post;
import edu.mum.ea.socialnetwork.domain.User;
import edu.mum.ea.socialnetwork.repository.NotificationRepository;
import edu.mum.ea.socialnetwork.repository.PostRepository;
import edu.mum.ea.socialnetwork.services.NotificationService;
import edu.mum.ea.socialnetwork.services.PostService;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NotificationServiceImpl implements NotificationService {

    @Autowired
    NotificationRepository notificationRepository;

    @Autowired
    private RabbitTemplate rabbitTemplate;


    @Override
    public Notification save(Notification notification) {
        return notificationRepository.save(notification);
    }

    @Override
    public List<Notification> findNotificationByUserId(Long id) {
        return notificationRepository.findAllByUser_Id(id);

    }
}
