package edu.mum.ea.socialnetwork.services;

import edu.mum.ea.socialnetwork.domain.Likes;

public interface LikeService  {
    Likes save(Likes likes);

    void remove(Likes likes);

    Likes find(Long id);
}
