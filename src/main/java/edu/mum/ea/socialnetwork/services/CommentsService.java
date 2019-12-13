package edu.mum.ea.socialnetwork.services;

import edu.mum.ea.socialnetwork.domain.Comments;
import edu.mum.ea.socialnetwork.domain.Likes;


public interface CommentsService {
    public Comments save(Comments comments);
    public Comments getAllComment(Comments comments);
}
