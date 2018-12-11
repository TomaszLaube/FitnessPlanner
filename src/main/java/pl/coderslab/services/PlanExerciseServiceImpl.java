package pl.coderslab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.models.PlanExercise;
import pl.coderslab.repositories.PlanExerciseRepository;

import javax.transaction.Transactional;
import java.util.List;
@Service
@Transactional
public class PlanExerciseServiceImpl implements PlanExerciseService<PlanExercise> {

    @Autowired
    PlanExerciseRepository planExerciseRepository;

    @Override
    public void save(PlanExercise planExercise) {
        planExerciseRepository.save(planExercise);
    }

    @Override
    public void delete(PlanExercise planExercise) {
        planExerciseRepository.delete(planExercise);
    }

    @Override
    public List<PlanExercise> findAllByPlanAndDay(Long planId, Long dayId) {
        return planExerciseRepository.findAllByPlanIdAndDayId(planId,dayId);
    }

    @Override
    public PlanExercise findById(Long planExerciseId) {
        return planExerciseRepository.findPlanExerciseById(planExerciseId);
    }

    @Override
    public PlanExercise findforReorder(Long planId, Long dayId, Long exerciseOrder) {
        return planExerciseRepository.findPlanExerciseByPlanIdAndDayIdAndExerciseOrder(planId,dayId,exerciseOrder);
    }
}
