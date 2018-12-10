package pl.coderslab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.models.Exercise;
import pl.coderslab.repositories.ExerciseRepository;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ExerciseServiceImpl implements ExerciseService<Exercise> {

    @Autowired
    ExerciseRepository exerciseRepository;

    @Override
    public void save(Exercise exercise) {
        exercise.setCreated(new Timestamp(new Date().getTime()));
        exerciseRepository.save(exercise);
    }

    @Override
    public void update(Exercise exercise) {
        exercise.setUpdated(new Timestamp(new Date().getTime()));
        exerciseRepository.save(exercise);
    }

    @Override
    public void delete(Exercise exercise) {
        exerciseRepository.delete(exercise);
    }

    @Override
    public Exercise findById(Long exerciseId) {
        return exerciseRepository.findExerciseById(exerciseId);
    }

    @Override
    public long countByUserId(Long userId) {
        return exerciseRepository.countByUserId(userId);
    }

    @Override
    public List<Exercise> findAllByUser(Long userId) {
        return exerciseRepository.findAllByUserIdOrderByCreatedDesc(userId);
    }
}
