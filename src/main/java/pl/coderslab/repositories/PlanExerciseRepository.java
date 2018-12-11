package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.models.PlanExercise;

import java.util.List;

public interface PlanExerciseRepository extends JpaRepository<PlanExercise,Long> {
    List<PlanExercise> findAllByPlanIdAndDayId(Long planId, Long dayId);
    PlanExercise findPlanExerciseById(Long planExerciseId);
    PlanExercise findPlanExerciseByPlanIdAndDayIdAndExerciseOrder(Long planId, Long dayId, Long exerciseOrder);
}
