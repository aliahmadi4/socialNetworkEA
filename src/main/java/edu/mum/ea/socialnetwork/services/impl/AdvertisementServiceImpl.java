package edu.mum.ea.socialnetwork.services.impl;

import edu.mum.ea.socialnetwork.domain.Advertisement;
import edu.mum.ea.socialnetwork.repository.AdvertisementRepository;
import edu.mum.ea.socialnetwork.services.AdvertisementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AdvertisementServiceImpl implements AdvertisementService {
    private AdvertisementRepository advertisementRepository;

    @Autowired
    public AdvertisementServiceImpl(AdvertisementRepository advertisementRepository) {
        this.advertisementRepository = advertisementRepository;
    }

    @Override
    public List<Advertisement> getAdList() {
        return advertisementRepository.findAll();
    }

    @Override
    public Advertisement findAdById(Long adId) {
        return advertisementRepository.getOne(adId);
    }

    @Override
    public void save(Advertisement advertisement) {
        advertisementRepository.save(advertisement);
    }
}
