package edu.mum.ea.socialnetwork.repository;

import edu.mum.ea.socialnetwork.domain.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

}
