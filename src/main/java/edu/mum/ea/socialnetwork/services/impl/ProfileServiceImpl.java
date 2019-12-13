package edu.mum.ea.socialnetwork.services.impl;

import edu.mum.ea.socialnetwork.domain.Profile;
import edu.mum.ea.socialnetwork.repository.ProfileRepository;
import edu.mum.ea.socialnetwork.services.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProfileServiceImpl implements ProfileService {

    @Autowired
    ProfileRepository profileRepository;

    @Override
    public Profile findById(Long id) {
        return profileRepository.findById(id).orElse(null);
    }
}
