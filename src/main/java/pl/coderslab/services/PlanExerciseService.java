package pl.coderslab.services;

import java.util.List;

public interface PlanExerciseService<P> {
    void save(P p);
    void delete(P p);
    List<P> findAllByPlanAndDay(Long planId, Long dayId);
    P findById(Long planExerciseId);
    P findforReorder(Long planId, Long dayId, Long exerciseOrder);
}
