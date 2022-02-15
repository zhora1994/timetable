package dev.zakod.plz.booking.repository;

import dev.zakod.plz.booking.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends CrudRepository<User, String> {
    Optional<User> findByEmail(String email);

    boolean existsByEmail(String email);
}
