package edu.mum.ea.socialnetwork.repository;

import edu.mum.ea.socialnetwork.domain.Profile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProfileRepository extends JpaRepository<Profile, Long> {
}
