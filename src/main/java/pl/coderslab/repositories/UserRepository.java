package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.models.User;

public interface UserRepository extends JpaRepository<User,Long> {
    User findUserByUsernameIgnoreCase(String username);
    User findUserByEmailIgnoreCase(String email);
    User findUserById(Long userId);
}