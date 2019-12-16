package edu.mum.ea.socialnetwork.services.impl;

import edu.mum.ea.socialnetwork.domain.Likes;
import edu.mum.ea.socialnetwork.repository.LikeRepository;
import edu.mum.ea.socialnetwork.services.LikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeServiceImpl implements LikeService {

    @Autowired
    LikeRepository likeRepository;

    @Override
    public Likes save(Likes likes) {
        return likeRepository.save(likes);
    }

    @Override
    public void remove(Likes likes) {
        likeRepository.delete(likes);
    }

    @Override
    public Likes find(Long id) {
        return likeRepository.getOne(id);
    }

}