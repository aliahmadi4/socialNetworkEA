package edu.mum.ea.socialnetwork.services;

import edu.mum.ea.socialnetwork.domain.Profile;

import java.util.List;

public interface ProfileService {
    Profile findById(Long id);

    List<Profile> findAll();

    // this function used in Following Controller to search profiles according to their first name
    List<Profile> searchProfiles(Long id, String name);

    // this function return list of profiles that user doesn't follow exclude user's profile itself
    List<Profile> unfollowedUsers(Long id);
}
