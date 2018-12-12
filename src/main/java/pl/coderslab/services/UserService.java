package pl.coderslab.services;

import java.util.List;

public interface UserService<U> {
    void saveUser(U u);
    void updateUser(U u);
    void deleteUser(U u);
    void changePassword(U u);
    U findById(Long userId);
    U findByUsername(String username);
    U findByEmail(String email);
    U findByUsernameStatus(String username, boolean enabled);
    List<U> findAllUsers();
}
