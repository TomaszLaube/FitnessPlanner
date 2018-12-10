package pl.coderslab.services;

public interface UserService<U> {
    void saveUser(U u);
    void updateUser(U u);
    void deleteUser(U u);
    U findById(Long userId);
    U findByUsername(String username);
    U findByEmail(String email);
}
