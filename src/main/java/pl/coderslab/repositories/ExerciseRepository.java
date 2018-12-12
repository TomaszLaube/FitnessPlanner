package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.models.Exercise;

import java.util.List;

public interface ExerciseRepository extends JpaRepository<Exercise,Long> {
    Exercise findExerciseById(Long exerciseId);
    long countByUserId(Long userId);
    List<Exercise> findAllByUserIdOrderByCreatedDesc(Long userId);
    List<Exercise> findAllByOrderByCreatedDesc();
}
