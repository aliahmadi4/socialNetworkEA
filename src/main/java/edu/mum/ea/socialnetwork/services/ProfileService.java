package edu.mum.ea.socialnetwork.services;

import edu.mum.ea.socialnetwork.domain.Profile;

public interface ProfileService {
    Profile save(Profile profile);

    Profile findById(Long id);
}
