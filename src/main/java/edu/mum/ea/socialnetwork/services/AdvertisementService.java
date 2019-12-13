package edu.mum.ea.socialnetwork.services;

import edu.mum.ea.socialnetwork.domain.Advertisement;

import java.util.List;

public interface AdvertisementService {
    List<Advertisement> getAdList();

    Advertisement findAdById(Long adId);

    void save(Advertisement advertisement);
}
