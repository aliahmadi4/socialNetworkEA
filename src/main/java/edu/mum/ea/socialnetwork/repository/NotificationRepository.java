package edu.mum.ea.socialnetwork.repository;

import edu.mum.ea.socialnetwork.domain.Notification;
import edu.mum.ea.socialnetwork.domain.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Long> {
    List<Notification> findAllByUser_Id(Long id);

}
