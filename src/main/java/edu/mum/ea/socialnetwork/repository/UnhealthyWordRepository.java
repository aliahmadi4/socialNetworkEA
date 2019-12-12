package edu.mum.ea.socialnetwork.repository;

import edu.mum.ea.socialnetwork.domain.UnhealthyWord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UnhealthyWordRepository extends JpaRepository<UnhealthyWord, Long> {
    void deleteByWordIs(String word);

    boolean existsByWord(String word);
}
