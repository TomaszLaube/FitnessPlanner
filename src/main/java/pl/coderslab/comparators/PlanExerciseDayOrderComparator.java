package pl.coderslab.comparators;

import pl.coderslab.models.PlanExercise;

import java.util.Comparator;

public class PlanExerciseDayOrderComparator implements Comparator<PlanExercise> {
    @Override
    public int compare(PlanExercise p1, PlanExercise p2) {
        return (int)(p1.getExerciseOrder() - p2.getExerciseOrder());
    }
}
