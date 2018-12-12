package pl.coderslab.services;

import java.util.List;

public interface ExerciseService<E> {
    void save(E e);
    void update(E e);
    void delete(E e);
    E findById(Long exerciseId);
    long countByUserId(Long userId);
    List<E> findAllByUser(Long userId);
    List<E> findAll();
}
