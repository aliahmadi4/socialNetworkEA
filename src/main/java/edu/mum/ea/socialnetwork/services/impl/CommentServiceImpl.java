package edu.mum.ea.socialnetwork.services.impl;

import edu.mum.ea.socialnetwork.domain.Comments;
import edu.mum.ea.socialnetwork.repository.CommentRepository;
import edu.mum.ea.socialnetwork.services.CommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CommentServiceImpl implements CommentsService {

    @Autowired
    CommentRepository commentRepository;

    @Override
    public Comments save(Comments comments) {
        return commentRepository.save(comments);
    }

    @Override
    public Comments getAllComment(Comments comments) {
        return null;
    }


}