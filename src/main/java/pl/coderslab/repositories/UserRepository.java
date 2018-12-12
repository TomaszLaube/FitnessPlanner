package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.models.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User,Long> {
    User findUserByUsernameIgnoreCase(String username);
    User findUserByEmailIgnoreCase(String email);
    User findUserById(Long userId);
    User findUserByUsernameIgnoreCaseAndEnabled(String username, boolean enabled);
}
