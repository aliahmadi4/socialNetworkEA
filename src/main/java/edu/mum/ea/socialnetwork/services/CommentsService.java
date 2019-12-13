package edu.mum.ea.socialnetwork.services;

import edu.mum.ea.socialnetwork.domain.Comments;

public interface CommentsService {
    Comments save(Comments comments);

    Comments getAllComment(Comments comments);
}
